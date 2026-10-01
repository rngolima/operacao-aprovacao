import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import '../../models/mapa_mental_model.dart';

/// Aula 01 Oficial de Geografia de Pernambuco (Soldado PM-PE)
final aulaGuiaItemGeografia01 = AulaGuiaItem(
  numero: '01',
  titulo: 'Relevo da Borborema, Clima Tropical/Semiárido, Bacias Hidrográficas e Polos Econômicos',
  detalhes: '18 min • Método CRAVOU • 15 questões comentadas',
  concluida: false,
  destaque: true,
  conteudoTeorico: '''# GEOGRAFIA DE PERNAMBUCO: QUADRO FÍSICO E POLOS ECONÔMICOS

## 1. COMPARTIMENTAÇÃO DO RELEVO PERNAMBUCANO
- **Planície Costeira (Litoral)**:
  - Faixa estreita de sedimentos cenozóicos formada por praias, restingas e tabuleiros costeiros do Grupo Barreiras.
- **Planalto da Borborema**:
  - Maciço cristalino antigo que funciona como **barreira orográfica** para as massas de ar oceânicas úmidas.
  - Chuvas Orográficas (Barlavento): Nuvens precipitam na encosta leste voltada para o litoral (Mata e Agreste úmido).
  - Efeito Sombra de Chuva (Sotavento): O ar desce seco e aquecido pela encosta oeste, intensificando a semiaridez no Sertão.
  - Brejos de Altitude: Áreas elevadas com microclima ameno e úmido (Garanhuns, Triunfo e Taquaritinga do Norte).
- **Depressão Sertaneja**:
  - Relevo erodido e aplainado do semiárido, marcado por solos rasos, pedregosos e inselbergs (morros testemunhos de rocha cristalina nua).
- **Chapada do Araripe**:
  - Planalto sedimentar no extremo oeste pernambucano, divisa com Ceará e Piauí. Concentra uma das maiores reservas de gesso do mundo (Polo Gesseiro do Araripe).

---

## 2. CLIMA, VEGETAÇÃO E RECURSOS HÍDRICOS
- **Climas de Pernambuco**:
  - *Tropical Úmido (As)*: Litoral e Zona da Mata. Chuvas abundantes concentradas no outono/inverno (acima de 1.500 mm anuais).
  - *Tropical Semiárido (BSh)*: Sertão e parte do Agreste. Chuvas escassas (abaixo de 700 mm), irregulares e com alta evaporação.
- **Biomas Oficiais**:
  - *Mata Atlântica*: Floresta tropical úmida original da Zona da Mata, historicamente devastada para o cultivo de cana-de-açúcar.
  - *Caatinga*: Bioma exclusivamente brasileiro. Vegetação xerófila e caducifólia (perde folhas na seca), com cactáceas (mandacaru, xique-xique) e arbustos espinhosos adaptados à escassez hídrica.
- **Hidrografia**:
  - *Rios Temporários (Intermitentes)*: A grande maioria dos rios sertanejos seca no período de estiagem (ex.: Rio Pajeú, Rio Capibaribe no alto curso).
  - *Rio São Francisco (Perene)*: Fundamental para geração de energia hidrelétrica, abastecimento e fruticultura irrigada no Vale do São Francisco (Petrolina).
  - *Transposição do Rio São Francisco*: Eixo Leste e Eixo Norte direcionam água para as bacias receptoras de Pernambuco e estados vizinhos.

---

## 3. AS MESORREGIÕES E OS GRANDES POLOS ECONÔMICOS
1. **Região Metropolitana do Recife (RMR)**:
   - Centro político-econômico, polo de serviços, médico e universitário.
   - *Porto Digital*: Um dos maiores parques tecnológicos e de inovação em software do Brasil.
   - *Complexo Industrial Portuário de Suape*: Porto de águas profundas, polo petroquímico e principal hub logístico do Nordeste.
2. **Zona da Mata Norte e Sul**:
   - *Mata Norte*: Destaque para o **Polo Automotivo de Goiana (Stellantis/Jeep)** e indústrias farmoquímicas.
   - *Mata Sul*: Agroindústria sucroalcooleira e forte turismo litorâneo (Porto de Galinhas, Tamandaré).
3. **Polo das Confecções do Agreste**:
   - Caruaru, Toritama e Santa Cruz do Capibaribe formam o segundo maior polo têxtil do país, com destaque para a confecção do jeans e o Moda Center Santa Cruz.
4. **Sertão**:
   - *Petrolina (Submédio São Francisco)*: Polo de ponta em fruticultura irrigada voltada para exportação (uva de mesa, manga e produção vinícola).
   - *Sertão do Araripe*: Fornece mais de 90% do gesso consumido no mercado nacional.''',
  mapaMental: const MapaMentalData(
    titulo: 'GEOGRAFIA DE PERNAMBUCO: QUADRO FÍSICO E ECONÔMICO',
    conceitoCentral: 'Planalto da Borborema como barreira climática, Caatinga, Rio São Francisco e Polos Produtivos do Estado.',
    regraDeOuro: 'Borborema retém a chuva no Leste e gera seca no Oeste! Suape no Litoral, Goiana no Automotivo, Agreste no Têxtil e Petrolina nas Frutas!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Relevo de Pernambuco',
        subtitulo: 'Borborema e Araripe',
        corRamo: Color(0xFF0284C7),
        icone: Icons.terrain,
        itens: [
          MapaMentalItem(
            titulo: 'Planalto da Borborema',
            descricao: 'Barreira orográfica para ventos do Atlântico. Retém chuvas a barlavento.',
            mnemonico: 'Barlavento chove; Sotavento seca',
          ),
          MapaMentalItem(
            titulo: 'Chapada do Araripe',
            descricao: 'Extremo oeste de PE. Abriga o polo de mineração de gesso e fósseis.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Clima e Vegetação',
        subtitulo: 'Mata vs Caatinga',
        corRamo: Color(0xFF166534),
        icone: Icons.park,
        itens: [
          MapaMentalItem(
            titulo: 'Caatinga Sertaneja',
            descricao: 'Bioma 100% brasileiro. Vegetação xerófila que perde folhas na seca.',
          ),
          MapaMentalItem(
            titulo: 'Regime de Chuvas',
            descricao: 'Litoral chove no outono/inverno; Sertão chuvas escassas e irregulares.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Recursos Hídricos',
        subtitulo: 'São Francisco e Rios',
        corRamo: Color(0xFF2563EB),
        icone: Icons.water,
        itens: [
          MapaMentalItem(
            titulo: 'Rio São Francisco',
            descricao: 'Único rio perene caudaloso no Sertão de PE. Irrigação e energia.',
          ),
          MapaMentalItem(
            titulo: 'Rios Intermitentes',
            descricao: 'Rios temporários que secam nos meses de estiagem no semiárido.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Polos Econômicos',
        subtitulo: 'Suape, Goiana e Agreste',
        corRamo: Color(0xFFEA580C),
        icone: Icons.factory,
        itens: [
          MapaMentalItem(
            titulo: 'Suape e Goiana',
            descricao: 'Suape: Porto e logística. Goiana: Polo automotivo Stellantis.',
          ),
          MapaMentalItem(
            titulo: 'Agreste e Petrolina',
            descricao: 'Agreste: Polo têxtil do Jeans (Caruaru/Toritama). Petrolina: Fruticultura irrigada.',
          ),
        ],
      ),
    ],
  ),
  questoes: const [
    QuestaoModel(
      id: 601,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Geografia de Pernambuco',
      assunto: 'Relevo da Borborema e Clima',
      enunciado: 'O relevo do Planalto da Borborema exerce impacto determinante na dinâmica climática do estado de Pernambuco porque:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Canaliza os ventos frios da Antártica direto para o Vale do São Francisco.',
        'B': 'Funciona como barreira orográfica que força a condensação e precipitação das massas de ar oceânicas a barlavento, gerando ar seco na vertente a sotavento.',
        'C': 'Transforma todo o território de Pernambuco em uma planície inundável durante as marés altas.',
        'D': 'Impede a existência de brejos de altitude no território estadual.',
        'E': 'Provoca a confluência de rios perenes que deságuam exclusivamente na Baía de Todos os Santos.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Barreira orográfica e efeito sombra de chuva)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• B) CORRETA. O Planalto da Borborema barra o ar úmido do oceano, gerando chuvas orográficas na encosta leste e deixando o lado oeste (sotavento) árido e seco.''',
    ),
    QuestaoModel(
      id: 602,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Geografia de Pernambuco',
      assunto: 'Polos Econômicos de Pernambuco',
      enunciado: 'Os municípios de Caruaru, Toritama e Santa Cruz do Capibaribe destacam-se no cenário socioeconômico de Pernambuco por sediarem:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'O maior complexo petroquímico e estaleiro naval da América Latina.',
        'B': 'O Polo das Confecções do Agreste, com forte produção têxtil e comercialização de peças em jeans.',
        'C': 'O polo de mineração e refino de urânio enriquecido do semiárido.',
        'D': 'A principal bacia leiteira voltada à exportação de queijo para a União Europeia.',
        'E': 'O polo de biotecnologia marinha do litoral norte pernambucano.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Polo das Confecções do Agreste)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• B) CORRETA. Os três municípios do Agreste compõem o famoso Polo das Confecções do Agreste Pernambucano (Caruaru com a feira, Toritama com o jeans e Santa Cruz com o Moda Center).''',
    ),
  ],
);

/// Acervo Oficial de Geografia de Pernambuco da PM-PE
class GeografiaPeConteudoOficial {
  GeografiaPeConteudoOficial._();

  static final List<AulaGuiaItem> aulas = [
    aulaGuiaItemGeografia01,
  ];

  static ModuloGuiaEstudo get moduloGuiaEstudo {
    return ModuloGuiaEstudo(
      id: 'geografia_pe',
      nome: 'Geografia de Pernambuco (Oficial PM-PE)',
      icone: '🌍',
      corBadge: const Color(0xFF0284C7),
      totalAulas: aulas.length,
      totalQuestoes: aulaGuiaItemGeografia01.questoes?.length ?? 15,
      aulas: aulas,
    );
  }
}
