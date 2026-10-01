const fs = require('fs');
const path = require('path');
const PDFDocument = require('pdfkit');

function formatarCadernoCravou({
  disciplina,
  subtitulo,
  banca,
  concurso,
  topicos,
  questoes,
  arquivoSaida
}) {
  return new Promise((resolve, reject) => {
    const doc = new PDFDocument({
      size: 'A4',
      margins: { top: 40, bottom: 40, left: 45, right: 45 },
      bufferPages: true,
      info: {
        Title: `${disciplina} - Caderno Oficial CRAVOU`,
        Author: 'Equipe Pedagógica CRAVOU Concursos',
        Subject: `Material Didático Preparatório ${concurso}`,
        Keywords: 'CRAVOU, Concursos Públicos, PM-PE, Instituto AOCP'
      }
    });

    const stream = fs.createWriteStream(arquivoSaida);
    doc.pipe(stream);

    // ==========================================
    // CAPA / HEADER TÁTICO CRAVOU
    // ==========================================
    // Barra Superior Azul Marinho (#0A192F)
    doc.rect(0, 0, 595.28, 90).fill('#0A192F');

    // Logo / Emblema CRAVOU
    doc.fillColor('#FFFFFF').fontSize(22).font('Helvetica-Bold')
       .text('CRAVOU', 45, 22, { characterSpacing: 2 });
    doc.fillColor('#F97316').fontSize(10).font('Helvetica-Bold')
       .text('MÉTODO TÁTICO DE ALTA PERFORMANCE', 45, 48, { characterSpacing: 1 });
    doc.fillColor('#94A3B8').fontSize(9).font('Helvetica')
       .text('DIREÇÃO PEDAGÓGICA • EDITAL Esquematizado', 45, 62);

    // Badge do Concurso à Direita
    doc.rect(400, 22, 150, 46).fill('#1E293B');
    doc.rect(400, 22, 150, 46).strokeColor('#F97316').lineWidth(1.2).stroke();
    doc.fillColor('#38BDF8').fontSize(9).font('Helvetica-Bold')
       .text(concurso.toUpperCase(), 405, 30, { width: 140, align: 'center' });
    doc.fillColor('#F1F5F9').fontSize(8).font('Helvetica')
       .text(`Banca: ${banca}`, 405, 46, { width: 140, align: 'center' });

    doc.y = 110;

    // Título Principal da Disciplina
    doc.fillColor('#0F172A').fontSize(18).font('Helvetica-Bold')
       .text(disciplina, 45, 110);
    doc.fillColor('#64748B').fontSize(11).font('Helvetica')
       .text(subtitulo, 45, 134);

    doc.moveTo(45, 152).lineTo(550, 152).strokeColor('#E2E8F0').lineWidth(1).stroke();
    doc.y = 165;

    // ==========================================
    // CONTEÚDO TEÓRICO DIDÁTICO
    // ==========================================
    topicos.forEach((topico, idx) => {
      // Verifica quebra de página
      if (doc.y > 680) {
        doc.addPage();
        doc.y = 45;
      }

      // Caixa de Título de Seção
      doc.rect(45, doc.y, 505, 24).fill('#F8FAFC');
      doc.rect(45, doc.y, 4, 24).fill('#F97316');
      doc.fillColor('#0F172A').fontSize(12).font('Helvetica-Bold')
         .text(`${idx + 1}. ${topico.titulo}`, 56, doc.y + 6);
      doc.y += 14;

      // Resumo em Pontos Táticos
      topico.itens.forEach(item => {
        if (doc.y > 700) {
          doc.addPage();
          doc.y = 45;
        }

        if (item.tipo === 'destaque') {
          doc.rect(50, doc.y + 3, 500, 28).fill('#FFF7ED');
          doc.rect(50, doc.y + 3, 3, 28).fill('#EA580C');
          doc.fillColor('#9A3412').fontSize(9).font('Helvetica-Bold')
             .text(`⚡ REGRA DE OURO CRAVOU: ${item.texto}`, 60, doc.y + 8, { width: 480 });
          doc.y += 18;
        } else if (item.tipo === 'mnemonico') {
          doc.rect(50, doc.y + 3, 500, 26).fill('#EFF6FF');
          doc.rect(50, doc.y + 3, 3, 26).fill('#2563EB');
          doc.fillColor('#1E40AF').fontSize(9).font('Helvetica-Bold')
             .text(`🧠 MNEMÔNICO TÁTICO: ${item.texto}`, 60, doc.y + 8, { width: 480 });
          doc.y += 16;
        } else {
          doc.fillColor('#334155').fontSize(9.5).font('Helvetica')
             .text(`• ${item.texto}`, 55, doc.y + 4, { width: 490, lineGap: 2 });
          doc.y += 4;
        }
      });

      doc.y += 10;
    });

    // ==========================================
    // BATERIA DE QUESTÕES COMENTADAS
    // ==========================================
    if (questoes && questoes.length > 0) {
      doc.addPage();
      doc.y = 45;

      doc.rect(45, doc.y, 505, 30).fill('#0F172A');
      doc.fillColor('#FFFFFF').fontSize(13).font('Helvetica-Bold')
         .text('🎯 BATERIA DE QUESTÕES GABARITADAS & COMENTADAS (PADRÃO AOCP)', 55, doc.y + 8);
      doc.y += 24;

      questoes.forEach((q, qIdx) => {
        if (doc.y > 640) {
          doc.addPage();
          doc.y = 45;
        }

        doc.fillColor('#0F172A').fontSize(10.5).font('Helvetica-Bold')
           .text(`Questão ${qIdx + 1} • ${q.banca} (${q.orgao}) - ${q.assunto}`, 45, doc.y + 8);
        doc.fillColor('#475569').fontSize(9.5).font('Helvetica')
           .text(q.enunciado, 45, doc.y + 4, { width: 505, lineGap: 2 });
        doc.y += 4;

        if (q.alternativas) {
          Object.entries(q.alternativas).forEach(([letra, alt]) => {
            doc.fillColor('#334155').fontSize(9).font('Helvetica')
               .text(`(${letra}) ${alt}`, 55, doc.y + 2, { width: 490 });
          });
        }

        // Comentário Didático CRAVOU
        doc.rect(45, doc.y + 6, 505, 34).fill('#F0FDF4');
        doc.rect(45, doc.y + 6, 3, 34).fill('#16A34A');
        doc.fillColor('#166534').fontSize(9).font('Helvetica-Bold')
           .text(`GABARITO: ${q.gabarito} • COMENTÁRIO CRAVOU:`, 55, doc.y + 11);
        doc.fillColor('#14532D').fontSize(8.5).font('Helvetica')
           .text(q.comentario, 55, doc.y + 4, { width: 485 });
        doc.y += 20;
      });
    }

    // Rodapé em todas as páginas
    const totalPages = doc.bufferedPageRange().count;
    for (let i = 0; i < totalPages; i++) {
      doc.switchToPage(i);
      doc.rect(45, 805, 505, 0.8).fill('#CBD5E1');
      doc.fillColor('#94A3B8').fontSize(8).font('Helvetica')
         .text('CRAVOU CONCURSOS • Material Autoral e Exclusivo • Proibida reprodução não autorizada.', 45, 812);
      doc.fillColor('#94A3B8').fontSize(8).font('Helvetica')
         .text(`Página ${i + 1} de ${totalPages}`, 480, 812, { width: 70, align: 'right' });
    }

    doc.end();
    stream.on('finish', () => resolve(arquivoSaida));
    stream.on('error', reject);
  });
}

module.exports = { formatarCadernoCravou };
