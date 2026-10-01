const fs = require('fs');
const path = require('path');
const puppeteer = require('puppeteer');

async function gerarCadernoCanvaRLM() {
  const logoPath = 'C:/Users/Rlima/OneDrive/Documentos/Projeto Aprovacao Concurso/operacao-aprovacao/frontend/assets/images/cravou_logo.jpg';
  const logoBase64 = fs.readFileSync(logoPath).toString('base64');
  const logoDataUri = `data:image/jpeg;base64,${logoBase64}`;

  const txtPath = 'C:/Users/Rlima/OneDrive/Documentos/Projeto Aprovacao Concurso/operacao-aprovacao/materiais/pm_pe/Cadernos_Oficiais_CRAVOU/rlm_texto_limpo.txt';
  const textRaw = fs.readFileSync(txtPath, 'utf-8');

  // Quebra em linhas e formata em HTML elegante estilo Canva
  const lines = textRaw.split('\n');
  let htmlContent = '';
  let inGabarito = false;

  for (let i = 0; i < lines.length; i++) {
    let line = lines[i].trim();
    if (!line) continue;

    // Filtra cabeçalhos repetidos de página do PDF antigo
    if (line === 'CRAVOU' || line === 'Sumário' || line.match(/^Psicotécnico.*?\d+$/) || line.match(/^Proposições.*?\d+$/) || line.match(/^Argumento.*?\d+$/) || line.match(/^Análise Combinatória.*?\d+$/) || line.match(/^Probabilidade.*?\d+$/)) {
      continue;
    }

    // Títulos de Seção / Módulo
    if (line.includes('Caderno Tático Oficial • CRAVOU') || line.startsWith('RACIOCÍNIO LÓGICO-MATEMÁTICO') || line.startsWith('Psicotécnico -') || line.startsWith('Proposições -') || line.startsWith('Argumento -') || line.startsWith('Análise Combinatória -') || line.startsWith('Probabilidade -')) {
      if (line.includes('Caderno Tático')) {
        htmlContent += `<div class="section-break"></div>`;
        continue;
      }
      htmlContent += `
        <div class="topic-header">
          <div class="topic-badge">MÓDULO TÁTICO</div>
          <h2>${escapeHtml(line)}</h2>
        </div>
      `;
      inGabarito = false;
      continue;
    }

    // Identificação de banca / ano de questão: ex "(FGV - 2022 - SEFAZ-BA...)"
    if (line.startsWith('(') && line.includes('- 202')) {
      htmlContent += `<div class="banca-tag">${escapeHtml(line)}</div>`;
      continue;
    }

    // Seção de Gabarito
    if (line.startsWith('Gabarito')) {
      inGabarito = true;
      htmlContent += `
        <div class="gabarito-box">
          <div class="gabarito-title">🎯 GABARITO OFICIAL CRAVOU</div>
          <div class="gabarito-content">
      `;
      continue;
    }

    if (inGabarito) {
      if (line.match(/^\d+[\.\s]/)) {
        htmlContent += `<span class="gabarito-item">${escapeHtml(line)}</span> `;
      } else {
        htmlContent += `</div></div>`;
        inGabarito = false;
      }
    }

    // Alternativas a), b), c), d), e)
    if (line.match(/^[a-e]\)/i)) {
      htmlContent += `<div class="option-line"><span class="opt-letter">${escapeHtml(line.substring(0, 2))}</span> ${escapeHtml(line.substring(2))}</div>`;
      continue;
    }

    // Itens numerados / tópicos
    if (line.match(/^\d+[\.\s]/)) {
      htmlContent += `<div class="question-number">${escapeHtml(line)}</div>`;
      continue;
    }

    if (line.startsWith('•')) {
      htmlContent += `<div class="bullet-item">${escapeHtml(line)}</div>`;
      continue;
    }

    // Texto corrido
    htmlContent += `<p class="prose">${escapeHtml(line)}</p>`;
  }

  if (inGabarito) {
    htmlContent += `</div></div>`;
  }

  // Template HTML Completo estilo Canva com Marca d'Água Centralizada
  const fullHtml = `
  <!DOCTYPE html>
  <html lang="pt-BR">
  <head>
    <meta charset="UTF-8">
    <title>CRAVOU - Raciocínio Lógico-Matemático</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=JetBrains+Mono:wght@500;700&display=swap" rel="stylesheet">
    <style>
      @page {
        size: A4;
        margin: 22mm 16mm 20mm 16mm;
        @bottom-right {
          content: counter(page);
        }
      }

      * {
        box-sizing: border-box;
      }

      body {
        margin: 0;
        padding: 0;
        font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        color: #1E293B;
        background-color: #FFFFFF;
        font-size: 10.5pt;
        line-height: 1.6;
        position: relative;
      }

      /* ========================================================
         MARCA D'ÁGUA CENTRALIZADA ESTILO CANVA (CORUJA CRAVOU)
         ======================================================== */
      .watermark-container {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 480px;
        height: 480px;
        opacity: 0.055; /* Perfeita suavidade de leitura */
        pointer-events: none;
        z-index: 0;
        background-image: url('${logoDataUri}');
        background-repeat: no-repeat;
        background-position: center;
        background-size: contain;
      }

      .content-wrapper {
        position: relative;
        z-index: 1;
      }

      /* ========================================================
         CAPA TÁTICA PREMIUM ESTILO CANVA EDITORIAL
         ======================================================== */
      .cover-page {
        page-break-after: always;
        height: 98vh;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        padding: 40px 30px;
        background: linear-gradient(145deg, #0A192F 0%, #0F2342 60%, #162C4E 100%);
        border-radius: 16px;
        color: #FFFFFF;
        position: relative;
        overflow: hidden;
        border: 2px solid #F97316;
      }

      .cover-cover-glow {
        position: absolute;
        top: -100px;
        right: -100px;
        width: 380px;
        height: 380px;
        background: radial-gradient(circle, rgba(249, 115, 22, 0.25) 0%, rgba(249, 115, 22, 0) 70%);
        pointer-events: none;
      }

      .cover-header {
        display: flex;
        align-items: center;
        gap: 18px;
      }

      .cover-logo {
        width: 75px;
        height: 75px;
        border-radius: 16px;
        border: 2px solid #F97316;
        box-shadow: 0 8px 24px rgba(249, 115, 22, 0.3);
      }

      .cover-header-text h1 {
        margin: 0;
        font-size: 26pt;
        font-weight: 800;
        letter-spacing: 2px;
        color: #FFFFFF;
      }

      .cover-header-text p {
        margin: 4px 0 0 0;
        font-size: 10.5pt;
        font-weight: 700;
        color: #F97316;
        letter-spacing: 1px;
      }

      .cover-main-badge {
        display: inline-block;
        padding: 6px 14px;
        background: rgba(249, 115, 22, 0.15);
        border: 1px solid #F97316;
        border-radius: 6px;
        color: #FB923C;
        font-size: 9pt;
        font-weight: 800;
        letter-spacing: 1px;
        margin-bottom: 16px;
      }

      .cover-body {
        margin: auto 0;
      }

      .cover-body h2 {
        font-size: 30pt;
        font-weight: 800;
        line-height: 1.2;
        margin: 0 0 16px 0;
        background: linear-gradient(90deg, #FFFFFF 0%, #E2E8F0 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
      }

      .cover-body p {
        font-size: 13pt;
        color: #94A3B8;
        max-width: 540px;
        margin: 0 0 28px 0;
        line-height: 1.5;
      }

      .cover-pills {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
      }

      .cover-pill {
        background: rgba(255, 255, 255, 0.08);
        border: 1px solid rgba(255, 255, 255, 0.15);
        padding: 8px 14px;
        border-radius: 8px;
        font-size: 9pt;
        font-weight: 600;
        color: #E2E8F0;
      }

      .cover-footer {
        border-top: 1px solid rgba(255, 255, 255, 0.12);
        padding-top: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 8.5pt;
        color: #94A3B8;
      }

      .cover-footer-author {
        font-weight: 700;
        color: #F8FAFC;
        font-size: 10pt;
      }

      /* ========================================================
         CABEÇALHO REPETIDO DAS PÁGINAS DE CONTEÚDO
         ======================================================== */
      .page-header-bar {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding-bottom: 12px;
        border-bottom: 1.5px solid #E2E8F0;
        margin-bottom: 22px;
      }

      .header-brand {
        display: flex;
        align-items: center;
        gap: 10px;
      }

      .header-brand-img {
        width: 32px;
        height: 32px;
        border-radius: 6px;
      }

      .header-brand-title {
        font-size: 11pt;
        font-weight: 800;
        color: #0A192F;
        letter-spacing: 0.5px;
      }

      .header-brand-sub {
        font-size: 7.5pt;
        color: #EA580C;
        font-weight: 700;
      }

      .header-meta {
        text-align: right;
        font-size: 7.5pt;
        color: #64748B;
        font-weight: 600;
      }

      /* ========================================================
         ELEMENTOS DE CONTEÚDO EDITORIAL CANVA
         ======================================================== */
      .topic-header {
        margin: 28px 0 16px 0;
        padding: 14px 18px;
        background: linear-gradient(90deg, #F8FAFC 0%, #FFFFFF 100%);
        border-left: 5px solid #F97316;
        border-radius: 0 10px 10px 0;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.03);
      }

      .topic-badge {
        font-size: 7.5pt;
        font-weight: 800;
        letter-spacing: 1.5px;
        color: #EA580C;
        text-transform: uppercase;
        margin-bottom: 4px;
      }

      .topic-header h2 {
        margin: 0;
        font-size: 13.5pt;
        font-weight: 800;
        color: #0F172A;
      }

      .banca-tag {
        display: inline-block;
        margin: 16px 0 6px 0;
        padding: 4px 10px;
        background: #EFF6FF;
        border: 1px solid #BFDBFE;
        border-radius: 6px;
        color: #1D4ED8;
        font-size: 8pt;
        font-weight: 700;
      }

      .question-number {
        font-weight: 700;
        color: #0F172A;
        font-size: 10.5pt;
        margin: 10px 0 6px 0;
        line-height: 1.5;
      }

      .option-line {
        padding: 4px 10px;
        margin-left: 12px;
        font-size: 9.5pt;
        color: #334155;
        line-height: 1.45;
      }

      .opt-letter {
        font-weight: 800;
        color: #EA580C;
      }

      .bullet-item {
        margin: 5px 0 5px 14px;
        color: #334155;
        font-size: 9.5pt;
      }

      .prose {
        margin: 6px 0;
        font-size: 9.5pt;
        color: #334155;
        text-align: justify;
      }

      .section-break {
        page-break-before: always;
        margin-top: 10px;
      }

      /* Box de Gabarito Estilizado */
      .gabarito-box {
        margin: 20px 0;
        padding: 16px 20px;
        background: #F0FDF4;
        border: 1.5px solid #86EFAC;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(22, 163, 74, 0.08);
      }

      .gabarito-title {
        font-size: 9.5pt;
        font-weight: 800;
        color: #15803D;
        letter-spacing: 0.5px;
        margin-bottom: 8px;
      }

      .gabarito-content {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
      }

      .gabarito-item {
        background: #DCFCE7;
        border: 1px solid #4ADE80;
        padding: 4px 10px;
        border-radius: 6px;
        font-size: 8.5pt;
        font-weight: 800;
        color: #166534;
        font-family: 'JetBrains Mono', monospace;
      }
    </style>
  </head>
  <body>
    <!-- MARCA D'ÁGUA EM TODAS AS PÁGINAS -->
    <div class="watermark-container"></div>

    <!-- ==============================================
         CAPA DO CADERNO ESTILO CANVA EDITORIAL
         ============================================== -->
    <div class="cover-page">
      <div class="cover-cover-glow"></div>
      <div class="cover-header">
        <img class="cover-logo" src="${logoDataUri}" alt="CRAVOU Logo">
        <div class="cover-header-text">
          <h1>CRAVOU</h1>
          <p>MÉTODO TÁTICO DE ALTA PERFORMANCE</p>
        </div>
      </div>

      <div class="cover-body">
        <div class="cover-main-badge">CADERNO INTEGRAL OFICIAL • 100% EXAUSTIVO</div>
        <h2>RACIOCÍNIO LÓGICO MATEMÁTICO</h2>
        <p>19 Módulos Completos da Teoria às Questões Gabaritadas das Bancas Oficiais (FGV, VUNESP, FCC, CEBRASPE, AOCP).</p>

        <div class="cover-pills">
          <div class="cover-pill">✓ Psicotécnico & Associações</div>
          <div class="cover-pill">✓ Proposições & Conectivos</div>
          <div class="cover-pill">✓ Tabela-Verdade & Equivalências</div>
          <div class="cover-pill">✓ Análise Combinatória</div>
          <div class="cover-pill">✓ Probabilidade & Casos Especiais</div>
        </div>
      </div>

      <div class="cover-footer">
        <div>
          <div class="cover-footer-author">PROFESSOR CRAVOU</div>
          <div>Direção Pedagógica • CRAVOU Concursos</div>
        </div>
        <div style="text-align: right;">
          <div>PM-PE • Soldado da Polícia Militar</div>
          <div>Banca Instituto AOCP • Edital Esquematizado</div>
        </div>
      </div>
    </div>

    <!-- ==============================================
         CONTEÚDO DO CADERNO COM CABEÇALHO PERPÉTUO
         ============================================== -->
    <div class="content-wrapper">
      <div class="page-header-bar">
        <div class="header-brand">
          <img class="header-brand-img" src="${logoDataUri}" alt="Logo">
          <div>
            <div class="header-brand-title">CRAVOU CONCURSOS</div>
            <div class="header-brand-sub">PROFESSOR CRAVOU • MÉTODO TÁTICO</div>
          </div>
        </div>
        <div class="header-meta">
          <div>PM-PE — SOLDADO DA POLÍCIA MILITAR</div>
          <div>RACIOCÍNIO LÓGICO-MATEMÁTICO • AOCP</div>
        </div>
      </div>

      ${htmlContent}
    </div>
  </body>
  </html>
  `;

  // Renderizar via Puppeteer para PDF de Alta Resolução usando o Chrome instalado
  console.log('Iniciando Chrome nativo para renderizar PDF estilo Canva...');
  const browser = await puppeteer.launch({
    executablePath: 'C:/Program Files/Google/Chrome/Application/chrome.exe',
    headless: 'new',
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });

  const page = await browser.newPage();
  await page.setContent(fullHtml, { waitUntil: 'networkidle0' });

  const finalPdfPath = 'C:/Users/Rlima/OneDrive/Documentos/Projeto Aprovacao Concurso/operacao-aprovacao/materiais/pm_pe/Cadernos_Oficiais_CRAVOU/CRAVOU_PMPE_Raciocinio_Logico_CANVA_OFICIAL.pdf';

  await page.pdf({
    path: finalPdfPath,
    format: 'A4',
    printBackground: true,
    margin: {
      top: '18mm',
      bottom: '18mm',
      left: '15mm',
      right: '15mm'
    },
    displayHeaderFooter: true,
    headerTemplate: `<div></div>`,
    footerTemplate: `
      <div style="width: 100%; font-size: 7.5pt; color: #94A3B8; font-family: sans-serif; display: flex; justify-content: space-between; padding: 0 15mm;">
        <span>CRAVOU CONCURSOS • Professor Cravou • Material Didático Oficial • Proibida reprodução não autorizada.</span>
        <span>Página <span class="pageNumber"></span> de <span class="totalPages"></span></span>
      </div>
    `
  });

  await browser.close();
  console.log('✅ PDF Estilo Canva com Marca dÁgua gerado com sucesso em:', finalPdfPath);
}

function escapeHtml(str) {
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}

gerarCadernoCanvaRLM().catch(console.error);
