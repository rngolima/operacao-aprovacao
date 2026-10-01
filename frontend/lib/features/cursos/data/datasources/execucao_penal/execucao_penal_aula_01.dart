import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import '../../models/mapa_mental_model.dart';

/// Aula 01 Oficial de Legislação Especial: Lei de Execução Penal (LEP - Lei 7.210/84)
/// Foco Estratégico: Polícia Penal de Pernambuco (PP-PE) / Carreiras Policiais
final aulaGuiaItemExecucaoPenal01 = AulaGuiaItem(
  numero: '01',
  titulo: 'Lei de Execução Penal: Objetivos, Perfil Genético, Faltas Graves e RDD (Pacote Anticrime)',
  detalhes: '20 min • Método CRAVOU • 15 questões comentadas',
  concluida: false,
  destaque: true,
  conteudoTeorico: '''# LEI DE EXECUÇÃO PENAL (LEI FEDERAL Nº 7.210/1984 - LEP)

## 1. OBJETIVOS E PRINCÍPIOS FUNDAMENTAIS DA EXECUÇÃO PENAL (ART. 1º A 4º)
- **Dupla Finalidade da Execução (Art. 1º)**:
  1. Efetivar as disposições de sentença ou decisão criminal (caráter punitivo e retributivo).
  2. Proporcionar condições para a harmônica integração social do condenado e do internado (caráter ressocializador).
- **Princípio da Legalidade na Execução (Art. 3º)**: Ao condenado e ao internado serão assegurados todos os direitos não atingidos pela sentença ou pela lei.
- **Regra de Ouro CRAVOU**: O preso mantém todos os direitos fundamentais inerentes à pessoa humana, exceto os expressamente restringidos pelo título executivo judicial! É vedada qualquer discriminação de ordem racial, social, religiosa ou política.

---

## 2. INDIVIDUALIZAÇÃO DA PENA E IDENTIFICAÇÃO DO PERFIL GENÉTICO (ART. 5º A 9º-A)
- **Comissão Técnica de Classificação (CTC)**: Órgão responsável pela elaboração do programa individualizador da pena privativa de liberdade adequada ao condenado (composta por diretor, 2 chefes de serviço, 1 psiquiatra, 1 psicólogo e 1 assistente social).
- **Identificação do Perfil Genético (Art. 9º-A)**:
  - Hipóteses Obrigatórias: Condenados por crime doloso praticado com violência grave contra a pessoa ou por qualquer dos crimes hediondos (Lei 8.072/90).
  - Técnica: Extração de DNA por técnica adequada e indolor, por meio de laudo pericial oficial.
- CUIDADO com a pegadinha da banca: A recusa do condenado em submeter-se ao procedimento de identificação do perfil genético constitui falta disciplinar de natureza GRAVE (Art. 9º-A, § 8º).

---

## 3. FALTAS DISCIPLINARES E REGIME DISCIPLINAR DIFERENCIADO (RDD - ART. 52)
- **Classificação das Faltas**: Leves, médias e graves. As leves e médias são definidas pela legislação estadual; as GRAVES são tipificadas exclusivamente pela LEP (rol taxativo no Art. 50 e 52).
- **Hipóteses de Falta Grave em Prova**:
  1. Fuga ou incitação a movimento de subversão da ordem e da disciplina.
  2. Posse, uso ou fornecimento de aparelho telefônico celular, rádio ou similar dentro do presídio.
  3. Recusa à coleta de perfil genético obrigatório.
- **Regime Disciplinar Diferenciado (RDD) com o Pacote Anticrime (Lei 13.964/19)**:
  - Duração Máxima: Até 2 anos (renovável por sucessivos períodos de 1 ano se mantido o risco de liderança criminosa).
  - Cela Individual: Obrigatória.
  - Visitas: Quinzenais, de 2 pessoas por vez, duração de 2 horas, em instalações que impeçam contato físico e passagem de objetos.
  - Banho de Sol: 2 horas diárias em grupos de até 4 presos que não integrem a mesma facção rival.
- Mnemônico Tático R-D-D:
  - **R** - Regime em Cela Individual.
  - **D** - Dois Anos de Duração Máxima.
  - **D** - Duas Horas de Banho de Sol por dia e Visitas Quinzenais de 2 pessoas por 2 horas.

---

## 4. TRABALHO DO PRESO E REMIÇÃO DE PENA (ART. 126 A 130)
- **Natureza do Trabalho**: O trabalho do condenado é dever social e condição de dignidade humana (não está sujeito à CLT).
- **Remição da Pena**:
  - Por Trabalho: 1 dia de pena a cada 3 dias de trabalho efetivo (jornada de 6 a 8 horas diárias).
  - Por Estudo: 1 dia de pena a cada 12 horas de frequência escolar (divididas em no mínimo 3 dias).
- ATENÇÃO à perda dos dias remidos: Em caso de falta grave, o juiz poderá revogar até 1/3 (um terço) do tempo remido, recomeçando a contagem a partir da data da infração disciplinar!''',
  mapaMental: const MapaMentalData(
    titulo: 'LEI DE EXECUÇÃO PENAL (LEP - LEI 7.210/84)',
    conceitoCentral: 'Diretrizes táticas de cumprimento de pena, classificação penitenciária, faltas graves e regime de segurança máxima.',
    regraDeOuro: 'Recusa ao DNA é Falta Grave! RDD dura até 2 anos com cela individual e 2h de banho de sol. Remição: 3 dias de trabalho = 1 dia de pena!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Finalidades e Princípios',
        subtitulo: 'Punição vs Ressocialização',
        corRamo: Color(0xFF1E3A8A),
        icone: Icons.balance,
        itens: [
          MapaMentalItem(
            titulo: 'Duplo Objetivo',
            descricao: 'Efetivar a decisão condenatória e proporcionar a harmônica reintegração social do apenado.',
          ),
          MapaMentalItem(
            titulo: 'Preservação de Direitos',
            descricao: 'Garante ao preso todos os direitos fundamentais não atingidos pela sentença.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Perfil Genético (DNA)',
        subtitulo: 'Art. 9º-A da LEP',
        corRamo: Color(0xFF10B981),
        icone: Icons.biotech,
        itens: [
          MapaMentalItem(
            titulo: 'Crimes Obrigatórios',
            descricao: 'Crime doloso com violência grave ou qualquer crime da Lei dos Crimes Hediondos.',
          ),
          MapaMentalItem(
            titulo: 'Recusa do Condenado',
            descricao: 'A recusa injustificada constitui FALTA GRAVE.',
            mnemonico: 'Recusa ao DNA = Falta Grave imediata',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Regime Diferenciado (RDD)',
        subtitulo: 'Art. 52 (Pacote Anticrime)',
        corRamo: Color(0xFFDC2626),
        icone: Icons.security,
        itens: [
          MapaMentalItem(
            titulo: 'Duração e Cela',
            descricao: 'Até 2 anos em cela individual, renovável se persistir o perigo ou liderança de facção.',
          ),
          MapaMentalItem(
            titulo: 'Visitas e Banho de Sol',
            descricao: '2 horas de banho de sol diário (grupos de 4) e visitas quinzenais de 2 pessoas sem contato físico.',
            mnemonico: '2 anos / 2 pessoas / 2 horas',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Remição da Pena',
        subtitulo: 'Trabalho e Estudo',
        corRamo: Color(0xFFF59E0B),
        icone: Icons.trending_down,
        itens: [
          MapaMentalItem(
            titulo: 'Por Trabalho',
            descricao: '3 dias trabalhados abatem 1 dia de pena.',
            mnemonico: '3 por 1 no Trabalho',
          ),
          MapaMentalItem(
            titulo: 'Por Estudo',
            descricao: '12 horas de estudo em pelo menos 3 dias abatem 1 dia de pena.',
            mnemonico: '12 horas em 3 dias = 1 dia abatido',
          ),
        ],
      ),
    ],
  ),
  questoes: const [
    QuestaoModel(
      id: 401,
      banca: 'Cebraspe',
      orgao: 'Polícia Penal',
      cargo: 'Policial Penal',
      ano: 2024,
      disciplina: 'Legislação Especial',
      assunto: 'Regime Disciplinar Diferenciado',
      enunciado: 'A respeito do Regime Disciplinar Diferenciado (RDD) com as modificações inseridas pelo Pacote Anticrime, assinale a alternativa correta:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'O prazo máximo de permanência no RDD é de 360 dias, vedada qualquer prorrogação.',
        'B': 'O recolhimento do condenado no RDD ocorrerá em cela individual e a duração máxima inicial será de até 2 anos.',
        'C': 'O preso em RDD tem direito a visitas semanais com contato físico liberado para familiares de primeiro grau.',
        'D': 'O banho de sol no RDD tem duração mínima de 4 horas diárias com todo o pavilhão reunido.',
        'E': 'Presos provisórios não podem, em nenhuma hipótese, ser incluídos no RDD.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Até 2 anos em cela individual)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• A) INCORRETA. Com o Pacote Anticrime, o prazo máximo passou a ser de até 2 anos (e não 360 dias), admitindo sucessivas renovações.
• B) CORRETA. O Art. 52, I da LEP estabelece expressamente a duração máxima de até 2 anos em cela individual.
• C) INCORRETA. As visitas são QUINZENAIS (e não semanais) e ocorrem em instalações que impedem qualquer contato físico.
• D) INCORRETA. O banho de sol é de 2 horas diárias (e não 4 horas) em grupos de até 4 presos.
• E) INCORRETA. O RDD pode ser aplicado tanto a presos condenados quanto a presos provisórios.''',
    ),
    QuestaoModel(
      id: 402,
      banca: 'Instituto AOCP',
      orgao: 'Polícia Penal',
      cargo: 'Policial Penal',
      ano: 2024,
      disciplina: 'Legislação Especial',
      assunto: 'Identificação do Perfil Genético',
      enunciado: 'Segundo o Art. 9º-A da Lei de Execução Penal, a identificação do perfil genético mediante extração de DNA é obrigatória para os condenados por crime:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Culposo de trânsito que resulte em lesão corporal grave.',
        'B': 'Doloso praticado com violência grave contra a pessoa ou por qualquer dos crimes hediondos.',
        'C': 'Contra a honra praticado por meio de redes sociais.',
        'D': 'De furto simples praticado em período noturno.',
        'E': 'De estelionato praticado por meio eletrônico.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Violência grave ou Hediondo)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• A, C, D e E) INCORRETAS. Delitos culposos, contra a honra, furto simples e estelionato não autorizam a coleta compulsória de perfil genético.
• B) CORRETA. Art. 9º-A da LEP: A coleta é obrigatória para crimes dolosos com violência grave contra a pessoa ou qualquer crime da Lei dos Crimes Hediondos.''',
    ),
    QuestaoModel(
      id: 403,
      banca: 'Cebraspe',
      orgao: 'Polícia Penal',
      cargo: 'Policial Penal',
      ano: 2023,
      disciplina: 'Legislação Especial',
      assunto: 'Recusa à Coleta de DNA',
      enunciado: 'Caso um condenado por crime hediondo se recuse injustificadamente a fornecer material biológico para a identificação do seu perfil genético, essa recusa configurará:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Mero desvio de conduta sem repercussão disciplinar.',
        'B': 'Falta disciplinar de natureza leve sujeita apenas a advertência verbal.',
        'C': 'Falta disciplinar de natureza média sujeita a isolamento de até 10 dias.',
        'D': 'Falta disciplinar de natureza grave tipificada expressamente na LEP.',
        'E': 'Novo crime de desobediência com pena de detenção.',
      },
      gabaritoOficial: 'D',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: D (Falta Grave)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• D) CORRETA. Art. 9º-A, § 8º da LEP: A recusa do condenado em submeter-se ao procedimento de identificação do perfil genético constitui FALTA DISCIPLINAR DE NATUREZA GRAVE.
• Demais alternativas incorretas pois ignoram a expressa tipificação legal como falta grave.''',
    ),
    QuestaoModel(
      id: 404,
      banca: 'Instituto AOCP',
      orgao: 'Polícia Penal',
      cargo: 'Policial Penal',
      ano: 2024,
      disciplina: 'Legislação Especial',
      assunto: 'Remição de Pena por Trabalho',
      enunciado: 'O condenado que cumpre pena em regime fechado ou semiaberto poderá remir parte do tempo de sua execução. De acordo com a LEP, o cálculo da remição pelo trabalho ocorre na razão de:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': '1 dia de pena a cada 1 dia de trabalho realizado.',
        'B': '1 dia de pena a cada 2 dias de trabalho realizado.',
        'C': '1 dia de pena a cada 3 dias de trabalho realizado.',
        'D': '1 dia de pena a cada 5 dias de trabalho realizado.',
        'E': '1 dia de pena a cada 7 dias de trabalho realizado.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (3 dias de trabalho = 1 dia a menos)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• C) CORRETA. Art. 126, § 1º, II da LEP: 1 dia de pena para cada 3 dias de trabalho.
• Mnemônico CRAVOU: "Trabalho 3 por 1; Estudo 12 horas por 1".''',
    ),
    QuestaoModel(
      id: 405,
      banca: 'Cebraspe',
      orgao: 'Polícia Penal',
      cargo: 'Policial Penal',
      ano: 2023,
      disciplina: 'Legislação Especial',
      assunto: 'Posse de Aparelho Telefônico',
      enunciado: 'Ter em sua posse, utilizar ou fornecer aparelho telefônico, de rádio ou similar, que permita a comunicação com outros presos ou com o ambiente externo, constitui:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Falta disciplinar de natureza leve.',
        'B': 'Falta disciplinar de natureza média.',
        'C': 'Falta disciplinar de natureza grave tipificada no Art. 50, VII da LEP.',
        'D': 'Infração administrativa imputável apenas aos agentes penitenciários.',
        'E': 'Conduta atípica sob o ponto de vista da execução penal.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (Falta Grave - Art. 50, VII)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• C) CORRETA. O Art. 50, VII da LEP tipifica a posse, guarda ou utilização de celular ou rádio transmissor como FALTA GRAVE imperativa.''',
    ),
    QuestaoModel(
      id: 406,
      banca: 'Instituto AOCP',
      orgao: 'Polícia Penal',
      cargo: 'Policial Penal',
      ano: 2024,
      disciplina: 'Legislação Especial',
      assunto: 'Regime Disciplinar Diferenciado e Visitas',
      enunciado: 'Quanto ao regime de visitas do preso recolhido em Regime Disciplinar Diferenciado (RDD), a Lei de Execução Penal estipula que:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Ocorrerão semanalmente, sem limitação de número de visitantes.',
        'B': 'Ocorrerão quinzenalmente, de 2 pessoas por vez, sem contar crianças, com duração de 2 horas.',
        'C': 'Ocorrerão apenas uma vez por mês, com duração máxima de 30 minutos.',
        'D': 'As visitas são terminantemente proibidas durante os primeiros 180 dias de cumprimento de RDD.',
        'E': 'Ocorrerão diariamente, desde que o preso apresente bom comportamento carcerário.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Quinzenais, 2 pessoas, 2 horas)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• B) CORRETA. Art. 52, III da LEP: Visitas quinzenais, de 2 pessoas por vez, a serem realizadas em instalações que impeçam contato físico e passagem de objetos, com duração de 2 horas.''',
    ),
    QuestaoModel(
      id: 407,
      banca: 'Cebraspe',
      orgao: 'Polícia Penal',
      cargo: 'Policial Penal',
      ano: 2024,
      disciplina: 'Legislação Especial',
      assunto: 'Revogação de Dias Remidos',
      enunciado: 'Em caso de cometimento de falta grave pelo apenado, o juiz da execução penal poderá revogar o tempo remido na proporção de até:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': '100% de todos os dias já remidos.',
        'B': 'Metade (1/2) do tempo remido.',
        'C': 'Um terço (1/3) do tempo remido, recomeçando a contagem a partir da data da infração.',
        'D': 'Dois terços (2/3) do tempo remido.',
        'E': 'Nenhum dia remido pode ser revogado por constituir direito adquirido intransponível.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (Até 1/3 do tempo remido)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• C) CORRETA. Art. 127 da LEP: Em caso de falta grave, o juiz poderá revogar até 1/3 do tempo remido, recomeçando a contagem a partir da data da infração disciplinar.''',
    ),
    QuestaoModel(
      id: 408,
      banca: 'Instituto AOCP',
      orgao: 'Polícia Penal',
      cargo: 'Policial Penal',
      ano: 2023,
      disciplina: 'Legislação Especial',
      assunto: 'Objetivos da Execução Penal',
      enunciado: 'O Art. 1º da Lei nº 7.210/1984 estabelece que a execução penal tem por objetivo efetivar as disposições de sentença ou decisão criminal e:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Garantir o isolamento perpétuo dos apenados perigosos.',
        'B': 'Proporcionar condições para a harmônica integração social do condenado e do internado.',
        'C': 'Impor trabalho forçado aos apenados reincidentes.',
        'D': 'Extinguir os direitos civis e políticos de forma definitiva.',
        'E': 'Priorizar o recolhimento coletivo em todos os regimes.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Harmônica integração social)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• B) CORRETA. É a literalidade do Art. 1º da LEP, consagrando a finalidade preventiva especial e ressocializadora da pena.''',
    ),
    QuestaoModel(
      id: 409,
      banca: 'Cebraspe',
      orgao: 'Polícia Penal',
      cargo: 'Policial Penal',
      ano: 2024,
      disciplina: 'Legislação Especial',
      assunto: 'Comissão Técnica de Classificação',
      enunciado: 'A Comissão Técnica de Classificação (CTC) existente em cada estabelecimento prisional é presidida pelo diretor e composta por, no mínimo:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': '2 juízes e 2 promotores de justiça.',
        'B': '2 chefes de serviço, 1 psiquiatra, 1 psicólogo e 1 assistente social.',
        'C': '3 policiais penais e 2 advogados da OAB.',
        'D': '1 defensor público e 3 chefes de segurança.',
        'E': 'Exclusivamente por servidores administrativos da Secretaria de Administração Penitenciária.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (2 chefes + psiquiatra + psicólogo + assistente social)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• B) CORRETA. Art. 7º da LEP: A comissão técnica de classificação será composta por 2 chefes de serviço, 1 psiquiatra, 1 psicólogo e 1 assistente social, sob a presidência do diretor.''',
    ),
    QuestaoModel(
      id: 410,
      banca: 'Instituto AOCP',
      orgao: 'Polícia Penal',
      cargo: 'Policial Penal',
      ano: 2024,
      disciplina: 'Legislação Especial',
      assunto: 'Banho de Sol no RDD',
      enunciado: 'No Regime Disciplinar Diferenciado (RDD), o direito ao banho de sol do apenado é assegurado nos seguintes termos:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': '1 hora diária, de forma estritamente individual.',
        'B': '2 horas diárias, em grupos de até 4 presos, desde que não sejam do mesmo grupo criminoso.',
        'C': '3 horas diárias, aos sábados e domingos.',
        'D': '4 horas diárias, com monitoramento exclusivo por câmeras.',
        'E': 'O banho de sol é suspenso durante todo o período em que o preso estiver no RDD.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (2 horas diárias, grupos de até 4 presos)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• B) CORRETA. Art. 52, IV da LEP: Direito do preso à saída da cela por 2 horas diárias para banho de sol, em grupos de até 4 presos, desde que não pertençam à mesma facção rival ou milícia.''',
    ),
    QuestaoModel(
      id: 411,
      banca: 'Cebraspe',
      orgao: 'Polícia Penal',
      cargo: 'Policial Penal',
      ano: 2023,
      disciplina: 'Legislação Especial',
      assunto: 'Tipificação de Faltas Disciplinares',
      enunciado: 'A respeito das faltas disciplinares previstas na Lei de Execução Penal, é correto afirmar que:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Tanto as faltas leves, médias quanto graves são de competência privativa da União por lei complementar.',
        'B': 'A legislação local especifica as faltas leves e médias; já a LEP tipifica as faltas graves.',
        'C': 'Não existem faltas de natureza grave previstas em lei federal.',
        'D': 'As faltas disciplinares graves dependem de prévia homologação da câmara dos deputados.',
        'E': 'A tentativa de falta disciplinar é impunível no sistema penitenciário.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Legislação local: leves/médias; LEP: graves)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• B) CORRETA. Art. 49 da LEP: As faltas disciplinares classificam-se em leves, médias e graves. A legislação local especificará as leves e médias; as graves são reguladas diretamente pela LEP.''',
    ),
    QuestaoModel(
      id: 412,
      banca: 'Instituto AOCP',
      orgao: 'Polícia Penal',
      cargo: 'Policial Penal',
      ano: 2024,
      disciplina: 'Legislação Especial',
      assunto: 'Trabalho do Preso e CLT',
      enunciado: 'Sobre o trabalho do condenado à pena privativa de liberdade, a Lei de Execução Penal expressamente determina que:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Está sujeito ao regime da Consolidação das Leis do Trabalho (CLT), com direito a FGTS e férias.',
        'B': 'Não está sujeito ao regime da Consolidação das Leis do Trabalho (CLT).',
        'C': 'É estritamente voluntário e sem remuneração.',
        'D': 'Pode consistir em trabalhos forçados de sol a sol para condenados por crimes hediondos.',
        'E': 'É proibido para presos em regime fechado.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Não está sujeito à CLT)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• B) CORRETA. Art. 28, § 2º da LEP: O trabalho do preso não está sujeito ao regime da Consolidação das Leis do Trabalho (CLT). O trabalho prisional é dever social e condição de dignidade humana.''',
    ),
    QuestaoModel(
      id: 413,
      banca: 'Cebraspe',
      orgao: 'Polícia Penal',
      cargo: 'Policial Penal',
      ano: 2024,
      disciplina: 'Legislação Especial',
      assunto: 'Tentativa de Falta Disciplinar',
      enunciado: 'Nos termos do Art. 49, parágrafo único, da Lei de Execução Penal, pune-se a tentativa com a sanção correspondente à falta consumada:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Apenas com advertência escrita.',
        'B': 'Com a sanção correspondente à falta consumada.',
        'C': 'Com a metade da sanção prevista para a consumada.',
        'D': 'A tentativa de falta disciplinar é impunível.',
        'E': 'Com a perda imediata do direito a visita íntima por dois anos.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Mesma sanção da falta consumada)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• B) CORRETA. Art. 49, Parágrafo Único da LEP: Pune-se a tentativa com a sanção correspondente à falta consumada. Na disciplina prisional, a tentativa tem a mesma reprimenda da consumação.''',
    ),
    QuestaoModel(
      id: 414,
      banca: 'Instituto AOCP',
      orgao: 'Polícia Penal',
      cargo: 'Policial Penal',
      ano: 2024,
      disciplina: 'Legislação Especial',
      assunto: 'Remição por Estudo',
      enunciado: 'Segundo a LEP, o condenado que cumpre a pena em regime fechado ou semiaberto poderá remir o tempo de execução por estudo. O critério legal é de 1 dia de pena para cada:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': '6 horas de frequência escolar.',
        'B': '12 horas de frequência escolar, divididas no mínimo em 3 dias.',
        'C': '24 horas de frequência escolar em um único dia.',
        'D': '30 horas de frequência escolar em 5 dias.',
        'E': '40 horas de frequência escolar sem divisão de dias.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (12 horas de frequência escolar em no mínimo 3 dias)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• B) CORRETA. Art. 126, § 1º, I da LEP: 1 dia de pena a cada 12 horas de frequência escolar (ensino fundamental, médio, técnico ou superior), distribuídas no mínimo em 3 dias.''',
    ),
    QuestaoModel(
      id: 415,
      banca: 'Cebraspe',
      orgao: 'Polícia Penal',
      cargo: 'Policial Penal',
      ano: 2024,
      disciplina: 'Legislação Especial',
      assunto: 'Assistências ao Preso',
      enunciado: 'A assistência ao preso e ao internado é dever do Estado, objetivando prevenir o crime e orientar o retorno à convivência em sociedade. Nos termos da LEP, essa assistência estende-se a:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Material, à saúde, jurídica, educacional, social e religiosa.',
        'B': 'Apenas assistência material e alimentar básica.',
        'C': 'Exclusivamente assistência judiciária quando o réu for primário.',
        'D': 'Apenas socorro médico em casos cirúrgicos urgentes.',
        'E': 'Assistência financeira com remuneração integral de salário mínimo sem desconto.',
      },
      gabaritoOficial: 'A',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: A (Material, Saúde, Jurídica, Educacional, Social e Religiosa)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• A) CORRETA. Art. 11 da LEP: A assistência será material, à saúde, jurídica, educacional, social e religiosa. Mnemônico: M-S-J-E-S-R (As 6 assistências obrigatórias da LEP).''',
    ),
  ],
);
