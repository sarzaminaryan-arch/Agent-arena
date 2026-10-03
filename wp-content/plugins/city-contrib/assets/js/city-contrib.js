(()=>{
 const cfg = window.CC_CONFIG;
 if(!cfg) return;

 const toFa = value => Number(value || 0).toLocaleString('fa-IR');
 const escapeHTML = value => String(value ?? '').replace(/[&<>"]/g, ch => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;'}[ch]));
 const api = path => `${cfg.api}cc/v1/${path}`;
 const asJSON = response => response.json().catch(()=>({code:'bad_response', message:'پاسخ نامعتبر دریافت شد.'}));
 const authModal = () => document.querySelector('[data-cc-auth]');
 const openAuth = () => { const modal = authModal(); if(modal) modal.hidden = false; };

 const rating = document.querySelector('[data-cc-rating]');
 if(rating){
  const cityId = rating.dataset.city;
  const summary = rating.querySelector('[data-cc-average]');
  const stars = [...rating.querySelectorAll('[data-cc-star]')];
  const renderRating = data => {
   if(!data || data.code){
    if(summary) summary.textContent = data?.message || 'دریافت امتیاز انجام نشد.';
    return;
   }
   if(summary){
    summary.textContent = Number(data.count || 0) < 5
     ? 'هنوز امتیاز کافی ثبت نشده، اولین نفر باشید'
     : `${Number(data.average || 0).toLocaleString('fa-IR',{maximumFractionDigits:1})} از ۷ (${toFa(data.count)} رأی)`;
   }
   stars.forEach(button => {
    button.disabled = !!data.user_rating || !cfg.logged;
    button.classList.toggle('is-active', Number(button.dataset.ccStar) <= Number(data.user_rating || 0));
   });
  };

  fetch(api(`cities/${cityId}/rating`)).then(asJSON).then(renderRating);
  rating.addEventListener('click', event => {
   const button = event.target.closest('[data-cc-star]');
   if(!button) return;
   if(!cfg.logged){ openAuth(); return; }
   if(!confirm(`امتیاز نهایی ${button.dataset.ccStar} ستاره؟ بعد از ثبت قابل تغییر نیست`)) return;
   fetch(api(`cities/${cityId}/rating`), {
    method: 'POST',
    headers: {'Content-Type':'application/json','X-WP-Nonce':cfg.nonce},
    body: JSON.stringify({stars: Number(button.dataset.ccStar)})
   }).then(asJSON).then(renderRating);
  });
 }

 document.addEventListener('click', event => {
  const share = event.target.closest('[data-cc-share]');
  const copy = event.target.closest('[data-cc-copy]');
  if(!share && !copy) return;
  const box = event.target.closest('.cc-share');
  if(!box) return;
  if(share && navigator.share){
   navigator.share({title: document.title, text: box.dataset.text, url: box.dataset.url}).catch(()=>{});
  }
  if(copy){
   navigator.clipboard?.writeText(box.dataset.url);
   copy.textContent = 'کپی شد';
   setTimeout(()=>{ copy.textContent = 'کپی لینک'; }, 1500);
  }
 });

 const contrib = document.querySelector('[data-cc-contrib]');
 if(contrib){
  const form = contrib.querySelector('[data-cc-form]');
  const message = contrib.querySelector('[data-cc-message]');
  const open = contrib.querySelector('[data-cc-open]');
  const close = contrib.querySelector('[data-cc-close]');
  if(open) open.onclick = () => {
   if(!cfg.logged){ openAuth(); return; }
   form.hidden = false;
  };
  if(close) close.onclick = () => { form.hidden = true; };
  if(form) form.onsubmit = event => {
   event.preventDefault();
   const fd = new FormData(form);
   if(fd.get('website')) return;
   fetch(api('submissions'), {method:'POST', headers:{'X-WP-Nonce':cfg.nonce}, body:fd})
    .then(asJSON)
    .then(data => {
     if(message) message.textContent = data.message || data.code || 'خطایی رخ داد';
     if(data.success){ form.reset(); form.hidden = true; }
    });
  };
 }

 const auth = authModal();
 if(auth){
  const msg = auth.querySelector('[data-cc-auth-message]');
  const phoneForm = auth.querySelector('[data-cc-phone]');
  const codeForm = auth.querySelector('[data-cc-code]');
  document.addEventListener('click', event => {
   if(event.target.matches('[data-cc-login]') || event.target.closest('[data-cc-requires-login]')){
    event.preventDefault();
    auth.hidden = false;
   }
  });
  const close = auth.querySelector('[data-cc-auth-close]');
  if(close) close.onclick = () => { auth.hidden = true; };
  if(phoneForm) phoneForm.onsubmit = event => {
   event.preventDefault();
   const phone = new FormData(phoneForm).get('phone');
   fetch(api('auth/request'), {method:'POST', headers:{'Content-Type':'application/json'}, body:JSON.stringify({phone})})
    .then(asJSON)
    .then(data => {
     if(msg) msg.textContent = data.message || data.code;
     if(data.success){ phoneForm.hidden = true; codeForm.hidden = false; codeForm.dataset.phone = phone; }
    });
  };
  if(codeForm) codeForm.onsubmit = event => {
   event.preventDefault();
   const phone = codeForm.dataset.phone;
   const code = new FormData(codeForm).get('code');
   fetch(api('auth/verify'), {method:'POST', headers:{'Content-Type':'application/json'}, body:JSON.stringify({phone, code})})
    .then(asJSON)
    .then(data => {
     if(msg) msg.textContent = data.message || data.code;
     if(data.success) window.location.reload();
    });
  };
 }

 const mine = document.querySelector('[data-cc-my]');
 if(mine && cfg.logged){
  const list = mine.querySelector('[data-cc-my-list]');
  fetch(api('my-submissions'), {headers:{'X-WP-Nonce':cfg.nonce}})
   .then(asJSON)
   .then(rows => {
    if(!Array.isArray(rows) || !rows.length){ list.textContent = 'هنوز مشارکتی ثبت نکرده‌اید.'; return; }
    list.innerHTML = `<ul>${rows.map(item => `
     <li>
      <strong>${escapeHTML(item.city || '')}</strong>
      <span>${escapeHTML(item.type_label || item.type || '')}</span>
      <em>${escapeHTML(item.status_label || item.status || '')}</em>
      ${item.excerpt ? `<p>${escapeHTML(item.excerpt)}</p>` : ''}
      ${item.note ? `<small class="cc-note">${escapeHTML(item.note)}</small>` : ''}
      ${item.status === 'needs_edit' ? `<button type="button" data-cc-resubmit="${Number(item.id)}">ارسال اصلاح‌شده</button>` : ''}
     </li>`).join('')}</ul>`;
   })
   .catch(()=>{ list.textContent = 'دریافت اطلاعات انجام نشد'; });
 }

 document.addEventListener('click', event => {
  const button = event.target.closest('[data-cc-resubmit]');
  if(!button) return;
  const text = prompt('متن اصلاح‌شده را وارد کنید:');
  if(!text) return;
  fetch(api(`submissions/${button.dataset.ccResubmit}/resubmit`), {
   method: 'POST',
   headers: {'Content-Type':'application/json','X-WP-Nonce':cfg.nonce},
   body: JSON.stringify({text})
  }).then(asJSON).then(data => {
   alert(data.message || 'عملیات انجام نشد');
   if(data.success) window.location.reload();
  });
 });
})();
