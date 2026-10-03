( function () {
	'use strict';
	if ( ! window.CC_ADMIN ) { return; }
	function api( path, options ) {
		options = options || {}; options.credentials = 'same-origin'; options.headers = Object.assign( { 'X-WP-Nonce': CC_ADMIN.nonce }, options.headers || {} );
		if ( options.body && typeof options.body !== 'string' ) { options.headers['Content-Type'] = 'application/json'; options.body = JSON.stringify( options.body ); }
		return fetch( CC_ADMIN.rest + path, options ).then( function ( response ) { return response.json().then( function ( data ) { if ( ! response.ok ) { throw new Error( data.message || CC_ADMIN.i18n.error ); } return data; } ); } );
	}
	var app = document.getElementById( 'cc-moderation-app' );
	if ( app ) {
		var list = app.querySelector( '.cc-admin-list' );
		function filters() { var out = new URLSearchParams(); app.querySelectorAll( '[data-filter]' ).forEach( function ( field ) { if ( field.value ) { out.set( field.dataset.filter, field.value ); } } ); return out.toString(); }
		function inputFor( key, value ) { var label = document.createElement( 'label' ); label.textContent = CC_ADMIN.fields[ key ] || key; var field = document.createElement( typeof value === 'string' && value.length > 80 ? 'textarea' : 'input' ); field.value = value; field.dataset.edit = key; label.appendChild( field ); return label; }
		function card( item ) {
			var node = document.createElement( 'article' ); node.className = 'cc-admin-card'; node.dataset.id = item.id;
			var check = document.createElement( 'input' ); check.type = 'checkbox'; check.className = 'cc-select'; node.appendChild( check );
			var title = document.createElement( 'h2' ); title.textContent = item.title + ' — ' + item.city_name; node.appendChild( title );
			Object.keys( item.payload || {} ).forEach( function ( key ) { if ( typeof item.payload[ key ] === 'string' ) { node.appendChild( inputFor( key, item.payload[ key ] ) ); } } );
			if ( item.images ) { item.images.forEach( function ( src ) { var image = document.createElement( 'img' ); image.src = src; image.loading = 'lazy'; node.appendChild( image ); } ); }
			var approve = document.createElement( 'button' ); approve.className = 'button button-primary'; approve.textContent = CC_ADMIN.i18n.approve; approve.dataset.action = 'approve'; node.appendChild( approve );
			var reason = document.createElement( 'select' ); reason.dataset.cardReason = '1'; Object.keys( CC_ADMIN.reasons ).forEach( function ( key ) { var option = document.createElement( 'option' ); option.value = key; option.textContent = CC_ADMIN.reasons[ key ]; reason.appendChild( option ); } ); node.appendChild( reason );
			var reject = document.createElement( 'button' ); reject.className = 'button'; reject.textContent = CC_ADMIN.i18n.reject; reject.dataset.action = 'reject'; node.appendChild( reject );
			return node;
		}
		function load() { list.textContent = CC_ADMIN.i18n.loading; api( 'moderation/submissions?' + filters(), { method: 'GET' } ).then( function ( data ) { list.textContent = ''; if ( ! data.items.length ) { list.textContent = CC_ADMIN.i18n.empty; } data.items.forEach( function ( item ) { list.appendChild( card( item ) ); } ); } ).catch( function ( error ) { list.textContent = error.message; } ); }
		function edits( node ) { var out = {}; node.querySelectorAll( '[data-edit]' ).forEach( function ( field ) { out[ field.dataset.edit ] = field.value; } ); return out; }
		list.addEventListener( 'click', function ( event ) { var button = event.target.closest( '[data-action]' ); if ( ! button ) { return; } var node = button.closest( '.cc-admin-card' ); button.disabled = true; api( 'moderation/submissions/' + node.dataset.id, { method: 'PATCH', body: { action: button.dataset.action, reason: node.querySelector( '[data-card-reason]' ).value, edits: edits( node ) } } ).then( function () { node.remove(); } ).catch( function ( error ) { alert( error.message ); button.disabled = false; } ); } );
		app.querySelector( '[data-load]' ).addEventListener( 'click', load );
		app.querySelectorAll( '[data-batch]' ).forEach( function ( button ) { button.addEventListener( 'click', function () { var ids = Array.prototype.slice.call( list.querySelectorAll( '.cc-select:checked' ) ).map( function ( check ) { return Number( check.closest( '.cc-admin-card' ).dataset.id ); } ); if ( ! ids.length ) { return; } api( 'moderation/submissions/batch', { method: 'POST', body: { ids: ids, action: button.dataset.batch, reason: app.querySelector( '[data-reason]' ).value } } ).then( load ).catch( function ( error ) { alert( error.message ); } ); } ); } );
		load();
	}
	var ratings = document.getElementById( 'cc-ratings-app' );
	if ( ratings ) { ratings.addEventListener( 'click', function ( event ) { var button = event.target.closest( '[data-delete-rating]' ); if ( ! button ) { return; } var row = button.closest( 'tr' ); var reason = row.querySelector( '[data-delete-reason]' ).value.trim(); if ( ! reason || ! confirm( CC_ADMIN.i18n.confirmDelete ) ) { return; } button.disabled = true; api( 'admin/ratings/' + button.dataset.deleteRating, { method: 'DELETE', body: { reason: reason } } ).then( function () { row.remove(); } ).catch( function ( error ) { alert( error.message ); button.disabled = false; } ); } ); }
} )();
