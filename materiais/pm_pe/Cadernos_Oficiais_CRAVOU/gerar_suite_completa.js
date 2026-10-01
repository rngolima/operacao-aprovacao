const path = require('path');
const { formatarCadernoCravou } = require('./gerador_caderno_cravou');

async function gerarTodosCadernos() {
  const baseDir = __dirname;

  // 1. LÍNGUA PORTUGUESA (AOCP)
  await formatarCadernoCravou({
    disciplina: 'Língua Portuguesa Tática',
    subtitulo: 'Compreensão de Texto, Tipologia, Crase, Regência, Concordância e Sintaxe',
    banca: 'Instituto AOCP',
    concurso: 'PM-PE • Soldado da Polícia Militar',
    arquivoSaida: path.join(baseDir, 'CRAVOU_PMPE_Lingua_Portuguesa_Caderno_Oficial.pdf'),
    topicos: [
      {
        titulo: 'Tipologia e Gêneros Textuais (AOCP)',
        itens: [
          { texto: 'Texto Narrativo: Progressão temporal de fatos cronológicos, verbos de ação no pretérito, narrador (1ª ou 3ª pessoa), personagens, tempo e espaço (Mnemônico PENTE).' },
          { texto: 'Texto Dissertativo-Argumentativo: Defesa de uma tese/ponto de vista através de argumentos fundamentados, dados e juízos de valor para persuadir o leitor.' },
          { texto: 'Texto Descritivo: Retrato estático de características físicas ou psicológicas de seres, objetos ou ambientes (ausência de progressão temporal).' },
          { texto: 'Texto Injuntivo / Instrucional: Fornece comandos, ordens, regras ou instruções de comportamento (predomínio de verbos no imperativo).' }
        ]
      },
      {
        titulo: 'Regência e o Emprego do Acento Grave (Crase)',
        itens: [
          { tipo: 'destaque', texto: '"A" no singular diante de substantivo no plural JAMAIS recebe crase (ex: "Refiro-me a leis").' },
          { tipo: 'mnemonico', texto: 'Troca pelo masculino: Se diante da palavra masculina virar "AO", diante da feminina HAVERÁ CRASE ("Vou AO quartel" -> "Vou À delegacia").' },
          { texto: 'Casos Facultativos de Crase: Nomes próprios femininos (sem especificador), pronome possessivo feminino singular (minha, tua, sua) e após a preposição "até".' }
        ]
      },
      {
        titulo: 'Pontuação: O Uso Estratégico da Vírgula',
        itens: [
          { tipo: 'destaque', texto: 'REGRA SAGRADA: Nunca se separa por vírgula o Sujeito do seu Verbo, nem o Verbo dos seus Complementos Diretos ou Indiretos.' },
          { texto: 'Oração Subordinada Adjetiva: COM vírgula é EXPLICATIVA (generaliza o grupo todo); SEM vírgula é RESTRITIVA (delimita apenas uma parcela do grupo).' },
          { texto: 'Adjunto Adverbial deslocado de grande extensão (3 ou mais palavras): Vírgula obrigatória.' }
        ]
      }
    ],
    questoes: [
      {
        banca: 'Instituto AOCP',
        orgao: 'PM-PE',
        assunto: 'Tipologia Textual',
        enunciado: 'O trecho "O soldado avançou pela viela escura, sentiu o pulso acelerar ao dobrar a esquina e avistou a viatura estacionada sob a chuva fina" classifica-se predominantemente como:',
        alternativas: {
          'A': 'Dissertativo-argumentativo',
          'B': 'Narrativo',
          'C': 'Injuntivo',
          'D': 'Descritivo',
          'E': 'Expositivo'
        },
        gabarito: 'B (Narrativo)',
        comentario: 'CRAVOU! Há sucessão temporal cronológica de ações (avançou -> sentiu -> dobrou -> avistou) com personagem inserido no tempo e espaço.'
      }
    ]
  });

  // 2. HISTÓRIA DE PERNAMBUCO
  await formatarCadernoCravou({
    disciplina: 'História de Pernambuco Tática',
    subtitulo: 'Capitania Hereditária, Ocupação Holandesa, Revolução de 1817 e Confederação do Equador',
    banca: 'Instituto AOCP',
    concurso: 'PM-PE • Soldado da Polícia Militar',
    arquivoSaida: path.join(baseDir, 'CRAVOU_PMPE_Historia_de_Pernambuco_Caderno_Oficial.pdf'),
    topicos: [
      {
        titulo: 'Capitania de Pernambuco e a Economia Açucareira',
        itens: [
          { texto: 'Duarte Coelho recebeu a Capitania de Nova Lusitânia (Pernambuco) em 1534 através da Carta de Doação e Foral.' },
          { texto: 'Fatores do sucesso precoce de Pernambuco: Solo massapê fértil, clima favorável, proximidade geográfica com a Europa e a lucrativa agroindústria canavieira com mão de obra escravizada.' }
        ]
      },
      {
        titulo: 'Invasão Holandesa e o Período Nassoviano (1630-1654)',
        itens: [
          { texto: 'Companhia das Índias Ocidentais (WIC) visava reaver o monopólio comercial do açúcar após a União Ibérica (1580-1640).' },
          { tipo: 'destaque', texto: 'Maurício de Nassau (1637-1644) consolidou a Era de Ouro: Tolerância religiosa (católicos, judeus e calvinistas), empréstimos aos senhores de engenho, embelezamento de Recife (Cidade Maurícia) e obras científicas.' },
          { texto: 'Insurreição Pernambucana (1645-1654): Batalhas dos Guararapes (1648 e 1649), marco histórico da gênese do Exército Brasileiro.' }
        ]
      },
      {
        titulo: 'Movimentos Emancipacionistas: 1817 e 1824',
        itens: [
          { tipo: 'destaque', texto: 'Revolução Pernambucana de 1817: Único movimento revolucionário que tomou o poder e proclamou uma República provisória em Pernambuco.' },
          { texto: 'Confederação do Equador (1824): Revolta republicana contra o Poder Moderador absolutista de D. Pedro I e a imposição da Constituição outorgada de 1824. Destaca-se a liderança de Frei Caneca.' }
        ]
      }
    ],
    questoes: [
      {
        banca: 'Instituto AOCP',
        orgao: 'PM-PE',
        assunto: 'Invasões Holandesas',
        enunciado: 'Durante a administração de Maurício de Nassau em Pernambuco (1637-1644), destacou-se como principal característica:',
        alternativas: {
          'A': 'A perseguição e expulsão de judeus e católicos da capitania.',
          'B': 'A política de tolerância religiosa e concessão de créditos financeiros aos produtores de cana.',
          'C': 'O abandono da cidade de Recife e transferência da capital para Olinda.',
          'D': 'A proibição do comércio de açúcar com as províncias vizinhas.',
          'E': 'O alinhamento imediato com a Coroa espanhola.'
        },
        gabarito: 'B',
        comentario: 'CRAVOU! Nassau governou com diplomacia, tolerância de cultos e fomento econômico aos plantadores de cana.'
      }
    ]
  });

  // 3. GEOGRAFIA DE PERNAMBUCO
  await formatarCadernoCravou({
    disciplina: 'Geografia de Pernambuco Tática',
    subtitulo: 'Relevo, Mesorregiões, Clima, Vegetação e Polos Econômicos de Desenvolvimento',
    banca: 'Instituto AOCP',
    concurso: 'PM-PE • Soldado da Polícia Militar',
    arquivoSaida: path.join(baseDir, 'CRAVOU_PMPE_Geografia_de_Pernambuco_Caderno_Oficial.pdf'),
    topicos: [
      {
        titulo: 'Mesorregiões Naturais e Fitogeografia',
        itens: [
          { texto: 'Zona da Mata: Litoral úmido, solo massapê, bioma Mata Atlântica e maior concentração urbano-industrial do Estado.' },
          { texto: 'Agreste: Zona de transição entre o úmido e o semiárido. Clima tropical de altitude e Polo de Confecções (Caruaru, Santa Cruz do Capibaribe e Toritama).' },
          { texto: 'Sertão: Clima semiárido, baixos índices pluviométricos, vegetação de Caatinga e destaque para a fruticultura irrigada do Vale do São Francisco (Petrolina).' }
        ]
      },
      {
        titulo: 'Relevo e Hidrografia',
        itens: [
          { tipo: 'destaque', texto: 'Planalto da Borborema: Atua como barreira orográfica que retém as massas de ar úmidas no litoral (chuvas de relevo), contribuindo para a aridez no Sertão.' },
          { texto: 'Bacia do Rio São Francisco: Rio perene vital para geração de energia hidrelétrica (Sobradinho, Itaparica, Paulo Afonso) e irrigação agrícola.' }
        ]
      }
    ],
    questoes: [
      {
        banca: 'Instituto AOCP',
        orgao: 'PM-PE',
        assunto: 'Relevo e Clima de Pernambuco',
        enunciado: 'O acidente geomorfológico que atua como obstáculo natural às nuvens carregadas de umidade vindas do oceano Atlântico em direção ao interior de Pernambuco denomina-se:',
        alternativas: {
          'A': 'Depressão Sertaneja',
          'B': 'Chapada do Araripe',
          'C': 'Planalto da Borborema',
          'D': 'Planície Costeira',
          'E': 'Serra das Russas'
        },
        gabarito: 'C (Planalto da Borborema)',
        comentario: 'CRAVOU! O Planalto da Borborema provoca as chuvas orográficas na encosta oriental e impede a passagem da umidade para o Sertão.'
      }
    ]
  });

  // 4. RACIOCÍNIO LÓGICO MATEMÁTICO
  await formatarCadernoCravou({
    disciplina: 'Raciocínio Lógico Matemático Tático',
    subtitulo: 'Lógica Proposicional, Tabelas-Verdade, Negações, Equivalências e Conjuntos',
    banca: 'Instituto AOCP',
    concurso: 'PM-PE • Soldado da Polícia Militar',
    arquivoSaida: path.join(baseDir, 'CRAVOU_PMPE_Raciocinio_Logico_Caderno_Oficial.pdf'),
    topicos: [
      {
        titulo: 'Tabela-Verdade e Conectivos Lógicos',
        itens: [
          { texto: 'Conjunção (E / ∧): Só é VERDADE quando TODAS as proposições forem verdadeiras.' },
          { texto: 'Disjunção Inclusiva (OU / ∨): Só é FALSA quando TODAS forem falsas.' },
          { tipo: 'destaque', texto: 'Condicional (SE... ENTÃO / →): A única combinação FALSA é V -> F ("Vera Fischer é Falsa").' },
          { texto: 'Bicondicional (SE E SOMENTE SE / ↔): É VERDADEIRA quando os valores forem iguais (V↔V ou F↔F).' }
        ]
      },
      {
        titulo: 'Leis de Morgan e Negações Táticas',
        itens: [
          { tipo: 'mnemonico', texto: 'Negação do SE... ENTÃO (P → Q): Regra do "MANÉ" -> MANTÉM a primeira E NEGA a segunda (P ∧ ~Q).' },
          { tipo: 'mnemonico', texto: 'Negação do E e do OU: Nega tudo e inverte o conectivo (~(P ∧ Q) ≡ ~P ∨ ~Q).' }
        ]
      }
    ],
    questoes: [
      {
        banca: 'Instituto AOCP',
        orgao: 'PM-PE',
        assunto: 'Negação da Condicional',
        enunciado: 'A negação lógica da proposição "Se o policial treina tática, então ele acerta o tiro" corresponde a:',
        alternativas: {
          'A': 'O policial não treina tática ou não acerta o tiro.',
          'B': 'Se o policial não treina tática, então ele não acerta o tiro.',
          'C': 'O policial treina tática e não acerta o tiro.',
          'D': 'O policial não treina tática e acerta o tiro.',
          'E': 'Se o policial acerta o tiro, então ele treina tática.'
        },
        gabarito: 'C',
        comentario: 'CRAVOU! Regra do MANÉ: Mantém a primeira ("O policial treina tática") E nega a segunda ("não acerta o tiro").'
      }
    ]
  });

  // 5. DIREITO CONSTITUCIONAL & DIREITOS HUMANOS
  await formatarCadernoCravou({
    disciplina: 'Direito Constitucional & Direitos Humanos',
    subtitulo: 'Artigo 5º da CF/88, Remédios Constitucionais, DUDH e Pacto de San José da Costa Rica',
    banca: 'Instituto AOCP',
    concurso: 'PM-PE • Soldado da Polícia Militar',
    arquivoSaida: path.join(baseDir, 'CRAVOU_PMPE_Constitucional_e_Direitos_Humanos_Caderno_Oficial.pdf'),
    topicos: [
      {
        titulo: 'Artigo 5º da Constituição Federal de 1988',
        itens: [
          { texto: 'Inviolabilidade do Domicílio (Art. 5º, XI): A casa é asilo inviolável. Entrada permitida durante o dia com mandado judicial. Em flagrante delito, desastre ou socorro: permitido a qualquer hora (dia ou noite).' },
          { tipo: 'destaque', texto: 'Prisão em Flagrante: Qualquer do povo PODERÁ e as autoridades policiais e seus agentes DEVERÃO prender quem quer que seja encontrado em flagrante delito.' },
          { texto: 'Remédios Constitucionais: Habeas Corpus (liberdade de locomoção - gratuito); Habeas Data (conhecer ou retificar dados pessoais - gratuito); Mandado de Segurança (direito líquido e certo não amparado por HC ou HD).' }
        ]
      },
      {
        titulo: 'Tratados Internacionais e Direitos Humanos (Art. 5º, §3º)',
        itens: [
          { tipo: 'destaque', texto: 'Rito de Emenda Constitucional: Tratados de Direitos Humanos aprovados em cada casa do Congresso (Câmara e Senado), em 2 turnos, por 3/5 dos votos, equivalem a EMENDAS CONSTITUCIONAIS.' },
          { texto: 'Demais tratados de Direitos Humanos anteriores ou sem o rito especial possuem status SUPRALEGAL (STF - acima das leis e abaixo da Constituição).' },
          { texto: 'Pacto de San José da Costa Rica (CADH): Proíbe a prisão civil do depositário infiel (Súmula Vinculante 25 do STF).' }
        ]
      }
    ],
    questoes: [
      {
        banca: 'Instituto AOCP',
        orgao: 'PM-PE',
        assunto: 'Inviolabilidade Domiciliar',
        enunciado: 'Nos termos da Constituição Federal de 1988, a entrada em domicílio sem o consentimento do morador mediante determinação judicial poderá ocorrer:',
        alternativas: {
          'A': 'A qualquer hora do dia ou da noite.',
          'B': 'Somente durante o dia.',
          'C': 'Durante a noite, desde que acompanhado do Ministério Público.',
          'D': 'A qualquer momento nos finais de semana.',
          'E': 'Exclusivamente com a presença de um perito oficial.'
        },
        gabarito: 'B (Somente durante o dia)',
        comentario: 'CRAVOU! Com mandado judicial a entrada é restrita ao período diurno (dia). A qualquer hora só em flagrante delito, desastre ou socorro.'
      }
    ]
  });

  console.log('✅ TODOS OS CADERNOS OFICIAIS CRAVOU FORAM GERADOS COM SUCESSO!');
}

gerarTodosCadernos().catch(console.error);
