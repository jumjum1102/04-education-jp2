<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>シンガポール教育ガイド | Singapore Education</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@300;400;600&family=DM+Sans:wght@300;400;500;600&family=Playfair+Display:ital,wght@0,700;1,400&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box;}
html{scroll-behavior:smooth;}
body{
  font-family:'DM Sans',sans-serif;
  background:#FAFAF8;
  color:#1A1A1A;
  overflow-x:hidden;
  line-height:1.7;
}
img{display:block;max-width:100%;}
button{cursor:pointer;border:none;background:none;}
a{color:inherit;text-decoration:none;}

:root{
  --ink:#1A1A1A;
  --muted:#888;
  --border:#E8E5E0;
  --accent:#C9943A;
  --bg:#FAFAF8;
  --bg2:#F3F0EB;
  --white:#FFFFFF;
  --dark:#141414;
  --dark-soft:#1D1D1D;
  --dark-line:rgba(255,255,255,.08);
  --dark-text:rgba(255,255,255,.58);
  --content-max:1120px;
  --content-narrow:980px;
  --rail-w:62px;
}

/* fade */
.fade{opacity:0;transform:translateY(24px);transition:opacity .75s ease,transform .75s ease;}
.fade.v{opacity:1;transform:translateY(0);}
.fade.d1{transition-delay:.1s;}
.fade.d2{transition-delay:.2s;}
.fade.d3{transition-delay:.3s;}
.fade.d4{transition-delay:.4s;}

/* shell */
.page-shell{
  min-height:100vh;
  background:var(--bg);
}
.desktop-rail{
  position:fixed;
  top:0;left:0;
  width:var(--rail-w);
  height:100vh;
  background:var(--white);
  border-right:1px solid var(--border);
  display:flex;
  flex-direction:column;
  align-items:center;
  padding-top:18px;
  z-index:260;
}
.rail-brand{
  writing-mode:vertical-rl;
  font-size:9px;
  letter-spacing:4px;
  color:var(--muted);
  text-transform:uppercase;
  margin-bottom:18px;
}
.rail-item{
  display:flex;
  flex-direction:column;
  align-items:center;
  margin-bottom:2px;
  cursor:pointer;
}
.rail-dot{
  width:4px;height:4px;border-radius:50%;
  background:#d8d3cc;
  margin:4px 0;
  transition:background .25s ease;
}
.rail-label{
  writing-mode:vertical-rl;
  font-size:8px;
  letter-spacing:2px;
  color:#c2bbb0;
  text-transform:uppercase;
  padding:8px 3px;
  transition:color .25s ease;
}
.rail-item.active .rail-dot{background:var(--accent);}
.rail-item.active .rail-label{color:var(--accent);}

.main{
  margin-left:var(--rail-w);
  min-height:100vh;
}

/* mobile header */
.mobile-topbar{
  display:none;
  position:fixed;
  top:0;left:0;right:0;
  height:60px;
  background:rgba(250,250,248,.96);
  backdrop-filter:blur(12px);
  border-bottom:1px solid var(--border);
  padding:0 20px;
  z-index:300;
  align-items:center;
  justify-content:space-between;
}
.mobile-logo{
  font-family:'Playfair Display',serif;
  font-size:18px;
  font-weight:700;
  color:var(--ink);
  letter-spacing:.5px;
}
.mobile-logo span{color:var(--accent);}
#hmbg{
  display:inline-flex;
  align-items:center;
  justify-content:center;
  width:36px;height:36px;
  font-size:22px;
  color:var(--ink);
}
#sp-menu{
  display:none;
  position:fixed;
  top:60px;left:0;right:0;
  background:var(--white);
  border-bottom:1px solid var(--border);
  z-index:299;
  padding:14px 20px;
}
#sp-menu.open{display:block;}
.sp-lnk{
  display:block;
  padding:11px 0;
  border-bottom:1px solid var(--border);
  font-size:13px;
  color:var(--ink);
  cursor:pointer;
}
.sp-lnk:last-child{border-bottom:none;}

/* wrappers */
.inner{max-width:var(--content-narrow);margin:0 auto;}
.inner-wide{max-width:var(--content-max);margin:0 auto;}

/* hero */
#hero{
  min-height:100svh;
  display:grid;
  grid-template-columns:1fr 1fr;
  overflow:hidden;
}
.hero-left{
  display:flex;flex-direction:column;justify-content:center;
  padding:88px 72px 80px 56px;
  background:var(--bg);
}
.hero-eyebrow{
  font-size:10px;letter-spacing:5px;color:var(--accent);
  text-transform:uppercase;margin-bottom:24px;
  display:flex;align-items:center;gap:12px;
}
.hero-eyebrow::before{content:'';width:28px;height:1px;background:var(--accent);}
h1.hero-t{
  font-family:'Noto Serif JP',serif;
  font-size:clamp(32px,4.5vw,58px);
  font-weight:300;line-height:1.25;
  color:var(--ink);margin-bottom:28px;
}
h1.hero-t em{
  font-style:italic;
  font-family:'Playfair Display',serif;
  color:var(--accent);
}
.hero-desc{
  font-size:15px;color:var(--muted);
  line-height:1.9;max-width:420px;margin-bottom:40px;
}
.hero-kpi{
  display:grid;grid-template-columns:repeat(3,1fr);
  gap:0;border-top:1px solid var(--border);
  padding-top:32px;margin-top:8px;
}
.kpi{padding-right:24px;}
.kpi+.kpi{padding-left:24px;border-left:1px solid var(--border);}
.kpi-v{
  font-family:'Playfair Display',serif;
  font-size:clamp(22px,2.8vw,34px);font-weight:700;
  color:var(--ink);line-height:1;
}
.kpi-l{font-size:11px;color:var(--muted);margin-top:6px;line-height:1.5;}
.hero-right{
  position:relative;overflow:hidden;
  background:#1A1A1A;
}
.hero-right img{
  width:100%;height:100%;object-fit:cover;
  opacity:.75;
  transition:transform 8s ease;
  transform:scale(1.04);
}
.hero-right img.rdy{transform:scale(1);}
.hero-badge{
  position:absolute;bottom:32px;left:32px;
  background:var(--white);
  padding:14px 20px;
  border-left:3px solid var(--accent);
}
.hero-badge-t{font-size:11px;letter-spacing:2px;text-transform:uppercase;color:var(--muted);}
.hero-badge-v{font-size:18px;font-weight:700;color:var(--ink);margin-top:2px;}

/* sections */
.sec{
  padding:100px 56px;
  border-bottom:1px solid var(--border);
  background:var(--bg);
}
.sec-alt{
  padding:100px 56px;
  background:var(--bg2);
  border-bottom:1px solid var(--border);
}
.sec-dark{
  padding:100px 56px;
  background:var(--dark);
  color:var(--white);
  border-bottom:1px solid var(--dark-line);
}

/* headings */
.sec-label{font-size:10px;letter-spacing:4px;color:var(--accent);text-transform:uppercase;margin-bottom:12px;}
.sec-title{
  font-family:'Noto Serif JP',serif;
  font-size:clamp(24px,3.5vw,42px);
  font-weight:300;color:var(--ink);line-height:1.3;margin-bottom:10px;
}
.sec-sub{
  font-family:'Playfair Display',serif;
  font-style:italic;font-size:14px;color:var(--muted);margin-bottom:48px;
}
.sec-rule{width:40px;height:2px;background:var(--ink);margin-bottom:48px;}
.sec-dark .sec-title{color:var(--white);}
.sec-dark .sec-sub{color:rgba(255,255,255,.4);}
.sec-dark .sec-rule{background:rgba(255,255,255,.2);}

/* grid helpers */
.g2{display:grid;grid-template-columns:1fr 1fr;gap:48px;align-items:start;}
.g3{display:grid;grid-template-columns:repeat(3,1fr);gap:28px;}
.g4{display:grid;grid-template-columns:repeat(4,1fr);gap:20px;}

/* timeline */
.tl{display:flex;flex-direction:column;}
.tl-row{display:flex;gap:24px;padding-bottom:32px;}
.tl-row.last{padding-bottom:0;}
.tl-side{display:flex;flex-direction:column;align-items:center;flex-shrink:0;width:80px;}
.tl-yr{
  font-family:'Playfair Display',serif;font-size:15px;
  font-weight:700;color:var(--accent);line-height:1;margin-bottom:8px;
}
.tl-dot{width:8px;height:8px;border-radius:50%;background:var(--ink);flex-shrink:0;}
.tl-line{width:1px;flex:1;background:var(--border);margin-top:4px;}
.tl-body{flex:1;padding-bottom:24px;border-bottom:1px solid var(--border);}
.tl-row.last .tl-body{border-bottom:none;padding-bottom:0;}
.tl-title{font-size:15px;font-weight:600;color:var(--ink);margin-bottom:6px;}
.tl-text{font-size:13px;color:var(--muted);line-height:1.8;}

/* cards */
.card{
  background:var(--white);
  border:1px solid var(--border);
  padding:28px 24px;
}
.card-icon{font-size:28px;margin-bottom:14px;}
.card-title{font-size:15px;font-weight:600;color:var(--ink);margin-bottom:8px;}
.card-text{font-size:13px;color:var(--muted);line-height:1.8;}
.card-accent{border-top:3px solid var(--accent);}

/* stats */
.stat{border-top:2px solid var(--ink);padding-top:16px;}
.stat.gold{border-top-color:var(--accent);}
.stat-n{
  font-family:'Playfair Display',serif;
  font-size:clamp(28px,4vw,48px);font-weight:700;
  color:var(--ink);line-height:1;
}
.stat.gold .stat-n{color:var(--accent);}
.stat-u{font-size:.4em;font-weight:400;color:var(--muted);}
.stat-l{font-size:12px;color:var(--muted);margin-top:8px;line-height:1.6;}
.sec-dark .stat{border-top-color:rgba(255,255,255,.15);}
.sec-dark .stat.gold{border-top-color:var(--accent);}
.sec-dark .stat-n{color:var(--white);}
.sec-dark .stat.gold .stat-n{color:var(--accent);}
.sec-dark .stat-u{color:rgba(255,255,255,.45);}
.sec-dark .stat-l{color:rgba(255,255,255,.4);}

/* path */
.path-wrap{
  display:flex;flex-direction:column;gap:0;
  border-left:2px solid var(--border);
  padding-left:32px;
  margin-left:16px;
}
.path-item{
  position:relative;padding:20px 0 28px;
  border-bottom:1px solid var(--border);
}
.path-item:last-child{border-bottom:none;padding-bottom:0;}
.path-item::before{
  content:'';
  position:absolute;left:-38px;top:24px;
  width:10px;height:10px;border-radius:50%;
  background:var(--white);border:2px solid var(--accent);
}
.path-age{font-size:10px;letter-spacing:3px;color:var(--accent);text-transform:uppercase;margin-bottom:6px;}
.path-title{font-size:16px;font-weight:600;color:var(--ink);margin-bottom:6px;}
.path-text{font-size:13px;color:var(--muted);line-height:1.8;}
.path-tags{display:flex;gap:6px;flex-wrap:wrap;margin-top:10px;}
.tag{
  font-size:10px;letter-spacing:1px;text-transform:uppercase;
  border:1px solid var(--border);color:var(--muted);
  padding:3px 10px;
}
.tag.fill{background:var(--ink);color:var(--white);border-color:var(--ink);}
.tag.gold{background:var(--accent);color:var(--white);border-color:var(--accent);}

/* tables */
.tbl{width:100%;border-collapse:collapse;font-size:13px;}
.tbl th{
  padding:12px 16px;font-size:10px;letter-spacing:3px;
  text-transform:uppercase;font-weight:600;
  background:var(--ink);color:var(--white);text-align:left;
}
.tbl th:first-child{background:var(--bg2);color:var(--muted);}
.tbl td{
  padding:14px 16px;border-bottom:1px solid var(--border);
  vertical-align:top;line-height:1.7;color:var(--muted);
}
.tbl tr td:first-child{font-weight:600;color:var(--ink);}
.tbl tr:nth-child(even) td{background:rgba(0,0,0,.015);}
.tbl tr:hover td{background:rgba(201,148,58,.04);}

/* dark */
.dark-card{
  border:1px solid rgba(255,255,255,.08);
  padding:28px 24px;
  background:rgba(255,255,255,.03);
}
.dark-card-title{font-size:15px;font-weight:600;color:var(--white);margin-bottom:8px;}
.dark-card-text{font-size:13px;color:rgba(255,255,255,.5);line-height:1.8;}
.dark-card-num{
  font-family:'Playfair Display',serif;
  font-size:36px;font-weight:700;color:var(--accent);line-height:1;margin-bottom:8px;
}

/* quote */
.pull-quote{
  border-left:3px solid var(--accent);
  padding:20px 28px;
  background:rgba(201,148,58,.04);
  margin:32px 0;
}
.pull-quote blockquote{
  font-family:'Playfair Display',serif;
  font-size:clamp(16px,2vw,22px);
  font-style:italic;font-weight:400;
  color:var(--ink);line-height:1.6;
}
.pull-quote cite{
  display:block;font-size:12px;color:var(--muted);
  margin-top:12px;font-style:normal;letter-spacing:1px;
}

/* learn */
.learn-item{
  display:flex;gap:20px;
  padding:20px 0;border-bottom:1px solid var(--border);
}
.learn-item:last-child{border-bottom:none;}
.learn-num{
  font-family:'Playfair Display',serif;
  font-size:36px;font-weight:700;
  color:var(--border);line-height:1;flex-shrink:0;
}
.learn-title{font-size:15px;font-weight:600;color:var(--ink);margin-bottom:6px;}
.learn-text{font-size:13px;color:var(--muted);line-height:1.8;}

/* footer */
footer{
  padding:60px 56px 40px;
  background:var(--ink);color:var(--white);
}
.ft-inner{
  max-width:var(--content-narrow);
  margin:0 auto;
  display:grid;
  grid-template-columns:1.5fr 1fr 1fr;
  gap:48px;
  margin-bottom:48px;
}
.ft-logo{
  font-family:'Playfair Display',serif;
  font-size:22px;font-weight:700;color:var(--white);margin-bottom:12px;
}
.ft-logo span{color:var(--accent);}
.ft-desc{font-size:13px;color:rgba(255,255,255,.3);line-height:1.8;max-width:220px;}
.ft-col-t{font-size:10px;letter-spacing:3px;text-transform:uppercase;color:var(--accent);margin-bottom:16px;}
.ft-lnk{
  display:block;font-size:13px;color:rgba(255,255,255,.3);
  padding:5px 0;border-bottom:1px solid rgba(255,255,255,.05);
  cursor:pointer;transition:color .2s;
}
.ft-lnk:hover{color:var(--white);}
.ft-btm{
  max-width:var(--content-narrow);
  margin:0 auto;display:flex;justify-content:space-between;align-items:center;
  padding-top:24px;border-top:1px solid rgba(255,255,255,.06);
  font-size:11px;color:rgba(255,255,255,.2);
}

/* top btn */
#top-btn{
  position:fixed;bottom:32px;right:32px;z-index:120;
  width:44px;height:44px;
  background:var(--ink);color:var(--white);
  font-size:18px;
  display:flex;align-items:center;justify-content:center;
  opacity:0;pointer-events:none;
  transition:opacity .3s;
}
#top-btn.show{opacity:1;pointer-events:all;}

/* responsive */
@media(max-width:900px){
  .desktop-rail{display:none;}
  .main{margin-left:0;}
  .mobile-topbar{display:flex;}
  #hero{grid-template-columns:1fr;}
  .hero-right{height:360px;}
  .g2{grid-template-columns:1fr;}
  .g3{grid-template-columns:1fr 1fr;}
  .g4{grid-template-columns:1fr 1fr;}
  .tbl{font-size:12px;}
  .ft-inner{grid-template-columns:1fr 1fr;gap:32px;}
}
@media(max-width:640px){
  .sec,.sec-alt,.sec-dark{padding:64px 20px;}
  .hero-left{padding:96px 20px 56px;}
  .hero-kpi{grid-template-columns:1fr 1fr;}
  .hero-kpi .kpi:last-child{display:none;}
  .g2,.g3,.g4{grid-template-columns:1fr;}
  .hero-badge{left:16px;bottom:16px;}
  .tbl-wrap{overflow-x:auto;}
  footer{padding:48px 20px 32px;}
  .ft-inner{grid-template-columns:1fr;}
  .ft-btm{flex-direction:column;gap:6px;text-align:center;}
  #top-btn{bottom:20px;right:20px;}
}
</style>
</head>
<body>

<div class="page-shell">

  <!-- Desktop Side Navigation -->
  <nav class="desktop-rail">
    <div class="rail-brand">Education</div>
    <div class="rail-item active" data-target="hero"><div class="rail-dot"></div><div class="rail-label">Top</div></div>
    <div class="rail-item" data-target="s1"><div class="rail-dot"></div><div class="rail-label">History</div></div>
    <div class="rail-item" data-target="s2"><div class="rail-dot"></div><div class="rail-label">Rank</div></div>
    <div class="rail-item" data-target="s3"><div class="rail-dot"></div><div class="rail-label">Flow</div></div>
    <div class="rail-item" data-target="s4"><div class="rail-dot"></div><div class="rail-label">Policy</div></div>
    <div class="rail-item" data-target="s5"><div class="rail-dot"></div><div class="rail-label">Talent</div></div>
    <div class="rail-item" data-target="s6"><div class="rail-dot"></div><div class="rail-label">Cost</div></div>
    <div class="rail-item" data-target="s7"><div class="rail-dot"></div><div class="rail-label">Compare</div></div>
    <div class="rail-item" data-target="s8"><div class="rail-dot"></div><div class="rail-label">Learn</div></div>
  </nav>

  <!-- Mobile Top Bar -->
  <header class="mobile-topbar">
    <div class="mobile-logo">Singapore<span>Education</span></div>
    <button id="hmbg" onclick="toggleMenu()">☰</button>
  </header>

  <div id="sp-menu">
    <div class="sp-lnk" onclick="go('s1')">01 — 歴史と政府方針</div>
    <div class="sp-lnk" onclick="go('s2')">02 — 教育の実績と世界ランキング</div>
    <div class="sp-lnk" onclick="go('s3')">03 — 初等〜大学の教育フロー</div>
    <div class="sp-lnk" onclick="go('s4')">04 — 優秀な人材を育てる政策</div>
    <div class="sp-lnk" onclick="go('s5')">05 — 人材登用とその報酬</div>
    <div class="sp-lnk" onclick="go('s6')">06 — 教育にかかる費用</div>
    <div class="sp-lnk" onclick="go('s7')">07 — 日本の教育との比較</div>
    <div class="sp-lnk" onclick="go('s8')">08 — シンガポールの教育から学べること</div>
  </div>

  <main class="main">

    <!-- HERO -->
    <section id="hero">
      <div class="hero-left">
        <div class="hero-eyebrow fade v">Singapore Education Guide</div>
        <h1 class="hero-t fade v d1">
          人材こそが<br>唯一の<br><em>天然資源</em>
        </h1>
        <p class="hero-desc fade v d2">
          天然資源を持たないシンガポールが、わずか60年でアジア屈指の先進国となった秘密——それは徹底した「人への投資」にある。世界が驚嘆する教育システムの全貌を解き明かす。
        </p>
        <div class="hero-kpi fade v d3">
          <div class="kpi">
            <div class="kpi-v">#1</div>
            <div class="kpi-l">PISA 2022<br>全3教科世界1位</div>
          </div>
          <div class="kpi">
            <div class="kpi-v">8位</div>
            <div class="kpi-l">QS世界大学ランキング<br>NUS 2025</div>
          </div>
          <div class="kpi">
            <div class="kpi-v">20%</div>
            <div class="kpi-l">国家予算に占める<br>教育投資の割合</div>
          </div>
        </div>
      </div>
      <div class="hero-right">
        <img id="hero-img"
          src="https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=1200&q=80"
          alt="Singapore Education">
        <div class="hero-badge">
          <div class="hero-badge-t">PISA 2022 Math Score</div>
          <div class="hero-badge-v">575点 — 世界第1位</div>
        </div>
      </div>
    </section>

    <!-- S1 -->
    <section id="s1" class="sec">
      <div class="inner">
        <div class="fade"><div class="sec-label">Chapter 01</div></div>
        <div class="fade d1"><h2 class="sec-title">教育の歴史と<br>政府の戦略的決断</h2></div>
        <div class="fade d2"><p class="sec-sub">History & Government Strategy — How Singapore Built a World-Class Education System</p></div>
        <div class="fade d2"><div class="sec-rule"></div></div>

        <div class="g2">
          <div>
            <div class="pull-quote fade">
              <blockquote>「言語は知識習得への鍵である。英語はシンガポールを世界経済へと接続する唯一の橋だ。」</blockquote>
              <cite>— リー・クアンユー（初代首相）</cite>
            </div>
            <p style="font-size:14px;color:var(--muted);line-height:1.9;margin-bottom:20px;" class="fade">
              1965年の独立時、シンガポールは人口200万人、天然資源皆無の小国だった。リー・クアンユー首相が下した最大の賭けのひとつが「英語を全教育の主言語とする」という決断だった。これは民族的対立を超えた中立言語の選択であり、同時に世界経済への扉を開く実用的戦略だった。
            </p>
            <p style="font-size:14px;color:var(--muted);line-height:1.9;" class="fade">
              1987年には全学校で英語を教育言語として統一。同時に各民族の母国語（中国語・マレー語・タミル語）を第2言語として義務付けるバイリンガル政策を確立。「文化的ルーツを守りながら世界で戦う人材を育てる」という哲学が今日の教育基盤を作った。
            </p>
          </div>
          <div>
            <div class="tl fade">
              <div class="tl-row">
                <div class="tl-side"><div class="tl-yr">1959</div><div class="tl-dot"></div><div class="tl-line"></div></div>
                <div class="tl-body">
                  <div class="tl-title">バイリンガル政策の始動</div>
                  <div class="tl-text">PAP政権が全学校に英語と母語の二言語教育を導入。民族間の共通言語として英語を採用。</div>
                </div>
              </div>
              <div class="tl-row">
                <div class="tl-side"><div class="tl-yr">1966</div><div class="tl-dot"></div><div class="tl-line"></div></div>
                <div class="tl-body">
                  <div class="tl-title">母語教育の義務化</div>
                  <div class="tl-text">全生徒が民族に応じた母語（中国語・マレー語・タミル語）を必修科目として学ぶ制度を確立。</div>
                </div>
              </div>
              <div class="tl-row">
                <div class="tl-side"><div class="tl-yr">1979</div><div class="tl-dot"></div><div class="tl-line"></div></div>
                <div class="tl-body">
                  <div class="tl-title">Goh Report（教育大改革）</div>
                  <div class="tl-text">Goh Keng Swee主導の教育改革報告書を発表。能力別クラス編成（ストリーミング）を導入し、個々の学力に合わせた教育を体系化。</div>
                </div>
              </div>
              <div class="tl-row">
                <div class="tl-side"><div class="tl-yr">1987</div><div class="tl-dot"></div><div class="tl-line"></div></div>
                <div class="tl-body">
                  <div class="tl-title">英語を全教科の教育言語に統一</div>
                  <div class="tl-text">全学校で英語を唯一の教育言語に。数学・理科・歴史すべてを英語で教える東南アジア初の事例となった。</div>
                </div>
              </div>
              <div class="tl-row">
                <div class="tl-side"><div class="tl-yr">1997</div><div class="tl-dot"></div><div class="tl-line"></div></div>
                <div class="tl-body">
                  <div class="tl-title">「Thinking Schools, Learning Nation」構想</div>
                  <div class="tl-text">暗記中心の教育から批判的思考・創造性重視へのパラダイムシフト。ICT活用と国際的な視野を持つ人材育成を宣言。</div>
                </div>
              </div>
              <div class="tl-row last">
                <div class="tl-side"><div class="tl-yr">2024</div><div class="tl-dot"></div></div>
                <div class="tl-body">
                  <div class="tl-title">Full Subject-Based Banding 全面実施</div>
                  <div class="tl-text">中学校でストリーミング制度を廃止。各科目の得意・不得意に応じてレベルを選べる個別最適化された学習体制へ移行完了。</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- S2 -->
    <section id="s2" class="sec-alt">
      <div class="inner">
        <div class="fade"><div class="sec-label">Chapter 02</div></div>
        <div class="fade d1"><h2 class="sec-title">世界を驚かせる<br>シンガポールの教育実績</h2></div>
        <div class="fade d2"><p class="sec-sub">World-Class Rankings & Academic Achievements</p></div>
        <div class="fade d2"><div class="sec-rule"></div></div>

        <div class="g4" style="margin-bottom:48px;">
          <div class="stat fade"><div class="stat-n">#1<span class="stat-u"> / 81</span></div><div class="stat-l">PISA 2022<br>数学・読解・理科 全3教科で世界1位</div></div>
          <div class="stat gold fade d1"><div class="stat-n">41<span class="stat-u">%</span></div><div class="stat-l">PISA数学トップ層（Level 5/6）の割合（OECD平均9%）</div></div>
          <div class="stat fade d2"><div class="stat-n">8位</div><div class="stat-l">NUS QS世界大学ランキング 2025（アジア1位）</div></div>
          <div class="stat fade d3"><div class="stat-n">9位</div><div class="stat-l">NTU QS世界大学ランキング 2025（アジア2位）</div></div>
        </div>

        <div class="g2">
          <div>
            <div class="card fade" style="margin-bottom:16px;">
              <div class="card-title">📊 PISA 2022 — 数学スコア比較</div>
              <div style="margin-top:14px;display:flex;flex-direction:column;gap:10px;">
                <div style="font-size:12px;">
                  <div style="display:flex;align-items:center;gap:10px;margin-bottom:8px;">
                    <span style="width:110px;font-size:12px;color:var(--ink);font-weight:600;">🇸🇬 シンガポール</span>
                    <div style="flex:1;height:6px;background:#f0f0f0;border-radius:3px;overflow:hidden;">
                      <div style="height:100%;width:100%;background:var(--accent);border-radius:3px;"></div>
                    </div>
                    <span style="font-weight:700;font-size:13px;color:var(--accent);width:32px;">575</span>
                  </div>
                  <div style="display:flex;align-items:center;gap:10px;margin-bottom:8px;">
                    <span style="width:110px;font-size:12px;color:var(--ink);">🇯🇵 日本</span>
                    <div style="flex:1;height:6px;background:#f0f0f0;border-radius:3px;overflow:hidden;">
                      <div style="height:100%;width:93%;background:var(--ink);border-radius:3px;"></div>
                    </div>
                    <span style="font-size:13px;color:var(--ink);width:32px;">536</span>
                  </div>
                  <div style="display:flex;align-items:center;gap:10px;margin-bottom:8px;">
                    <span style="width:110px;font-size:12px;color:var(--ink);">🇰🇷 韓国</span>
                    <div style="flex:1;height:6px;background:#f0f0f0;border-radius:3px;overflow:hidden;">
                      <div style="height:100%;width:91%;background:var(--ink);border-radius:3px;"></div>
                    </div>
                    <span style="font-size:13px;color:var(--ink);width:32px;">527</span>
                  </div>
                  <div style="display:flex;align-items:center;gap:10px;margin-bottom:8px;">
                    <span style="width:110px;font-size:12px;color:var(--muted);">🌍 OECD平均</span>
                    <div style="flex:1;height:6px;background:#f0f0f0;border-radius:3px;overflow:hidden;">
                      <div style="height:100%;width:82%;background:#ccc;border-radius:3px;"></div>
                    </div>
                    <span style="font-size:13px;color:var(--muted);width:32px;">472</span>
                  </div>
                  <div style="display:flex;align-items:center;gap:10px;">
                    <span style="width:110px;font-size:12px;color:var(--muted);">🇺🇸 アメリカ</span>
                    <div style="flex:1;height:6px;background:#f0f0f0;border-radius:3px;overflow:hidden;">
                      <div style="height:100%;width:81%;background:#ccc;border-radius:3px;"></div>
                    </div>
                    <span style="font-size:13px;color:var(--muted);width:32px;">465</span>
                  </div>
                </div>
              </div>
            </div>

            <div class="card fade" style="background:var(--ink);border-color:var(--ink);">
              <div style="font-size:12px;letter-spacing:3px;text-transform:uppercase;color:rgba(201,148,58,.8);margin-bottom:10px;">QS World University Rankings 2025</div>
              <div style="display:grid;grid-template-columns:1fr 1fr;gap:16px;">
                <div><div style="font-family:'Playfair Display',serif;font-size:32px;font-weight:700;color:var(--accent);">#8</div><div style="font-size:11px;color:rgba(255,255,255,.4);margin-top:4px;">NUS<br>National University of Singapore</div></div>
                <div><div style="font-family:'Playfair Display',serif;font-size:32px;font-weight:700;color:#fff;">#9</div><div style="font-size:11px;color:rgba(255,255,255,.4);margin-top:4px;">NTU<br>Nanyang Technological University</div></div>
              </div>
            </div>
          </div>

          <div>
            <img src="https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=700&q=80"
              alt="University" style="width:100%;height:220px;object-fit:cover;margin-bottom:16px;" class="fade">

            <div style="display:grid;grid-template-columns:1fr 1fr;gap:12px;" class="fade">
              <div class="card card-accent">
                <div class="card-icon">🔬</div>
                <div class="card-title">TIMSS 理数教育</div>
                <div class="card-text">国際理数教育調査（TIMSS）でも数学・理科ともに世界トップクラスを維持。特にP4（小4）・S2（中2）の両学年で上位をキープ。</div>
              </div>
              <div class="card card-accent">
                <div class="card-icon">🏫</div>
                <div class="card-title">THE 若手大学ランキング</div>
                <div class="card-text">NTUはTHE Young University Rankingsで2年連続世界1位（2024年）を獲得。設立50年以内の大学中で世界最高評価。</div>
              </div>
              <div class="card card-accent">
                <div class="card-icon">📖</div>
                <div class="card-title">PIRLS 読解力</div>
                <div class="card-text">PIRLS 2021（国際読解力調査）でもシンガポールは世界トップ水準。読解力においても全ラウンドで安定した高成績を維持。</div>
              </div>
              <div class="card card-accent">
                <div class="card-icon">🌍</div>
                <div class="card-title">15%の学術オールラウンダー</div>
                <div class="card-text">PISA 2022で数学・読解・理科すべてで高得点を取った「学術万能型」生徒の割合は15%（OECD平均3.3%）で世界最高。</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- S3 -->
    <section id="s3" class="sec">
      <div class="inner">
        <div class="fade"><div class="sec-label">Chapter 03</div></div>
        <div class="fade d1"><h2 class="sec-title">初等教育から大学まで<br>教育のフローと特徴</h2></div>
        <div class="fade d2"><p class="sec-sub">Education Pathway — From Kindergarten to University</p></div>
        <div class="fade d2"><div class="sec-rule"></div></div>

        <div class="g2">
          <div class="path-wrap fade">
            <div class="path-item">
              <div class="path-age">0〜6歳 / Pre-school</div>
              <div class="path-title">プリスクール（幼稚園）</div>
              <div class="path-text">政府補助を受けたMOE Kindergarten（MK）が全島に展開。英語・母語・算数・生活教育の基礎。99%以上が就学前教育を受ける。</div>
              <div class="path-tags"><span class="tag">英語</span><span class="tag">母語</span><span class="tag">算数基礎</span></div>
            </div>
            <div class="path-item">
              <div class="path-age">7〜12歳 / Primary School</div>
              <div class="path-title">初等教育（6年間）</div>
              <div class="path-text">英語・数学・理科・母語が必修。P5〜P6でSubject-Based Banding（科目別習熟度別学習）を導入。6年修了時に<strong>PSLE（小学校卒業試験）</strong>を受験。</div>
              <div class="path-tags"><span class="tag fill">PSLE 受験</span><span class="tag">英語</span><span class="tag">数学</span><span class="tag">理科</span><span class="tag">母語</span></div>
            </div>
            <div class="path-item">
              <div class="path-age">13〜16歳 / Secondary School</div>
              <div class="path-title">中等教育（4〜5年間）</div>
              <div class="path-text">2024年よりFull Subject-Based Banding（全科目習熟度別）を全面実施。ストリーミング廃止により、得意科目は上位レベルで学習可能。GCE O-Level（またはN-Level）を受験。</div>
              <div class="path-tags"><span class="tag fill">O-Level</span><span class="tag">GEP（特別英才クラス）</span><span class="tag">課外活動（CCA）必修</span></div>
            </div>
            <div class="path-item">
              <div class="path-age">17〜18歳 / Post-Secondary</div>
              <div class="path-title">大学進学前教育（Junior College / Polytechnic / ITE）</div>
              <div class="path-text">3つの進路に分岐：<br>①Junior College（2年）→ A-Level → 大学<br>②Polytechnic（3年）→ 実践的ディプロマ → 就職・大学<br>③ITE（2年）→ 職業訓練 → 就職・Polytechnic</div>
              <div class="path-tags"><span class="tag">A-Level</span><span class="tag gold">IP（一貫教育校）</span><span class="tag">IB</span></div>
            </div>
            <div class="path-item">
              <div class="path-age">19歳〜 / University</div>
              <div class="path-title">大学教育（4年間）</div>
              <div class="path-text">NUS・NTU・SMU・SITなど6つの自律型大学。国際共同研究・起業家育成プログラムが充実。政府の学費補助（MOE Tuition Grant）により市民は大幅割引。</div>
              <div class="path-tags"><span class="tag fill">NUS / NTU</span><span class="tag">MOE Tuition Grant</span><span class="tag gold">PSC奨学金</span></div>
            </div>
          </div>

          <div>
            <div class="card fade" style="margin-bottom:16px;">
              <div class="card-title">🎯 PSLE（小学校卒業試験）とは</div>
              <div class="card-text" style="margin-top:8px;">
                Primary School Leaving Examination——シンガポール教育の最初の関門。英語・数学・理科・母語の4科目を受験。<strong>2021年より新スコアリング制度（Achievement Level方式）</strong>を導入し、点数の細かな序列化を廃止。中学校への進学先を決定する国家試験だが、高校卒業試験・大学入試も同様の重みを持つ。
              </div>
            </div>

            <div class="card fade" style="margin-bottom:16px;">
              <div class="card-title">🏆 Gifted Education Programme（GEP）</div>
              <div class="card-text" style="margin-top:8px;">
                1984年設立の英才教育プログラム。全国の上位約1%の児童を対象に、高次思考・創造性・研究スキルを集中的に養成。2024年からは特定校中心の制度から、全小学校での「High Ability Learner Programme」に移行し、より広い層への才能発掘を推進。
              </div>
            </div>

            <div class="card fade">
              <div class="card-title">⚽ 課外活動（Co-Curricular Activities）の義務化</div>
              <div class="card-text" style="margin-top:8px;">
                シンガポールでは課外活動（CCA）が成績評価に組み込まれている。スポーツ・音楽・ボランティア・クラブ活動などを通じてリーダーシップ・協調性・レジリエンスを育成。大学進学に際してもCCAの実績は重要視される。「学力だけの秀才」は育てない哲学が根底にある。
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- S4 -->
    <section id="s4" class="sec-alt">
      <div class="inner">
        <div class="fade"><div class="sec-label">Chapter 04</div></div>
        <div class="fade d1"><h2 class="sec-title">優秀な人材を育てる<br>教育方針と政策</h2></div>
        <div class="fade d2"><p class="sec-sub">Education Policies & Talent Development Strategy</p></div>
        <div class="fade d2"><div class="sec-rule"></div></div>

        <div class="g3" style="margin-bottom:48px;">
          <div class="card card-accent fade">
            <div class="card-icon">🇸🇬</div>
            <div class="card-title">メリトクラシー（能力主義）</div>
            <div class="card-text">「出自や家庭環境に関係なく、能力と努力で誰でも頂点に立てる」というメリトクラシーが教育の根幹。奨学金・補助金制度により、低所得家庭の生徒も平等にチャンスが与えられる設計。</div>
          </div>
          <div class="card card-accent fade d1">
            <div class="card-icon">🧠</div>
            <div class="card-title">21世紀型スキルの重視</div>
            <div class="card-text">「Thinking Schools, Learning Nation」以来、批判的思考・創造性・コミュニケーション・情報活用を全学年で育成。暗記中心の教育から「なぜ？」を問う教育へシフト。</div>
          </div>
          <div class="card card-accent fade d2">
            <div class="card-icon">🌐</div>
            <div class="card-title">バイリンガル教育の徹底</div>
            <div class="card-text">英語を共通言語とし、中国語・マレー語・タミル語のいずれかを母語として必修化。グローバルに通用しながら文化的アイデンティティを保持する人材育成を同時実現。</div>
          </div>
          <div class="card card-accent fade d3">
            <div class="card-icon">📐</div>
            <div class="card-title">シンガポール数学（Maths Method）</div>
            <div class="card-text">視覚的モデル（Bar Model）を使った独自の数学教授法は「Singapore Math」として世界中の学校に採用されている。概念理解から問題解決へのアプローチが特徴。</div>
          </div>
          <div class="card card-accent fade d1">
            <div class="card-icon">💪</div>
            <div class="card-title">教師の質と地位の高さ</div>
            <div class="card-text">教師は各学年の上位30%の大卒者から選抜。給与は民間競合水準に設定し、継続的な研修・専門能力開発（約100時間/年）が義務付けられている。</div>
          </div>
          <div class="card card-accent fade d2">
            <div class="card-icon">🔄</div>
            <div class="card-title">LifeLong Learning（生涯学習）</div>
            <div class="card-text">SkillsFutureプログラムにより、25歳以上のシンガポール市民全員に学習クレジット（S$500〜）を付与。社会人のリスキリング・アップスキリングを国が支援。</div>
          </div>
        </div>

        <div class="g2">
          <div>
            <img src="https://images.unsplash.com/photo-1580582932707-520aed937b7b?w=700&q=80"
              alt="Classroom" style="width:100%;height:260px;object-fit:cover;" class="fade">
          </div>
          <div class="fade d1">
            <h3 style="font-family:'Noto Serif JP',serif;font-size:20px;font-weight:300;margin-bottom:16px;line-height:1.4;">「教育は国家の生命線」<br>——予算の20%を教育に投資</h3>
            <p style="font-size:14px;color:var(--muted);line-height:1.9;margin-bottom:16px;">シンガポール政府は毎年、国家予算の約20%を教育に充当している。これはGDP比約3%に相当し、先進国の中でも高い水準。</p>
            <p style="font-size:14px;color:var(--muted);line-height:1.9;">特徴的なのは「Edusave奨学金制度」。全ての市民学生に対し政府が年間200〜1,000 S$のEdusaveアカウントへの積立を行い、課外活動費・教材費・塾代等に充当できる。低所得家庭には追加補助も。</p>
          </div>
        </div>
      </div>
    </section>

    <!-- S5 -->
    <section id="s5" class="sec-dark">
      <div class="inner">
        <div class="fade"><div class="sec-label">Chapter 05</div></div>
        <div class="fade d1"><h2 class="sec-title">優秀な人材の登用方針と報酬</h2></div>
        <div class="fade d2"><p class="sec-sub">Talent Recruitment & Competitive Compensation</p></div>
        <div class="fade d2"><div class="sec-rule"></div></div>

        <div class="g2" style="margin-bottom:48px;">
          <div>
            <p style="font-size:14px;color:rgba(255,255,255,.55);line-height:1.9;margin-bottom:20px;" class="fade">
              シンガポールの人材登用システムは「優秀な人材を国家の中枢に引き込む」ための精緻な設計になっている。PSC（公務委員会）奨学金から大臣の報酬体系まで、一貫して「最高の人材に最高の報酬を」という原則が貫かれている。
            </p>
            <div class="dark-card fade d1" style="margin-bottom:16px;">
              <div style="font-size:10px;letter-spacing:3px;text-transform:uppercase;color:rgba(201,148,58,.7);margin-bottom:8px;">PSC Scholarship（公務委員会奨学金）</div>
              <div class="dark-card-title">シンガポール最高峰の国家奨学金</div>
              <div class="dark-card-text" style="margin-top:6px;">成績優秀者を対象に、世界最高峰大学への留学費用を全額政府負担。卒業後は省庁・統計庁・外務省等の幹部候補として国家に奉仕。2024年は54件のPSC奨学金を授与（うちPresident's Scholarship含む）。採用基準は学力だけでなく、リーダーシップ・CCA実績・人格・国家奉仕の意志を総合評価。</div>
            </div>
            <div class="dark-card fade d2">
              <div style="font-size:10px;letter-spacing:3px;text-transform:uppercase;color:rgba(201,148,58,.7);margin-bottom:8px;">Administrative Service（エリート官僚コース）</div>
              <div class="dark-card-title">Permanent Secretary（次官）への登竜門</div>
              <div class="dark-card-text" style="margin-top:6px;">最高のPSC奨学生はAdministrative Service（AS）に配属。複数省庁でのローテーション・海外研修・民間セクター出向を経て、将来の省庁トップ・大臣へと育成。成果に基づく厳格な年次評価で昇進。民間の成功報酬システムと同様の考え方。</div>
            </div>
          </div>
          <div>
            <div class="fade">
              <div style="margin-bottom:28px;">
                <div style="font-size:10px;letter-spacing:3px;text-transform:uppercase;color:rgba(201,148,58,.7);margin-bottom:16px;">大臣の年収（参考）</div>
                <div style="display:flex;flex-direction:column;gap:12px;">
                  <div style="border-top:1px solid rgba(255,255,255,.1);padding-top:12px;">
                    <div style="font-family:'Playfair Display',serif;font-size:28px;font-weight:700;color:var(--accent);">S$110万</div>
                    <div style="font-size:12px;color:rgba(255,255,255,.35);margin-top:4px;">大臣（MR4）の年収基準（固定＋変動含む）</div>
                  </div>
                  <div style="border-top:1px solid rgba(255,255,255,.1);padding-top:12px;">
                    <div style="font-family:'Playfair Display',serif;font-size:28px;font-weight:700;color:var(--white);">民間連動</div>
                    <div style="font-size:12px;color:rgba(255,255,255,.35);margin-top:4px;">弁護士・銀行家・CEOの上位報酬水準に連動</div>
                  </div>
                  <div style="border-top:1px solid rgba(255,255,255,.1);padding-top:12px;">
                    <div style="font-family:'Playfair Display',serif;font-size:28px;font-weight:700;color:var(--white);">GDP連動</div>
                    <div style="font-size:12px;color:rgba(255,255,255,.35);margin-top:4px;">国家ボーナスは実質GDP成長率・失業率など4指標に連動</div>
                  </div>
                </div>
              </div>
              <div class="dark-card">
                <div class="dark-card-title">なぜ高給が正当化されるのか</div>
                <div class="dark-card-text" style="margin-top:8px;">①民間に流れる優秀人材を官僚・政治に呼び込む ②腐敗・汚職のインセンティブを排除 ③成果が出なければ降格・罷免というKPI評価の透明性 ④シンガポール政府の廉潔度は世界トップクラスを維持（国際腐敗認知指数 2024: 5位）</div>
              </div>
            </div>
          </div>
        </div>

        <div class="g4">
          <div class="stat gold fade"><div class="stat-n">54<span class="stat-u">件</span></div><div class="stat-l">2024年 PSC奨学金授与数</div></div>
          <div class="stat fade d1"><div class="stat-n">5位</div><div class="stat-l">廉潔度指数（2024年・世界5位）</div></div>
          <div class="stat fade d2"><div class="stat-n">4〜6<span class="stat-u">年</span></div><div class="stat-l">PSC奨学生の奉仕義務期間（ボンド）</div></div>
          <div class="stat fade d3"><div class="stat-n">100%</div><div class="stat-l">PSC奨学金は完全実力主義・非needs-based</div></div>
        </div>
      </div>
    </section>

    <!-- S6 -->
    <section id="s6" class="sec">
      <div class="inner">
        <div class="fade"><div class="sec-label">Chapter 06</div></div>
        <div class="fade d1"><h2 class="sec-title">教育にかかる費用の全体像</h2></div>
        <div class="fade d2"><p class="sec-sub">Total Cost of Education — School Fees, Tuition & Enrichment</p></div>
        <div class="fade d2"><div class="sec-rule"></div></div>

        <div class="g2" style="margin-bottom:40px;">
          <div class="fade">
            <h3 style="font-size:16px;font-weight:600;margin-bottom:16px;">シンガポール市民の公立学校費用</h3>
            <div class="tbl-wrap">
              <table class="tbl">
                <thead><tr><th>段階</th><th>月額学費</th><th>備考</th></tr></thead>
                <tbody>
                  <tr><td>初等教育（P1〜P6）</td><td style="color:var(--accent);font-weight:700;">無料</td><td>公立政府系学校は学費0</td></tr>
                  <tr><td>中等教育（S1〜S4/5）</td><td>S$5/月</td><td>年間S$60程度</td></tr>
                  <tr><td>Junior College（2年）</td><td>S$6/月</td><td>大学進学前教育</td></tr>
                  <tr><td>大学（4年間合計）</td><td>平均S$38,790</td><td>MOE補助後・市民価格</td></tr>
                  <tr><td>大学（非補助・外国人）</td><td>平均S$162,200</td><td>補助なし・4年間合計</td></tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="fade d1">
            <h3 style="font-size:16px;font-weight:600;margin-bottom:16px;">塾・習い事のリアルな費用</h3>
            <div style="display:flex;flex-direction:column;gap:8px;">
              <div style="display:flex;justify-content:space-between;align-items:center;padding:12px 0;border-bottom:1px solid var(--border);">
                <div>
                  <div style="font-size:14px;font-weight:600;">学習塾（1科目・月額）</div>
                  <div style="font-size:12px;color:var(--muted);">初等学校レベル</div>
                </div>
                <div style="font-weight:700;color:var(--accent);">S$200〜375</div>
              </div>
              <div style="display:flex;justify-content:space-between;align-items:center;padding:12px 0;border-bottom:1px solid var(--border);">
                <div>
                  <div style="font-size:14px;font-weight:600;">学習塾（1科目・月額）</div>
                  <div style="font-size:12px;color:var(--muted);">中等学校レベル</div>
                </div>
                <div style="font-weight:700;color:var(--accent);">S$220〜460</div>
              </div>
              <div style="display:flex;justify-content:space-between;align-items:center;padding:12px 0;border-bottom:1px solid var(--border);">
                <div>
                  <div style="font-size:14px;font-weight:600;">音楽・スポーツ等の習い事</div>
                  <div style="font-size:12px;color:var(--muted);">月額目安</div>
                </div>
                <div style="font-weight:700;">S$100〜400</div>
              </div>
              <div style="display:flex;justify-content:space-between;align-items:center;padding:12px 0;border-bottom:1px solid var(--border);">
                <div>
                  <div style="font-size:14px;font-weight:600;">塾産業の規模（年間）</div>
                  <div style="font-size:12px;color:var(--muted);">シンガポール全体</div>
                </div>
                <div style="font-weight:700;">S$14億超</div>
              </div>
              <div style="display:flex;justify-content:space-between;align-items:center;padding:12px 0;">
                <div>
                  <div style="font-size:14px;font-weight:600;">幼稚園〜大学の総費用</div>
                  <div style="font-size:12px;color:var(--muted);">市民・公立学校のみの試算</div>
                </div>
                <div style="font-weight:700;color:var(--ink);">S$7.1万〜</div>
              </div>
            </div>
          </div>
        </div>

        <div class="card fade" style="background:rgba(201,148,58,.06);border-color:rgba(201,148,58,.2);">
          <div style="font-size:12px;letter-spacing:3px;text-transform:uppercase;color:var(--accent);margin-bottom:10px;">Key Insight</div>
          <p style="font-size:14px;color:var(--ink);line-height:1.9;">シンガポール市民の公立学校教育は「ほぼ無料」に近い水準まで政府が補助している一方、塾・習い事への支出は家庭の教育意識の高さから年間数万S$に達するケースも珍しくない。「公教育は平等に安く、課外投資は家庭の裁量」という構造が明確で、格差の問題とともに塾産業の肥大化が社会的議論を呼んでいる。</p>
        </div>
      </div>
    </section>

    <!-- S7 -->
    <section id="s7" class="sec-alt">
      <div class="inner-wide">
        <div class="fade"><div class="sec-label">Chapter 07</div></div>
        <div class="fade d1"><h2 class="sec-title">日本の教育との比較</h2></div>
        <div class="fade d2"><p class="sec-sub">Singapore vs. Japan — A Comparative Analysis</p></div>
        <div class="fade d2"><div class="sec-rule"></div></div>

        <div class="tbl-wrap fade">
          <table class="tbl">
            <thead>
              <tr>
                <th>比較項目</th>
                <th>🇸🇬 シンガポール</th>
                <th>🇯🇵 日本</th>
              </tr>
            </thead>
            <tbody>
              <tr><td>PISA 2022 総合スコア</td><td style="color:var(--accent);font-weight:700;">560点（世界1位）</td><td>526点（世界3位）</td></tr>
              <tr><td>PISA数学スコア</td><td style="color:var(--accent);font-weight:700;">575点（世界1位）</td><td>536点（世界5位）</td></tr>
              <tr><td>世界大学ランキング最高位</td><td>NUS 8位（QS 2025）</td><td>東京大学 28位（QS 2025）</td></tr>
              <tr><td>教育言語</td><td>英語（第1言語）＋母語</td><td>日本語（単一言語）</td></tr>
              <tr><td>主な国家試験</td><td>PSLE（小6）→ O-Level → A-Level</td><td>高校入試 → 大学入学共通テスト</td></tr>
              <tr><td>能力別クラス編成</td><td>Subject-Based Banding（科目別）</td><td>高校受験で習熟度別に振り分け</td></tr>
              <tr><td>英語教育</td><td>全教科の教育言語（1959年〜）</td><td>週数時間の英語授業のみ</td></tr>
              <tr><td>課外活動（部活）の位置づけ</td><td>CCAとして単位・内申に組み込み</td><td>任意だが内申参考・ブラック部活問題</td></tr>
              <tr><td>教師の採用基準</td><td>上位30%の大卒者から選抜</td><td>教員免許取得者から採用（倍率低下傾向）</td></tr>
              <tr><td>国家予算の教育費比率</td><td>約20%</td><td>約6〜8%</td></tr>
              <tr><td>大学学費（4年間・市民）</td><td>S$2.4〜5.4万（補助後）</td><td>約240万円（国立）・420万円（私立平均）</td></tr>
              <tr><td>塾・補習産業</td><td>S$14億超/年（家庭の積極投資）</td><td>約2兆円/年（学力補完・受験対策中心）</td></tr>
              <tr><td>大学院進学率</td><td>高い（大学院・海外留学を奨励）</td><td>低下傾向（学部卒で就職が主流）</td></tr>
              <tr><td>政府の人材登用方針</td><td>PSC奨学金→エリート官僚コース→高給</td><td>国家公務員試験→年功序列→相対的低給</td></tr>
            </tbody>
          </table>
        </div>

        <div class="g2" style="margin-top:40px;">
          <div class="card card-accent fade">
            <div class="card-title">🇸🇬 シンガポール教育の強み</div>
            <div class="card-text" style="margin-top:8px;">英語を共通語とした国際競争力の高さ、メリトクラシーによる公平なチャンス、厳格な教師選抜と高い地位、PSC奨学金を通じた官民人材循環、継続的な制度改革とデータ重視の政策立案。</div>
          </div>
          <div class="card card-accent fade d1">
            <div class="card-title">🇯🇵 日本が参考にできる点</div>
            <div class="card-text" style="margin-top:8px;">英語教育の本格化・低年齢からの導入、教師の選抜基準の見直しと待遇改善、課外活動の評価体系の整備、能力別最適化教育の仕組み、生涯学習を支援する財政的サポートの拡充。</div>
          </div>
        </div>
      </div>
    </section>

    <!-- S8 -->
    <section id="s8" class="sec">
      <div class="inner">
        <div class="fade"><div class="sec-label">Chapter 08</div></div>
        <div class="fade d1"><h2 class="sec-title">シンガポールの教育から<br>学べること</h2></div>
        <div class="fade d2"><p class="sec-sub">Key Lessons — What the World Can Learn from Singapore</p></div>
        <div class="fade d2"><div class="sec-rule"></div></div>

        <div style="margin-bottom:48px;">
          <div class="learn-item fade">
            <div class="learn-num">01</div>
            <div><div class="learn-title">「言語の選択」が国の未来を決める</div><div class="learn-text">英語を全教育の媒体とする選択は、シンガポールを国際ビジネス・金融・研究のハブにした決定的要因。言語政策は単なる文化政策ではなく、国家の経済戦略そのものだった。</div></div>
          </div>
          <div class="learn-item fade d1">
            <div class="learn-num">02</div>
            <div><div class="learn-title">教育への投資は最大のROIをもたらす</div><div class="learn-text">国家予算の20%を教育に投じる選択は、数十年後に世界1位の教育水準として回収された。人材こそが小国の唯一の競争優位という哲学を予算配分が証明している。</div></div>
          </div>
          <div class="learn-item fade d2">
            <div class="learn-num">03</div>
            <div><div class="learn-title">「教師の質」が教育の質を決定する</div><div class="learn-text">上位30%の大卒者から教師を選抜し、十分な報酬・研修・社会的地位を与える。教師の質の担保なしに教育の質は上がらないという単純だが見落とされがちな真実。</div></div>
          </div>
          <div class="learn-item fade d3">
            <div class="learn-num">04</div>
            <div><div class="learn-title">メリトクラシーは「スタートラインの平等」が前提</div><div class="learn-text">能力主義が機能するのは、貧富に関わらず全員が良質な教育を受けられる環境があってこそ。補助金・奨学金・無料給食などの仕組みが「努力が報われる」社会を可能にしている。</div></div>
          </div>
          <div class="learn-item fade">
            <div class="learn-num">05</div>
            <div><div class="learn-title">「学力＋人格＋リーダーシップ」の三位一体評価</div><div class="learn-text">PSC奨学金選考もCCA評価も、学力単体ではなく人格・協調性・社会貢献意欲を含めた全人評価。学歴社会でありながら「試験だけで決まらない」システムが創造性・多様性を守っている。</div></div>
          </div>
          <div class="learn-item fade d1">
            <div class="learn-num">06</div>
            <div><div class="learn-title">優秀な人材には「国家が戦える報酬を」与える</div><div class="learn-text">大臣・官僚の高給は贅沢ではなく、最高の人材が公共セクターで働くための戦略的コスト。「優秀な人が民間に逃げる社会」より、「最高の人材が国家を動かす社会」を設計した結果。</div></div>
          </div>
        </div>

        <div class="pull-quote fade">
          <blockquote>「私たちには天然資源も農地も何もなかった。<br>あるのは人間だけだった。だから人間を大切にした。」</blockquote>
          <cite>— リー・クアンユー（シンガポール初代首相）</cite>
        </div>
      </div>
    </section>

    <!-- FOOTER -->
    <footer>
      <div class="ft-inner">
        <div>
          <div class="ft-logo">Singapore<span>Education</span></div>
          <p class="ft-desc">シンガポールの教育制度を、歴史・数字・政策から多角的に解説するナレッジガイド。</p>
        </div>
        <div>
          <div class="ft-col-t">Contents</div>
          <div class="ft-lnk" onclick="go('s1')">01 — 歴史と政府方針</div>
          <div class="ft-lnk" onclick="go('s2')">02 — 世界ランキングと実績</div>
          <div class="ft-lnk" onclick="go('s3')">03 — 初等〜大学の教育フロー</div>
          <div class="ft-lnk" onclick="go('s4')">04 — 教育方針と政策</div>
          <div class="ft-lnk" onclick="go('s5')">05 — 人材登用と報酬</div>
          <div class="ft-lnk" onclick="go('s6')">06 — 教育費用</div>
          <div class="ft-lnk" onclick="go('s7')">07 — 日本との比較</div>
          <div class="ft-lnk" onclick="go('s8')">08 — 学べること</div>
        </div>
        <div>
          <div class="ft-col-t">Data Sources</div>
          <p class="ft-lnk" style="cursor:default;">OECD PISA 2022 / MOE Singapore</p>
          <p class="ft-lnk" style="cursor:default;">QS World University Rankings 2025</p>
          <p class="ft-lnk" style="cursor:default;">Public Service Commission (PSC)</p>
          <p class="ft-lnk" style="cursor:default;">Ministry of Education Singapore</p>
          <p class="ft-lnk" style="cursor:default;">最終更新: 2025年</p>
        </div>
      </div>
      <div class="ft-btm">
        <span>© 2025 Singapore Life Guide — Education</span>
        <span>Images: Unsplash (CC0 License)</span>
      </div>
    </footer>
  </main>
</div>

<button id="top-btn" onclick="window.scrollTo({top:0,behavior:'smooth'})">↑</button>

<script>
const sections = ['hero','s1','s2','s3','s4','s5','s6','s7','s8'];
const railItems = document.querySelectorAll('.rail-item');

function go(id){
  document.getElementById(id)?.scrollIntoView({behavior:'smooth'});
  document.getElementById('sp-menu').classList.remove('open');
}

function toggleMenu(){
  document.getElementById('sp-menu').classList.toggle('open');
}

railItems.forEach(item=>{
  item.addEventListener('click',()=>go(item.dataset.target));
});

document.addEventListener('click',e=>{
  const m=document.getElementById('sp-menu');
  const h=document.getElementById('hmbg');
  if(m && h && !m.contains(e.target) && !h.contains(e.target)) m.classList.remove('open');
});

function setActiveNav(id){
  railItems.forEach(item=>{
    item.classList.toggle('active', item.dataset.target===id);
  });
}

const secObserver = new IntersectionObserver(entries=>{
  entries.forEach(e=>{
    if(e.isIntersecting){
      setActiveNav(e.target.id);
    }
  });
},{threshold:0.24});

sections.forEach(id=>{
  const el=document.getElementById(id);
  if(el) secObserver.observe(el);
});

window.addEventListener('load',()=>{
  document.getElementById('hero-img')?.classList.add('rdy');
});

const fades = document.querySelectorAll('.fade');
const fadeObs = new IntersectionObserver(entries=>{
  entries.forEach(e=>{
    if(e.isIntersecting)e.target.classList.add('v');
  });
},{threshold:0.1});
fades.forEach(el=>{
  if(!el.classList.contains('v')) fadeObs.observe(el);
});

const topBtn = document.getElementById('top-btn');
window.addEventListener('scroll',()=>{
  topBtn.classList.toggle('show', window.scrollY>500);
});
</script>
</body>
</html>
