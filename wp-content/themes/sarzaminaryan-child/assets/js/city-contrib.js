/* شهر من — مشارکت مردمی (داخل قالب فرزند، بدون افزونه) — v2.11.0 */
(()=>{ /* voter token: هویت ناشناس برای رأی بدون ثبت‌نام (کوکی یک‌ساله) */
 const get=()=>{const m=document.cookie.match(/(?:^|;\s*)cc_voter=([a-f0-9]{40})/);return m?m[1]:null};
 const set=()=>{let t=get();if(!t){t=(crypto&&crypto.getRandomValues)?Array.from(crypto.getRandomValues(new Uint8Array(20))).map(b=>b.toString(16).padStart(2,'0')).join(''):Array.from({length:40},()=>Math.floor(Math.random()*16).toString(16)).join('');document.cookie='cc_voter='+t+';path=/;max-age=31536000;SameSite=Lax'}return t};
 window.ccVoter=()=>get()||set();
})();

(()=>{ /* امتیازدهی ۱ تا ۷ — بدون ثبت‌نام، تغییر فقط پس از یک روز */
 const cfg=window.CC_CONFIG;const root=document.querySelector('[data-cc-rating]');if(!cfg||!root)return;
 const id=root.dataset.city,status=root.querySelector('[data-cc-status]'),stars=[...root.querySelectorAll('[data-cc-star]')];
 const fa=n=>Number(n).toLocaleString('fa-IR',{maximumFractionDigits:1});
 const paint=x=>{stars.forEach(b=>{const on=x.user_rating>0&&+b.dataset.ccStar<=x.user_rating;b.classList.toggle('is-on',on);b.disabled=x.locked});if(status){if(x.user_rating>0)status.textContent=x.locked?'رأی شما ('+fa(x.user_rating)+' ستاره) ثبت شده است؛ تغییر آن از فردا ممکن است.':'می‌توانید رأی خود را تغییر دهید — ستاره‌ها را لمس کنید.';else status.textContent='بدون ثبت‌نام رأی بدهید؛ هر نفر یک بار، قابل تغییر پس از یک روز.'}};
 fetch(cfg.api+'cc/v1/cities/'+id+'/rating?voter='+window.ccVoter()).then(r=>r.json()).then(x=>{if(x&&x.average!==undefined)paint(x)}).catch(()=>{});
 root.addEventListener('click',e=>{const b=e.target.closest('[data-cc-star]');if(!b||b.disabled)return;const v=+b.dataset.ccStar;if(!confirm('امتیاز '+v+' از ۷ به این شهر ثبت شود؟ تا ۲۴ ساعت بعد می‌توانید آن را تغییر دهید.'))return;
  if(status)status.textContent='در حال ثبت رأی…';
  fetch(cfg.api+'cc/v1/cities/'+id+'/rating',{method:'POST',headers:{'Content-Type':'application/json','X-WP-Nonce':cfg.nonce},body:JSON.stringify({stars:v,voter:window.ccVoter()})}).then(r=>r.json().then(x=>({ok:r.ok,x}))).then(({x})=>{
   if(x.success){paint(x);if(status)status.textContent=x.message+' رتبهٔ این شهر: '+(x.rank?fa(x.rank)+' از '+fa(x.total):'—');}
   else{if(status)status.textContent=(x.message||'خطایی رخ داد.')+(x.data&&x.data.changeable_at?(' قابل تغییر از: '+new Date(x.data.changeable_at*1000).toLocaleDateString('fa-IR')):'');paint(x.user_rating!==undefined?x:{user_rating:0,locked:false});}
  }).catch(()=>{if(status)status.textContent='اتصال برقرار نشد؛ دوباره تلاش کنید.'});
 });
})();

document.addEventListener('click',e=>{const sh=e.target.closest('[data-cc-share]'),cp=e.target.closest('[data-cc-copy]');const box=e.target.closest('.cc-share');if(!box)return;if(sh&&navigator.share)navigator.share({title:document.title,text:box.dataset.text,url:box.dataset.url}).catch(()=>{});if(cp){navigator.clipboard?.writeText(box.dataset.url);cp.textContent='کپی شد';setTimeout(()=>cp.textContent='کپی لینک',1500)}});

(()=>{ /* فرم مشارکت — ورود با کد پیامکی لازم است */
 const c=document.querySelector('[data-cc-contrib]');if(!c||!window.CC_CONFIG)return;const f=c.querySelector('[data-cc-form]');
 c.querySelector('[data-cc-open]').onclick=()=>{if(!CC_CONFIG.logged){const a=document.querySelector('[data-cc-auth]');if(a)a.hidden=false;return}f.hidden=false};
 const cl=c.querySelector('[data-cc-close]');if(cl)cl.onclick=()=>f.hidden=true;
 f.onsubmit=e=>{e.preventDefault();const fd=new FormData(f);if(fd.get('website'))return;const msg=c.querySelector('[data-cc-message]');msg.textContent='در حال ارسال…';fetch(CC_CONFIG.api+'cc/v1/submissions',{method:'POST',headers:{'X-WP-Nonce':CC_CONFIG.nonce},body:fd}).then(r=>r.json()).then(x=>{msg.textContent=x.message||x.code||'خطایی رخ داد';if(x.success)f.reset()})};
})();

(()=>{ /* ورود سریع با کد پیامکی */
 const a=document.querySelector('[data-cc-auth]');if(!a||!window.CC_CONFIG)return;const msg=a.querySelector('[data-cc-auth-message]'),phone=a.querySelector('[data-cc-phone]'),code=a.querySelector('[data-cc-code]');
 document.addEventListener('click',e=>{if(e.target.matches('[data-cc-login]')||e.target.closest('[data-cc-requires-login]')){e.preventDefault();a.hidden=false}});
 a.querySelector('[data-cc-auth-close]').onclick=()=>a.hidden=true;
 phone.onsubmit=e=>{e.preventDefault();const p=new FormData(phone).get('phone');msg.textContent='در حال ارسال کد…';fetch(CC_CONFIG.api+'cc/v1/auth/request',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({phone:p})}).then(r=>r.json()).then(x=>{msg.textContent=x.message||x.code;if(x.success){phone.hidden=true;code.hidden=false;code.dataset.phone=p}})};
 code.onsubmit=e=>{e.preventDefault();const p=code.dataset.phone,c2=new FormData(code).get('code');msg.textContent='در حال بررسی…';fetch(CC_CONFIG.api+'cc/v1/auth/verify',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({phone:p,code:c2})}).then(r=>r.json()).then(x=>{msg.textContent=x.message||x.code;if(x.success)location.reload()})};
})();

(()=>{ /* مشارکت‌های من */
 if(!window.CC_CONFIG)return;const box=document.querySelector('[data-cc-my]');if(!box||!CC_CONFIG.logged)return;
 fetch(CC_CONFIG.api+'cc/v1/my-submissions',{headers:{'X-WP-Nonce':CC_CONFIG.nonce}}).then(r=>r.json()).then(rows=>{const labels={pending:'در انتظار بررسی',publish:'تأیید و منتشر شده',rejected:'رد شده',needs_edit:'نیاز به اصلاح'};box.querySelector('[data-cc-my-list]').innerHTML=rows.length?'<ul>'+rows.map(x=>`<li><strong>${x.city||''}</strong> — ${x.type||''} — <span>${labels[x.status]||x.status}</span>${x.note?`<small class="cc-note">${x.note}</small>`:''}${x.status==='needs_edit'?`<button type="button" data-cc-resubmit="${x.id}">ارسال اصلاح‌شده</button>`:''}</li>`).join('')+'</ul>':'هنوز مشارکتی ثبت نکرده‌اید.'}).catch(()=>box.querySelector('[data-cc-my-list]').textContent='دریافت اطلاعات انجام نشد')})();

document.addEventListener('click',e=>{const b=e.target.closest('[data-cc-resubmit]');if(!b||!window.CC_CONFIG)return;const text=prompt('متن اصلاح‌شده را وارد کنید:');if(!text)return;fetch(CC_CONFIG.api+'cc/v1/submissions/'+b.dataset.ccResubmit+'/resubmit',{method:'POST',headers:{'Content-Type':'application/json','X-WP-Nonce':CC_CONFIG.nonce},body:JSON.stringify({text})}).then(r=>r.json()).then(x=>{alert(x.message||'عملیات انجام نشد');if(x.success)location.reload()})});

(()=>{ /* جدول برترین‌ها */
 if(!window.CC_CONFIG)return;const b=document.querySelector('[data-cc-leaderboard]');if(!b)return;
 fetch(CC_CONFIG.api+'cc/v1/leaderboard?city_id='+encodeURIComponent(b.dataset.city||0)).then(r=>r.json()).then(rows=>{b.querySelector('[data-cc-leaderboard-list]').innerHTML=rows.length?'<ol>'+rows.slice(0,+b.dataset.limit||10).map(x=>`<li><strong>${x.name}</strong> — ${Number(x.points).toLocaleString('fa-IR')} امتیاز — ${x.level}</li>`).join('')+'</ol>':'هنوز مشارکت‌کننده‌ای ثبت نشده است.'}).catch(()=>{})})();
