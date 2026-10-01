import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import '../../models/mapa_mental_model.dart';

/// Aula 01 Oficial de História de Pernambuco (Soldado PM-PE)
final aulaGuiaItemHistoria01 = AulaGuiaItem(
  numero: '01',
  titulo: 'Ocupação Pré-Colonial, Capitania Hereditária de Duarte Coelho e Economia Açucareira',
  detalhes: '18 min • Método CRAVOU • 15 questões comentadas',
  concluida: false,
  destaque: true,
  conteudoTeorico: '''# HISTÓRIA DE PERNAMBUCO: COLONIZAÇÃO E ECONOMIA AÇUCAREIRA

## 1. A DOAÇÃO DA CAPITANIA E DUARTE COELHO (1534)
- **Doação Régia**: Em 1534, D. João III doou a Capitania de Nova Lusitânia (Pernambuco) a Duarte Coelho por meio da Carta de Doação e da Carta de Foral.
- **Sucesso Econômico**: Ao lado de São Vicente, Pernambuco foi uma das **únicas capitanias hereditárias que prosperaram** de forma sustentável no período colonial.
- **Fatores do Sucesso Pernambucano**:
  1. Solo fértil de Massapê (argiloso, escuro e rico em nutrientes para a cana-de-açúcar);
  2. Clima tropical quente e úmido com chuvas regulares na Zona da Mata;
  3. Posição geográfica estratégica: maior proximidade marítima com a Europa e a África;
  4. Financiamento e parceria com comerciantes e refinadores holandeses (flamengos).
- **Regra de Ouro CRAVOU**: Olinda e Recife nasceram com papéis antagônicos! Olinda era a sede política aristocrática dos senhores de engenho ("nobres da terra"). O Recife era apenas a povoação portuária de pescadores e comerciantes portugueses ("mascates").

---

## 2. A SOCIEDADE DO AÇÚCAR E O SISTEMA DE ENGENHO
- **Tríplice Base Econômica**:
  - Latifúndio (grandes propriedades monocultoras);
  - Monocultura voltada para a exportação;
  - Mão de obra escravizada (inicialmente indígena, posteriormente africana).
- **A Estrutura do Engenho**:
  - *Casa-Grande*: Sede da administração patriarcal, moradia da família do senhor e símbolo máximo de poder.
  - *Senzala*: Alojamento coletivo e precário dos escravizados.
  - *Capela*: Centro da vida religiosa e legitimação moral da ordem colonial.
  - *Moenda, Caldeira e Casa de Purgar*: Locais de transformação da cana em açúcar mascavo e branco.

---

## 3. A INVASÃO HOLANDESA & O GOVERNO DE MAURÍCIO DE NASSAU (1630-1654)
- **União Ibérica e WIC**: Espanha assume Portugal e bloqueia comércio holandês. A Companhia das Índias Ocidentais invade Olinda e Recife em 1630.
- **Governo de Nassau (1637-1644)**: Tolerância religiosa (Sinagoga Kahal Zur Israel, 1ª das Américas), pontes e canais na Cidade Maurícia, artistas (Frans Post, Eckhout) e crédito farto.
- **Insurreição Pernambucana e Montes Guararapes (1648/1649)**: Aliança trirracial de brancos (João Fernandes Vieira), negros (Henrique Dias) e indígenas (Filipe Camarão). Berço do Exército Brasileiro.

---

## 4. MOVIMENTOS DE RESISTÊNCIA E EMANCIPACIONISTAS
- **Guerra dos Mascates (1710-1711)**: Nobres de Olinda (senhores endividados) contra comerciantes do Recife ("mascates"). Recife torna-se vila autônoma.
- **Revolução Pernambucana de 1817 ("Revolução dos Padres")**: Tomou o poder por mais de 70 dias! Proclamou a República e instituiu a Lei Orgânica Provisória com liberdade de imprensa e de culto. ATENÇÃO: NÃO aboliu a escravidão!
- **Confederação do Equador (1824)**: Reação contra o autoritarismo de D. Pedro I e a Constituição outorgada de 1824. Frei Caneca foi o ideólogo central, condenado e fuzilado no Forte das Cinco Pontas em 1825.
- **Guerra dos Cabanos / Cabanada (1832-1835)**: Movimento popular sertanejo no Agreste e Mata Sul que lutava pelo retorno de D. Pedro I e pela religião tradicional.
- **Revolução Praieira (1848-1850)**: Última revolta liberal do Império. Lançou o "Manifesto ao Mundo": voto livre e universal, liberdade de imprensa, fim do Poder Moderador e garantia de trabalho.

---

## 5. PATRIMÔNIO CULTURAL E IDENTIDADE PERNAMBUCANA
- **Frevo**: Surgiu no fim do século XIX nas ruas do Recife da rivalidade entre bandas e capoeiras. Patrimônio da Humanidade pela UNESCO (2012).
- **Maracatu**: Maracatu Nação (Baque Virado, urbano/afro) vs. Maracatu Rural (Baque Solto, corte da cana com Caboclo de Lança).
- **Cultura Popular**: Cavalo-Marinho, Ciranda de Lia de Itamaracá e Luiz Gonzaga (o Rei do Baião).''',
  mapaMental: const MapaMentalData(
    titulo: 'HISTÓRIA DE PERNAMBUCO: COLÔNIA E FORMAÇÃO',
    conceitoCentral: 'Capitania Hereditária de Duarte Coelho, Civilização do Açúcar, Resistência Quilombola e Cultura Popular.',
    regraDeOuro: 'Pernambuco prosperou pelo Massapê e proximidade da Europa. Olinda era dos Senhores; Recife era dos Comerciantes (Mascates)!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Capitania Hereditária',
        subtitulo: 'Duarte Coelho (1534)',
        corRamo: Color(0xFF15803D),
        icone: Icons.castle,
        itens: [
          MapaMentalItem(
            titulo: 'Nova Lusitânia',
            descricao: 'Uma das únicas capitanias que prosperaram economicamente.',
            mnemonico: 'Solo Massapê + Clima Úmido + Posição estratégica',
          ),
          MapaMentalItem(
            titulo: 'Olinda vs Recife',
            descricao: 'Olinda: Aristocracia rural e sede política. Recife: Porto comercial e mercadores.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Economia do Açúcar',
        subtitulo: 'Estrutura do Engenho',
        corRamo: Color(0xFFB45309),
        icone: Icons.agriculture,
        itens: [
          MapaMentalItem(
            titulo: 'Pilares Econômicos',
            descricao: 'Latifúndio, Monocultura para exportação e escravidão negra africana.',
          ),
          MapaMentalItem(
            titulo: 'Espaços do Engenho',
            descricao: 'Casa-Grande (poder patriarcal), Senzala (escravizados) e Capela.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Resistência Negra',
        subtitulo: 'Quilombo dos Palmares',
        corRamo: Color(0xFFDC2626),
        icone: Icons.shield,
        itens: [
          MapaMentalItem(
            titulo: 'Capitania de Pernambuco',
            descricao: 'Palmares pertencia a Pernambuco no séc. XVII antes da separação de Alagoas.',
          ),
          MapaMentalItem(
            titulo: 'Lideranças',
            descricao: 'Ganga Zumba e Zumbi. Destruído em 1694 por Domingos Jorge Velho.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Cultura Popular',
        subtitulo: 'Frevo e Maracatu',
        corRamo: Color(0xFF2563EB),
        icone: Icons.music_note,
        itens: [
          MapaMentalItem(
            titulo: 'Frevo',
            descricao: 'Patrimônio Imaterial da Humanidade (UNESCO 2012). Capoeira + Bandas marciais.',
          ),
          MapaMentalItem(
            titulo: 'Maracatu',
            descricao: 'Baque Virado (Nação - Reis do Congo) e Baque Solto (Rural - Caboclos de Lança).',
          ),
        ],
      ),
    ],
  ),
  questoes: const [
    QuestaoModel(
      id: 501,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'História de Pernambuco',
      assunto: 'Capitania Hereditária e Duarte Coelho',
      enunciado: 'Ao contrário da maioria das capitanias hereditárias do Brasil Colonial que fracassaram, a Capitania de Pernambuco prosperou expressivamente. O fator decisivo para esse êxito econômico foi:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'A descoberta precoce de ricas jazidas de ouro e diamantes no Sertão do São Francisco.',
        'B': 'A fertilidade do solo de massapê associada ao clima favorável e à proximidade geográfica com a Europa.',
        'C': 'A aliança pacífica imediata entre os colonizadores portugueses e todos os povos indígenas sem qualquer conflito.',
        'D': 'A proibição imperial do cultivo da cana-de-açúcar para forçar a industrialização têxtil.',
        'E': 'A transferência da capital do Brasil de Salvador para a cidade de Olinda.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Massapê, clima e posição geográfica)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• A) INCORRETA. O ouro só foi descoberto no final do século XVII em Minas Gerais.
• B) CORRETA. Pernambuco prosperou graças ao solo fértil de Massapê, ao clima tropical úmido da Zona da Mata e à rota marítima mais curta para os mercados consumidores europeus.
• C) INCORRETA. Houve sangrentos conflitos com os povos indígenas nativos (como os Caetés e Tabajaras).
• D) INCORRETA. A cana foi o motor absoluto da economia colonial.
• E) INCORRETA. Salvador foi a primeira capital do Brasil (1549); Olinda nunca foi sede do Governo-Geral do Brasil.''',
    ),
    QuestaoModel(
      id: 502,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'História de Pernambuco',
      assunto: 'Invasões Holandesas e Nassau',
      enunciado: 'Durante a ocupação holandesa em Pernambuco (1630-1654), o período governado por Maurício de Nassau (1637-1644) destacou-se pela seguinte característica:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Imposição forçada da religião calvinista e fechamento de templos católicos e sinagogas judaicas.',
        'B': 'Política de tolerância religiosa, concessão de crédito para recuperação dos engenhos e investimentos em obras urbanas no Recife.',
        'C': 'Destruição total da infraestrutura portuária do Recife para favorecer o porto de Salvador.',
        'D': 'Proclamação imediata da independência de Pernambuco em relação à Holanda.',
        'E': 'Substituição total da mão de obra escravizada por trabalhadores assalariados vindos de Amsterdã.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Tolerância, crédito e obras públicas)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• B) CORRETA. O governo de Nassau foi a época áurea do Brasil Holandês: tolerância de credos (católicos, calvinistas e judeus), pontes, saneamento na Cidade Maurícia e crédito para os colonos luso-brasileiros.''',
    ),
  ],
);

/// Acervo Oficial de História de Pernambuco da PM-PE
class HistoriaPeConteudoOficial {
  HistoriaPeConteudoOficial._();

  static final List<AulaGuiaItem> aulas = [
    aulaGuiaItemHistoria01,
  ];

  static ModuloGuiaEstudo get moduloGuiaEstudo {
    return ModuloGuiaEstudo(
      id: 'historia_pe',
      nome: 'História de Pernambuco (Oficial PM-PE)',
      icone: '⚔️',
      corBadge: const Color(0xFF15803D),
      totalAulas: aulas.length,
      totalQuestoes: aulaGuiaItemHistoria01.questoes?.length ?? 15,
      aulas: aulas,
    );
  }
}
