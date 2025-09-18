<!doctype html>
<html lang="id">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Sawn Timber Mobile — README</title>
  <meta name="description" content="Aplikasi mobile untuk perhitungan dan manajemen data kayu gergajian (sawn timber)." />
  <style>
    :root{
      --bg:#0f1724;
      --card:#0b1220;
      --muted:#9aa4b2;
      --accent:#60a5fa;
      --glass: rgba(255,255,255,0.03);
      --radius:12px;
      --max-width:900px;
      font-family: Inter, ui-sans-serif, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
    }
    body{
      background: linear-gradient(180deg,#071027 0%, #071221 100%);
      color:#e6eef8;
      margin:0;
      padding:40px 16px;
      display:flex;
      justify-content:center;
      -webkit-font-smoothing:antialiased;
      -moz-osx-font-smoothing:grayscale;
    }
    .container{
      width:100%;
      max-width:var(--max-width);
      background: linear-gradient(180deg, rgba(255,255,255,0.02), rgba(255,255,255,0.01));
      border-radius:var(--radius);
      box-shadow: 0 8px 30px rgba(2,6,23,0.8);
      padding:28px;
      border:1px solid rgba(255,255,255,0.03);
    }
    header{ display:flex; gap:18px; align-items:center; }
    .logo{
      width:72px; height:72px;
      background:linear-gradient(135deg,#0ea5a9,#7c3aed);
      border-radius:12px;
      display:flex; align-items:center; justify-content:center;
      font-weight:700; font-size:20px; color:white;
      box-shadow: 0 6px 18px rgba(124,58,237,0.12);
    }
    h1{ margin:0; font-size:22px; }
    p.lead{ color:var(--muted); margin:6px 0 0 0; font-size:14px; }
    .badges{ margin-top:12px; display:flex; gap:8px; flex-wrap:wrap; }
    .card{ margin-top:18px; background:var(--card); padding:18px; border-radius:10px; border:1px solid rgba(255,255,255,0.02); }
    h2{ margin:0 0 12px 0; font-size:16px; }
    ul{ margin:0 0 12px 18px; color:var(--muted); }
    code, pre{ background:var(--glass); padding:6px 8px; border-radius:8px; font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, "Roboto Mono", "Courier New", monospace; font-size:13px; color:#cfe9ff; }
    .columns{ display:grid; grid-template-columns:1fr 1fr; gap:12px; }
    @media (max-width:720px){ .columns{ grid-template-columns:1fr; } header{ flex-direction:column; align-items:flex-start; } .logo{ width:64px; height:64px; } }
    .screenshot{ max-width:100%; border-radius:8px; border:1px solid rgba(255,255,255,0.03); display:block; margin-top:8px; }
    .footer{ margin-top:16px; color:var(--muted); font-size:13px; display:flex; justify-content:space-between; gap:12px; flex-wrap:wrap; }
    a { color: var(--accent); text-decoration: none; }
    a:hover { text-decoration: underline; }
    .pill{ display:inline-block; padding:6px 10px; background:rgba(255,255,255,0.02); border-radius:999px; font-size:13px; color:var(--muted); border:1px solid rgba(255,255,255,0.02); }
  </style>
</head>
<body>
  <div class="container" role="main">
    <header>
      <div class="logo">ST</div>
      <div>
        <h1>Sawn Timber Mobile <span class="pill">v1.0.0</span></h1>
        <p class="lead">Aplikasi mobile untuk menghitung volume, manajemen data, dan dokumentasi kayu gergajian (sawn timber).</p>
        <div class="badges">
          <img src="https://img.shields.io/badge/build-passing-green?style=flat" alt="build">
          <img src="https://img.shields.io/badge/license-MIT-blue?style=flat" alt="license">
          <img src="https://img.shields.io/badge/platform-Android%20%7C%20iOS-lightgrey?style=flat" alt="platform">
        </div>
      </div>
    </header>

    <section class="card" id="deskripsi">
      <h2>Deskripsi</h2>
      <p style="color:var(--muted); margin-top:8px;">
        <strong>Sawn Timber Mobile</strong> adalah aplikasi untuk membantu industri dan pekerja lapangan dalam menghitung volume kayu gergajian, mencatat data transaksi, serta menyimpan dokumentasi foto. Dibangun dengan <em>mobile-first approach</em> sehingga bisa digunakan offline maupun online.
      </p>
    </section>

    <section class="card" id="fitur">
      <h2>Fitur Utama</h2>
      <ul>
        <li>📏 Kalkulator volume kayu otomatis (m³, ft³, atau unit lain).</li>
        <li>📸 Upload foto dokumen & serah terima langsung dari kamera/galeri.</li>
        <li>💾 Penyimpanan data lokal dengan sinkronisasi ke server.</li>
        <li>📊 Laporan rekap data kayu.</li>
      </ul>
    </section>

    <div class="columns">
      <section class="card" id="instalasi">
        <h2>Instalasi</h2>
        <p style="color:var(--muted)">Clone repositori dan jalankan di emulator / device:</p>
        <pre><code>git clone https://github.com/username/sawn-timber-mobile.git
cd sawn-timber-mobile

# Android (Gradle)
./gradlew assembleDebug

# iOS (Xcode)
open ios/SawnTimberMobile.xcworkspace
</code></pre>
      </section>

      <section class="card" id="penggunaan">
        <h2>Contoh Penggunaan</h2>
        <p style="color:var(--muted)">Hitung volume kayu dengan input panjang, lebar, dan tebal:</p>
        <pre><code>// Kotlin (Android)
val volume = panjang * lebar * tebal
println("Volume kayu: $volume m³")</code></pre>
      </section>
    </div>

    <section class="card" id="demo">
      <h2>Demo / Screenshot</h2>
      <p style="color:var(--muted)">Tampilan antarmuka aplikasi:</p>
      <img class="screenshot" src="https://via.placeholder.com/800x360.png?text=Sawn+Timber+Mobile+Screenshot" alt="screenshot">
    </section>

    <section class="card" id="teknologi">
      <h2>Teknologi</h2>
      <ul>
        <li>📱 Kotlin + Jetpack Compose (Android)</li>
        <li>🍏 SwiftUI (iOS)</li>
        <li>🗄️ Room Database / Core Data</li>
        <li>☁️ API REST untuk sinkronisasi</li>
      </ul>
    </section>

    <section class="card" id="kontribusi">
      <h2>Kontribusi</h2>
      <p style="color:var(--muted)">Kontribusi terbuka untuk siapa saja:</p>
      <ul>
        <li>Fork repositori</li>
        <li>Buat branch fitur: <code>git checkout -b fitur-baru</code></li>
        <li>Commit perubahan: <code>git commit -m "Tambah fitur kalkulasi X"</code></li>
        <li>Push & ajukan Pull Request</li>
      </ul>
    </section>

    <section class="card" id="lisensi">
      <h2>Lisensi</h2>
      <p style="color:var(--muted)">Proyek ini dilisensikan di bawah <strong>MIT License</strong> — lihat file <code>LICENSE</code> untuk detail.</p>
    </section>

    <footer class="footer">
      <div>
        <strong>Author</strong>: Ary Sugiarto — <a href="mailto:email@contoh.com">email@contoh.com</a>
      </div>
      <div style="text-align:right;">
        <span style="display:block;color:var(--muted)">GitHub: <a href="https://github.com/username">github.com/username</a></span>
        <span style="display:block;color:var(--muted);margin-top:6px;">Terakhir diupdate: <time datetime="2025-09-18">18 Sep 2025</time></span>
      </div>
    </footer>
  </div>
</body>
</html>
