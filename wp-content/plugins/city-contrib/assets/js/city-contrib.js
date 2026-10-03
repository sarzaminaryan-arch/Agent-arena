/** City Contrib — cache-safe UI with browser-native APIs only. */
( function () {
	'use strict';

	var root = document.getElementById( 'cc-city-app' );
	if ( ! root || ! window.CC_DATA ) {
		return;
	}

	var cityId = Number( root.dataset.cityId );
	var cityName = root.dataset.cityName;
	var cityUrl = root.dataset.cityUrl;
	var i18n = CC_DATA.i18n;
	var modules = CC_DATA.modules || { auth: true, share: true, rating: true, contrib: true };
	var state = { session: null, pending: null, selectedStars: 0, rating: null };
	var $ = function ( selector, context ) { return ( context || root ).querySelector( selector ); };
	var $$ = function ( selector, context ) { return Array.prototype.slice.call( ( context || root ).querySelectorAll( selector ) ); };

	function fa( value ) {
		return String( value ).replace( /[0-9.,]/g, function ( char ) {
			return { '0':'۰','1':'۱','2':'۲','3':'۳','4':'۴','5':'۵','6':'۶','7':'۷','8':'۸','9':'۹','.':'٫',',':'٬' }[ char ];
		} );
	}

	function format( text, value ) {
		return String( text ).replace( '%s', value );
	}

	async function api( path, options ) {
		options = options || {};
		var headers = new Headers( options.headers || {} );
		if ( state.session && state.session.nonce && options.method && ( options.method !== 'GET' || options.auth ) ) {
			headers.set( 'X-WP-Nonce', state.session.nonce );
		}
		if ( options.body && ! ( options.body instanceof FormData ) && typeof options.body !== 'string' ) {
			headers.set( 'Content-Type', 'application/json' );
			options.body = JSON.stringify( options.body );
		}
		var response = await fetch( CC_DATA.rest + path.replace( /^\//, '' ), Object.assign( {}, options, { credentials: 'same-origin', headers: headers } ) );
		var data;
		try {
			data = await response.json();
		} catch ( error ) {
			data = { message: i18n.networkError };
		}
		if ( ! response.ok ) {
			var err = new Error( data.message || i18n.networkError );
			err.code = data.code || 'http_error';
			err.status = response.status;
			throw err;
		}
		return data;
	}

	function openDialog( dialog ) {
		if ( ! dialog ) { return; }
		if ( typeof dialog.showModal === 'function' ) {
			dialog.showModal();
		} else {
			dialog.setAttribute( 'open', 'open' );
			dialog.classList.add( 'cc-dialog--fallback' );
		}
	}

	function closeDialog( dialog ) {
		if ( ! dialog ) { return; }
		if ( typeof dialog.close === 'function' ) { dialog.close(); }
		else { dialog.removeAttribute( 'open' ); }
	}

	function toast( message ) {
		var node = $( '.cc-toast' );
		node.textContent = message;
		node.hidden = false;
		clearTimeout( toast.timer );
		toast.timer = setTimeout( function () { node.hidden = true; }, 4500 );
	}

	function setBusy( button, busy ) {
		if ( ! button ) { return; }
		button.disabled = busy;
		button.classList.toggle( 'is-busy', busy );
	}

	async function loadSession() {
		state.session = await api( 'session', { method: 'GET' } );
		root.classList.toggle( 'is-logged-in', state.session.logged_in );
		try {
			var homeCity = state.session.user && state.session.user.home_city ? state.session.user.home_city : ( localStorage.getItem( 'cc_home_city' ) || cityId );
			localStorage.setItem( 'cc_home_city', String( homeCity ) );
		} catch ( error ) {}
		return state.session;
	}

	function renderRating( data ) {
		state.rating = data;
		root.querySelector( '.cc-topbar' ).setAttribute( 'aria-busy', 'false' );
		var summary = $( '.cc-rating__summary' );
		summary.classList.remove( 'cc-skeleton' );
		if ( data.user_rating ) {
			summary.textContent = format( i18n.yourRating, fa( data.user_rating ) );
		} else if ( data.enough_votes ) {
			summary.textContent = fa( Number( data.average ).toFixed( 1 ) ) + ' (' + fa( Number( data.count ).toLocaleString( 'en-US' ) ) + ' ' + i18n.votes + ')';
		} else {
			summary.textContent = i18n.notEnough;
		}
		$$( '.cc-star' ).forEach( function ( button ) {
			var active = Number( button.dataset.stars ) <= Number( data.user_rating || Math.round( data.average ) );
			button.textContent = active ? '★' : '☆';
			button.classList.toggle( 'is-active', active );
			button.disabled = Boolean( data.user_rating );
			button.setAttribute( 'aria-checked', String( Number( button.dataset.stars ) === Number( data.user_rating ) ) );
		} );
		var distButton = $( '.cc-rating__distribution' );
		distButton.hidden = Number( data.count ) < 1;
		var dist = $( '.cc-distribution' );
		dist.textContent = '';
		for ( var stars = 7; stars >= 1; stars-- ) {
			var row = document.createElement( 'div' );
			var label = document.createElement( 'span' );
			var track = document.createElement( 'span' );
			var bar = document.createElement( 'i' );
			var count = Number( data.distribution[ stars ] || 0 );
			label.textContent = fa( stars );
			bar.style.width = data.count ? Math.round( count / data.count * 100 ) + '%' : '0';
			track.appendChild( bar );
			row.appendChild( label ); row.appendChild( track );
			var total = document.createElement( 'b' ); total.textContent = fa( count ); row.appendChild( total );
			dist.appendChild( row );
		}
	}

	async function loadRating() {
		try { renderRating( await api( 'cities/' + cityId + '/rating', { method: 'GET' } ) ); }
		catch ( error ) { $( '.cc-rating__summary' ).textContent = error.message; }
	}

	function chooseRating( stars ) {
		if ( state.rating && state.rating.user_rating ) { return; }
		state.selectedStars = Number( stars );
		if ( ! state.session || ! state.session.logged_in ) {
			state.pending = { kind: 'rating', stars: state.selectedStars };
			openAuth();
			return;
		}
		$( '.cc-confirm-text' ).textContent = format( i18n.finalRating, fa( state.selectedStars ) );
		openDialog( $( '.cc-confirm-dialog' ) );
	}

	async function submitRating() {
		var button = $( '.cc-confirm-rating' );
		setBusy( button, true );
		try {
			var data = await api( 'cities/' + cityId + '/rating', { method: 'POST', body: { stars: state.selectedStars } } );
			renderRating( data );
			closeDialog( $( '.cc-confirm-dialog' ) );
			toast( i18n.saved );
		} catch ( error ) {
			toast( error.message );
			if ( error.status === 409 ) { loadRating(); closeDialog( $( '.cc-confirm-dialog' ) ); }
		} finally { setBusy( button, false ); }
	}

	function openAuth() {
		if ( ! modules.auth ) {
			window.location.href = CC_DATA.loginUrl;
			return;
		}
		var form = $( '.cc-auth-form' );
		$( '.cc-auth-phone', form ).hidden = false;
		$( '.cc-auth-code', form ).hidden = true;
		$( '.cc-form-status', form ).textContent = '';
		openDialog( $( '.cc-auth-dialog' ) );
		setTimeout( function () { $( '[name="mobile"]', form ).focus(); }, 80 );
	}

	async function requestOtp() {
		var form = $( '.cc-auth-form' );
		var button = $( '.cc-request-otp', form );
		var status = $( '.cc-form-status', form );
		setBusy( button, true ); status.textContent = '';
		try {
			await api( 'auth/request-otp', { method: 'POST', body: { mobile: form.elements.mobile.value, nonce: state.session.public_nonce } } );
			$( '.cc-auth-phone', form ).hidden = true;
			$( '.cc-auth-code', form ).hidden = false;
			status.textContent = i18n.otpSent;
			form.elements.code.focus();
		} catch ( error ) { status.textContent = error.message; }
		finally { setBusy( button, false ); }
	}

	async function verifyOtp( event ) {
		event.preventDefault();
		var form = event.currentTarget;
		if ( $( '.cc-auth-code', form ).hidden ) { return; }
		var button = $( '[type="submit"]', form );
		var status = $( '.cc-form-status', form );
		setBusy( button, true ); status.textContent = '';
		try {
			var result = await api( 'auth/verify-otp', { method: 'POST', body: {
				mobile: form.elements.mobile.value,
				code: form.elements.code.value,
				alias: form.elements.alias.value,
				accepted_terms: form.elements.terms.checked,
				city_id: cityId,
				nonce: state.session.public_nonce
			} } );
			state.session = { logged_in: true, user: result.user, nonce: result.nonce, public_nonce: state.session.public_nonce };
			root.classList.add( 'is-logged-in' );
			closeDialog( $( '.cc-auth-dialog' ) );
			resumePending();
		} catch ( error ) { status.textContent = error.message; }
		finally { setBusy( button, false ); }
	}

	function resumePending() {
		var pending = state.pending; state.pending = null;
		if ( ! pending ) { return; }
		if ( pending.kind === 'rating' ) { chooseRating( pending.stars ); }
		if ( pending.kind === 'contrib' ) { openContribution( pending.type ); }
		if ( pending.kind === 'mine' ) { openMine(); }
	}

	function shareCity() {
		var text = i18n.shareMessage + ' ' + cityUrl;
		if ( navigator.share ) {
			navigator.share( { title: cityName, text: text, url: cityUrl } ).catch( function () {} );
			return;
		}
		var encodedUrl = encodeURIComponent( cityUrl );
		var encodedText = encodeURIComponent( text );
		var urls = {
			telegram: 'https://t.me/share/url?url=' + encodedUrl + '&text=' + encodeURIComponent( i18n.shareMessage ),
			whatsapp: 'https://wa.me/?text=' + encodedText,
			eitaa: 'https://eitaa.com/share/url?url=' + encodedUrl + '&text=' + encodedText,
			bale: 'https://ble.ir/share/url?url=' + encodedUrl + '&text=' + encodedText,
			rubika: 'https://rubika.ir/share?url=' + encodedUrl + '&text=' + encodedText,
			sms: 'sms:?&body=' + encodedText
		};
		Object.keys( urls ).forEach( function ( key ) { var link = $( '[data-share="' + key + '"]' ); if ( link ) { link.href = urls[ key ]; } } );
		openDialog( $( '.cc-share-dialog' ) );
	}

	async function copyLink() {
		try {
			if ( navigator.clipboard && window.isSecureContext ) { await navigator.clipboard.writeText( cityUrl ); }
			else { var input = $( '.cc-share-url' ); input.select(); document.execCommand( 'copy' ); }
			toast( i18n.copied );
		} catch ( error ) { toast( i18n.copyFailed ); }
	}

	function setContributionType( type ) {
		var form = $( '.cc-contrib-form' );
		form.elements.type.value = type || 'introduce';
		$$( '.cc-fields', form ).forEach( function ( panel ) {
			var active = panel.dataset.fields === form.elements.type.value;
			panel.hidden = ! active;
			$$( 'input,textarea,select', panel ).forEach( function ( control ) { control.disabled = ! active; } );
		} );
	}

	function openContribution( type ) {
		if ( ! state.session || ! state.session.logged_in ) {
			state.pending = { kind: 'contrib', type: type || 'introduce' };
			openAuth(); return;
		}
		setContributionType( type || $( '.cc-contrib-form' ).elements.type.value );
		restoreDraft();
		openDialog( $( '.cc-contrib-dialog' ) );
	}

	function draftKey() { return 'cc_draft_' + cityId; }

	function saveDraft() {
		var form = $( '.cc-contrib-form' );
		var draft = { type: form.elements.type.value };
		$$( 'input,textarea,select', form ).forEach( function ( field ) {
			if ( field.name && ! field.disabled && field.type !== 'file' && field.type !== 'hidden' && field.name !== 'website' ) { draft[ field.name ] = field.value; }
		} );
		try { localStorage.setItem( draftKey(), JSON.stringify( draft ) ); } catch ( error ) {}
	}

	function restoreDraft() {
		var form = $( '.cc-contrib-form' );
		try {
			var draft = JSON.parse( localStorage.getItem( draftKey() ) || 'null' );
			if ( ! draft ) { return; }
			setContributionType( draft.type || 'introduce' );
			$$( 'input,textarea,select', form ).forEach( function ( field ) {
				if ( ! field.disabled && field.name && Object.prototype.hasOwnProperty.call( draft, field.name ) && field.type !== 'file' ) { field.value = draft[ field.name ]; }
			} );
		} catch ( error ) {}
	}

	function queueRequest( data ) {
		try {
			var queue = JSON.parse( localStorage.getItem( 'cc_contrib_queue' ) || '[]' );
			queue.push( { cityId: cityId, data: data, at: Date.now() } );
			localStorage.setItem( 'cc_contrib_queue', JSON.stringify( queue.slice( -10 ) ) );
			return true;
		} catch ( error ) { return false; }
	}

	async function flushQueue() {
		if ( ! navigator.onLine || ! state.session || ! state.session.logged_in ) { return; }
		var queue;
		try { queue = JSON.parse( localStorage.getItem( 'cc_contrib_queue' ) || '[]' ); } catch ( error ) { return; }
		var remaining = [];
		for ( var index = 0; index < queue.length; index++ ) {
			try { await api( 'cities/' + queue[ index ].cityId + '/submissions', { method: 'POST', body: queue[ index ].data } ); }
			catch ( error ) { remaining.push( queue[ index ] ); }
		}
		localStorage.setItem( 'cc_contrib_queue', JSON.stringify( remaining ) );
		if ( queue.length && ! remaining.length ) { toast( i18n.saved ); loadContributions(); }
	}

	async function submitContribution( event ) {
		event.preventDefault();
		var form = event.currentTarget;
		var button = $( '[type="submit"]', form );
		var status = $( '.cc-form-status', form );
		var files = form.querySelector( '[type="file"]' );
		if ( files && ! files.disabled ) {
			if ( files.files.length < 1 || files.files.length > 3 ) { status.textContent = i18n.photoCount; return; }
			for ( var f = 0; f < files.files.length; f++ ) { if ( files.files[ f ].size > 5 * 1024 * 1024 ) { status.textContent = i18n.photoSize; return; } }
		}
		var data = new FormData( form );
		setBusy( button, true ); status.textContent = '';
		try {
			var result = await api( 'cities/' + cityId + '/submissions', { method: 'POST', body: data } );
			status.textContent = result.message;
			localStorage.removeItem( draftKey() );
			form.reset(); setContributionType( 'introduce' );
			setTimeout( function () { closeDialog( $( '.cc-contrib-dialog' ) ); }, 900 );
		} catch ( error ) {
			if ( ( ! error.status || ! navigator.onLine ) && form.elements.type.value !== 'introduce' ) {
				var serial = {}; data.forEach( function ( value, key ) { if ( ! ( value instanceof File ) ) { serial[ key ] = value; } } );
				if ( queueRequest( serial ) ) { status.textContent = i18n.queued; }
			} else {
				status.textContent = error.message;
				if ( form.elements.type.value === 'introduce' && ! navigator.onLine ) { toast( i18n.filesNotQueued ); }
			}
		} finally { setBusy( button, false ); }
	}

	async function useLocation() {
		var status = $( '.cc-coords-status' );
		if ( ! navigator.geolocation ) { status.textContent = i18n.locationFailed; return; }
		navigator.geolocation.getCurrentPosition( function ( position ) {
			var form = $( '.cc-contrib-form' );
			form.elements.lat.value = position.coords.latitude.toFixed( 6 );
			form.elements.lng.value = position.coords.longitude.toFixed( 6 );
			status.textContent = i18n.locationSaved; saveDraft();
		}, function () { status.textContent = i18n.locationFailed; }, { enableHighAccuracy: false, timeout: 8000, maximumAge: 300000 } );
	}

	function contributionCard( item ) {
		var card = document.createElement( 'article' ); card.className = 'cc-card';
		var title = document.createElement( 'h3' ); title.textContent = item.title; card.appendChild( title );
		var text = document.createElement( 'p' );
		text.textContent = item.type === 'tip' ? item.payload.tip : item.payload.description;
		card.appendChild( text );
		var meta = document.createElement( 'small' ); meta.textContent = format( i18n.addedBy, item.alias ); card.appendChild( meta );
		if ( item.images && item.images[ 0 ] ) { var image = document.createElement( 'img' ); image.src = item.images[ 0 ]; image.loading = 'lazy'; image.alt = item.title; card.insertBefore( image, title ); }
		return card;
	}

	async function loadContributions() {
		var container = $( '.cc-community__items' );
		try {
			var data = await api( 'cities/' + cityId + '/submissions?page=1', { method: 'GET' } );
			container.textContent = '';
			if ( ! data.items.length ) { container.textContent = i18n.emptyContributions; return; }
			data.items.slice( 0, 4 ).forEach( function ( item ) { container.appendChild( contributionCard( item ) ); } );
		} catch ( error ) { container.textContent = error.message; }
	}

	async function openMine() {
		if ( ! state.session || ! state.session.logged_in ) { state.pending = { kind: 'mine' }; openAuth(); return; }
		var dialog = $( '.cc-mine-dialog' ); var list = $( '.cc-mine-list' ); list.textContent = i18n.loading; openDialog( dialog );
		try {
			var data = await api( 'me/submissions?page=1', { method: 'GET', auth: true } ); list.textContent = '';
			if ( ! data.items.length ) { list.textContent = i18n.emptyMine; return; }
			data.items.forEach( function ( item ) {
				var card = document.createElement( 'article' ); card.className = 'cc-card';
				var h = document.createElement( 'h3' ); h.textContent = item.title; card.appendChild( h );
				var status = document.createElement( 'span' ); status.className = 'cc-status cc-status--' + item.status;
				status.textContent = item.status === 'approved' ? i18n.statusApproved : ( item.status === 'rejected' ? i18n.statusRejected : i18n.statusPending ); card.appendChild( status );
				if ( item.rejection_label ) { var reason = document.createElement( 'p' ); reason.textContent = item.rejection_label; card.appendChild( reason ); }
				list.appendChild( card );
			} );
		} catch ( error ) { list.textContent = error.message; }
	}

	if ( modules.rating ) {
		$$( '.cc-star' ).forEach( function ( button ) { button.addEventListener( 'click', function () { chooseRating( button.dataset.stars ); } ); } );
		$( '.cc-confirm-rating' ).addEventListener( 'click', submitRating );
		$( '.cc-rating__distribution' ).addEventListener( 'click', function ( event ) { var dist = $( '.cc-distribution' ); dist.hidden = ! dist.hidden; event.currentTarget.setAttribute( 'aria-expanded', String( ! dist.hidden ) ); } );
	}
	if ( modules.share ) {
		$( '.cc-share' ).addEventListener( 'click', shareCity );
		$( '[data-share="copy"]' ).addEventListener( 'click', copyLink );
	}
	if ( modules.contrib ) {
		$$( '.cc-open-contrib' ).forEach( function ( button ) { button.addEventListener( 'click', function () { openContribution(); } ); } );
		$( '.cc-my-submissions' ).addEventListener( 'click', openMine );
		$( '.cc-contrib-form' ).addEventListener( 'submit', submitContribution );
		$( '.cc-contrib-form' ).addEventListener( 'input', saveDraft );
		$( '.cc-contrib-form' ).elements.type.addEventListener( 'change', function ( event ) { setContributionType( event.target.value ); saveDraft(); } );
		$( '.cc-geolocate' ).addEventListener( 'click', useLocation );
		window.addEventListener( 'online', flushQueue );
		setContributionType( 'introduce' );
		loadContributions();
	}
	if ( modules.auth ) {
		$( '.cc-request-otp' ).addEventListener( 'click', requestOtp );
		$( '.cc-auth-form' ).addEventListener( 'submit', verifyOtp );
	}
	$$( '.cc-close' ).forEach( function ( button ) { button.addEventListener( 'click', function () { closeDialog( button.closest( 'dialog' ) ); } ); } );
	$$( '.cc-dialog' ).forEach( function ( dialog ) { dialog.addEventListener( 'click', function ( event ) { if ( event.target === dialog ) { closeDialog( dialog ); } } ); } );

	loadSession().then( function () {
		if ( modules.rating ) { loadRating(); }
		if ( modules.contrib ) { flushQueue(); }
	} ).catch( function () { if ( modules.rating ) { loadRating(); } } );
} )();
