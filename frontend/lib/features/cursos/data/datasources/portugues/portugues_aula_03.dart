import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import '../../models/mapa_mental_model.dart';

/// AULA 03: Classes de Palavras e Morfossintaxe
final AulaGuiaItem portuguesAula03 = AulaGuiaItem(
  numero: '03',
  titulo: 'Classes de Palavras e Morfossintaxe (Substantivo, Adjetivo, Pronomes, Verbos e Conjunções)',
  detalhes: '20 min • Método CRAVOU • 15 questões comentadas',
  concluida: false,
  conteudoTeorico: '''# CLASSES DE PALAVRAS E MORFOSSINTAXE ESTRATÉGICA

## 1. O SISTEMA DAS 10 CLASSES DE PALAVRAS
- **Classes Variáveis (6)**: Substantivo, Artigo, Adjetivo, Numeral, Pronome, Verbo.
- **Classes Invariáveis (4)**: Advérbio, Preposição, Conjunção, Interjeição.

---

## 2. CONJUNÇÕES: O TÓPICO MAIS COBRADO EM CONCURSOS
1. **Conjunções Coordenativas (Mnemônico CA-AD-AL-EX-CON)**:
   - **C**onclusivas: portanto, logo, por conseguinte, pois (posposto ao verbo).
   - **Ad**versativas: mas, porém, contudo, todavia, entretanto, no entanto.
   - **Al**ternativas: ou... ou, ora... ora, quer... quer.
   - **Ex**plicativas: porque, que, pois (anteposto ao verbo), porquanto.
   - **Ad**itivas: e, nem, não só... mas também.
2. **Conjunções Subordinativas Adverbiais (Mnemônico 6C + FTP)**:
   - **Causais**: porque, já que, visto que, como (no início da frase), uma vez que.
   - **Comparativas**: como, tal qual, mais... do que.
   - **Concessivas (CAMPEÃS DE PROVA)**: embora, ainda que, mesmo que, conquanto, a despeito de, posto que, se bem que. *(Indicam quebra de expectativa sem anular o fato principal).*
   - **Condicionais**: se, caso, desde que, contanto que.
   - **Conformativas**: conforme, segundo, consoante, como.
   - **Consecutivas**: tão... que, tanto... que, de sorte que.
   - **Finais**: a fim de que, para que.
   - **Temporais**: quando, enquanto, assim que, logo que.
   - **Proporcionais**: à proporção que, à medida que.

---

## 3. PRONOMES RELATIVOS E VALOR MORFOSSINTÁTICO
- **Pronome Relativo QUE**:
  - Introduz oração subordinada adjetiva.
  - Teste CRAVOU: Substitua por "o qual / a qual". Se couber, É PRONOME RELATIVO.
  - Se for precedido por verbo cognoscente e puder ser substituído por "ISSO", É **CONJUNÇÃO INTEGRANTE** (introduz oração subordinada substantiva).
- **Pronome Cujo / Cuja**:
  - Estabelece relação de posse entre dois substantivos (*O policial cuja arma foi apreendida...*).
  - NUNCA admite artigo após si (ERRADO: *cujo o*, *cuja a*).

---

## 4. COLOCAÇÃO PRONOMINAL (PRÓCLISE, MESÓCLISE E ÊNCLISE)
1. **Próclise Obrigatória (Palavras Atrativas)**:
   - Palavras negativas (*não, nunca, jamais*).
   - Pronomes relativos (*que, quem, cujo*).
   - Pronomes indefinidos e demonstrativos (*alguém, tudo, isso*).
   - Advérbios curtos sem pausa de vírgula (*aqui, sempre, talvez*).
   - Orações optativas, interrogativas e exclamativas.
2. **Mesóclise**:
   - Verbos no Futuro do Presente ou Futuro do Pretérito, desde que NÃO haja palavra atrativa (*Apresentar-se-á ao batalhão*).
3. **Ênclise**:
   - Início de oração (*Apresente-se imediatamente!*). NUNCA inicie oração com pronome oblíquo na norma culta.''',
  mapaMental: const MapaMentalData(
    titulo: 'Mapa Mental: Morfossintaxe e Classes de Palavras',
    conceitoCentral: 'Classificação e Função Sintática no Padrão das Bancas',
    regraDeOuro: 'Conjunção estabelece o nexo semântico; conectivo concessivo quebra expectativa sem anular a oração principal!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Conjunções Coordenadas',
        subtitulo: 'Mnemônico CA-AD-AL-EX-CON',
        corRamo: Color(0xFF2563EB),
        icone: Icons.alt_route,
        itens: [
          MapaMentalItem(
            titulo: 'Adversativas (Oposição)',
            descricao: 'mas, porém, contudo, todavia, entretanto, no entanto.',
            exemplo: 'Estudou bastante, porém não fez simulados.',
          ),
          MapaMentalItem(
            titulo: 'Conclusivas (Dedução)',
            descricao: 'logo, portanto, por conseguinte, desse modo.',
            exemplo: 'Cumpriu a escala, logo terá folga amanhã.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Conjunções Subordinadas',
        subtitulo: 'Mnemônico 6C + FTP',
        corRamo: Color(0xFFDC2626),
        icone: Icons.account_tree,
        itens: [
          MapaMentalItem(
            titulo: 'Concessivas (Quebra Suave)',
            descricao: 'embora, conquanto, ainda que, a despeito de.',
            mnemonico: 'Oposição que não impede o evento principal',
            exemplo: 'Embora chovesse, os policiais patrulharam.',
          ),
          MapaMentalItem(
            titulo: 'Causais (Motivo Real)',
            descricao: 'porque, visto que, já que, como (início da frase).',
            exemplo: 'Como estava frio, vestiu o casaco tático.',
          ),
          MapaMentalItem(
            titulo: 'Finais (Objetivo)',
            descricao: 'a fim de que, para que.',
            exemplo: 'Treinou muito a fim de alcançar a nota de corte.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Pronomes e o Teste do QUE',
        subtitulo: 'Distingue Pronome Relativo de Conjunção Integrante',
        corRamo: Color(0xFF059669),
        icone: Icons.psychology,
        itens: [
          MapaMentalItem(
            titulo: 'Pronome Relativo',
            descricao: 'Substituível por "o qual / a qual". Inicia oração adjetiva.',
            exemplo: 'O soldado que (o qual) treinou foi aprovado.',
          ),
          MapaMentalItem(
            titulo: 'Conjunção Integrante',
            descricao: 'Toda a oração pode ser trocada pela palavra "ISSO". Inicia oração substantiva.',
            exemplo: 'O delegado informou que (ISSO) as buscas continuam.',
          ),
          MapaMentalItem(
            titulo: 'O Pronome "Cujo"',
            descricao: 'Posse entre dois nomes. Proibido artigo após "cujo".',
            mnemonico: 'NUNCA escreva "cujo o" ou "cuja a"!',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Colocação Pronominal',
        subtitulo: 'Próclise, Mesóclise e Ênclise',
        corRamo: Color(0xFFD97706),
        icone: Icons.swap_horiz,
        itens: [
          MapaMentalItem(
            titulo: 'Próclise (Palavra Atrativa)',
            descricao: 'Negações, pronomes relativos, indefinidos e advérbios atraem o pronome.',
            exemplo: 'Não ME deixe aqui; Quem TE falou isso?',
          ),
          MapaMentalItem(
            titulo: 'Início de Frase',
            descricao: 'Proibido próclise em início de período. Use ênclise!',
            mnemonico: '"Dê-me a arma" (Certo) vs "Me dê a arma" (Errado na norma culta).',
          ),
        ],
      ),
    ],
  ),
  questoes: const [
    QuestaoModel(
      id: 301,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Conjunções',
      enunciado: 'No período: "Conquanto o policiamento ostensivo tenha sido reforçado nas ruas, os índices de roubo persistiram elevados", o conectivo "Conquanto" estabelece relação semântica de:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Conclusão.',
        'B': 'Causa imediata.',
        'C': 'Concessão.',
        'D': 'Finalidade.',
        'E': 'Proporcionalidade.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (Concessão)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• A) INCORRETA. Conectivos conclusivos encerram um raciocínio lógico (portanto, logo, por conseguinte, destarte, dessarte).
• B) INCORRETA. Conectivos causais indicam a origem/motivo do fato expresso na oração principal (porque, visto que, já que, uma vez que, porquanto).
• C) CORRETA. "Conquanto" é a conjunção subordinativa concessiva clássica da língua culta! A oração concessiva veicula um obstáculo, objeção ou quebra de expectativa que NÃO é suficiente para impedir a realização do fato expresso na oração principal. Equivale a: embora, ainda que, mesmo que, a despeito de, posto que, se bem que, nada obstante.
• D) INCORRETA. Conectivos finais apontam o propósito ou objetivo da ação (para que, a fim de que).
• E) INCORRETA. Conectivos proporcionais indicam simultaneidade gradual de variações (à medida que, ao passo que).

💡 O PULO DO GATO / PEGADINHA MORTAL DA AOCP:
Jamais confunda:
• CONQUANTO = Concessão (Embora) -> Exige verbo no SUBJUNTIVO ("conquanto tenha sido").
• PORQUANTO = Causa / Explicação (Porque / Visto que) -> Geralmente usa verbo no INDICATIVO.''',
    ),
    QuestaoModel(
      id: 302,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Classes de Palavras - Pronome Relativo',
      enunciado: 'Em: "As estratégias QUE o batalhão adotou foram exitosas", o vocábulo destacado classifica-se morfologicamente como pronome relativo e exerce a função sintática de objeto direto.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ANÁLISE MORFOSSINTÁTICA PASSO A PASSO (MÉTODO CRAVOU):
1. Análise Morfológica:
   • O vocábulo "QUE" retoma um substantivo antecedente ("as estratégias") e pode ser substituído com perfeição por "as quais" ("As estratégias AS QUAIS o batalhão adotou..."). Logo, morfologicamente é um PRONOME RELATIVO.
2. Análise Sintática (Como achar a função sintática do pronome relativo):
   • Isole a oração subordinada adjetiva: "...que o batalhão adotou".
   • Substitua o pronome relativo pelo antecedente que ele representa: "O batalhão adotou as estratégias".
   • Organize na ordem direta (Sujeito + Verbo + Complemento):
     - Sujeito: "O batalhão"
     - Verbo: "adotou" (Verbo Transitivo Direto - VTD: quem adota, adota algo)
     - Objeto Direto: "as estratégias"
   • Conclusão: Como o pronome relativo "que" está no lugar de "as estratégias", ele exerce a função sintática exata de OBJETO DIRETO! O item é 100% perfeito.''',
    ),
    QuestaoModel(
      id: 303,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Pronome Cujo',
      enunciado: 'Assinale a alternativa em que o pronome "cujo" foi empregado de acordo com a norma-padrão da língua portuguesa:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'O policial cujo o armamento foi periciado já retornou às funções.',
        'B': 'A operação cujos objetivos foram cumpridos recebeu elogio formal.',
        'C': 'O cidadão cujo a casa foi invadida prestou depoimento.',
        'D': 'Os alunos cujos os cadernos sumiram reclamaram com a coordenação.',
        'E': 'O suspeito cujo onde estava escondido foi capturado.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B

🔍 DESTRINCHANDO AS 4 REGRAS DE OURO DO PRONOME "CUJO":
1. Sempre estabelece relação de POSSE entre o termo antecedente (possuidor) e o consequente (coisa possuída): em B, os objetivos pertencem à operação (os objetivos da operação).
2. Sempre concorda em GÊNERO e NÚMERO com a coisa POSSUÍDA (termo posterior): "cujos objetivos" (masculino plural).
3. NUNCA, JAMAIS admite artigo imediatamente após si! As formas "cujo o", "cuja a", "cujos os", "cujas as" são ABERRAÇÕES gramaticais em concurso público!
4. Nunca pode ser substituído simplesmente por "o qual" ou "onde".

Análise das alternativas:
• A) INCORRETA: Erro clássico de uso de artigo: "cujo o armamento" (deveria ser "cujo armamento").
• B) CORRETA: Estabelece posse, concorda com "objetivos" (masculino plural) e NÃO usa artigo.
• C) INCORRETA: Erro de concordância e de artigo: "cujo a casa" (deveria ser "cuja casa").
• D) INCORRETA: Presença indevida de artigo no plural: "cujos os cadernos".
• E) INCORRETA: Mistura bizarra de pronomes ("cujo onde").''',
    ),
    QuestaoModel(
      id: 304,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Conjunção Integrante vs Pronome Relativo',
      enunciado: 'Na oração "O comandante confirmou que os novos soldados seriam designados para o interior", a palavra "que" classifica-se como pronome relativo.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'ERRADO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: ERRADO

🔍 O FAMOSO TESTE DO "ISSO" (MÉTODO CRAVOU):
Para diferenciar o "QUE" Pronome Relativo do "QUE" Conjunção Integrante em 5 segundos de prova:
1. Pronome Relativo:
   • Vem após um substantivo/pronome antecedente;
   • Pode ser trocado por: o qual, a qual, os quais, as quais;
   • Inicia Oração Subordinada Adjetiva.
2. Conjunção Integrante:
   • Vem após um verbo transitivo, verbo de ligação ou substantivo abstrato que exige complemento oracional;
   • Permite que TODA a oração subordinada iniciada por ela seja substituída pelo pronome demonstrativo neutro "ISSO" (ou "DISSO", "NISSO");
   • Inicia Oração Subordinada Substantiva.

No período em análise:
• "O comandante confirmou [que os novos soldados seriam designados para o interior]"
• Teste: "O comandante confirmou [ISSO]!"
• Encaixe perfeito! Quem confirma, confirma algo (ISSO). Logo, o "que" é uma CONJUNÇÃO INTEGRANTE que encabeça uma Oração Subordinada Substantiva Objetiva Direta. Jamais pronome relativo!''',
    ),
    QuestaoModel(
      id: 305,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Colocação Pronominal',
      enunciado: 'Assinale a alternativa que atende rigorosamente às regras de colocação pronominal:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Me diga a verdade sobre o ocorrido!',
        'B': 'Jamais enganar-te-ei com promessas vazias.',
        'C': 'Não se afaste da linha de tiro durante a instrução.',
        'D': 'Os militares apresentaram-se quando chamaram-nos.',
        'E': 'Tudo falou-me a respeito da sua coragem.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C

🔍 DESTRINCHANDO A COLOCAÇÃO PRONOMINAL:
• A) INCORRETA. Na norma-padrão culta, é ESTRITAMENTE PROIBIDO iniciar períodos ou frases por pronome oblíquo átono! O correto é a ênclise: "Diga-me a verdade...".
• B) INCORRETA. A palavra com sentido negativo "Jamais" é palavra atrativa soberana que impõe a PRÓCLISE obrigatória ("Jamais te enganarei"). A mesóclise é imediatamente anulada quando houver palavra atrativa antes do verbo no futuro!
• C) CORRETA. O advérbio de negação "Não" é um forte ímã atrativo, atraindo compulsoriamente o pronome oblíquo "se" para antes do verbo ("Não se afaste").
• D) INCORRETA. A conjunção temporal "quando" é palavra subordinativa e atrai o pronome para a próclise: "quando nos chamaram", e nunca "quando chamaram-nos".
• E) INCORRETA. O pronome indefinido "Tudo" é palavra atrativa de próclise: "Tudo me falou", e nunca "falou-me".

💡 MNEMÔNICO DAS PALAVRAS ATRATIVAS DE PRÓCLISE (NARIS-D):
• N = Negativas (não, jamais, nunca, nem).
• A = Advérbios (ontem, aqui, sempre, talvez).
• R = Relativos (que, quem, cujo, onde).
• I = Indefinidos e Interrogativos (tudo, nada, alguém, quem?).
• S = Subordinativas conjunções (quando, se, embora, porque).
• D = Demonstrativos neutros (isso, aquilo, isto).''',
    ),
    QuestaoModel(
      id: 306,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Conjunções Coordenativas',
      enunciado: 'No período "O suspeito tentou fugir pelos fundos, todavia foi prontamente contido pela guarnição militar", o conectivo "todavia" pode ser substituído, sem alteração do sentido original, por:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'porquanto.',
        'B': 'dessarte.',
        'C': 'contudo.',
        'D': 'conquanto.',
        'E': 'conseguinte.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (contudo)

🔍 ANÁLISE DETALHADA DAS CONJUNÇÕES ADVERSATIVAS:
• "Todavia" é uma conjunção coordenativa adversativa que exprime contraste, oposição ou quebra de expectativa entre duas orações coordenadas.
• O time completo das CONJUNÇÕES ADVERSATIVAS intercambiáveis é: MAS, PORÉM, CONTUDO, TODAVIA, ENTRETANTO, NO ENTANTO, NÃO OBSTANTE.
• Portanto, "contudo" substitui "todavia" com perfeita preservação do sentido original e da correção gramatical.

Descarte dos distratores:
• A) Porquanto: Conjunção causal ou explicativa (= porque, visto que).
• B) Dessarte: Conjunção conclusiva culta (= desse modo, assim sendo, portanto).
• D) Conquanto: Conjunção subordinativa concessiva (= embora, ainda que).
• E) Conseguinte: Conclusiva na locução "por conseguinte" (= logo).''',
    ),
    QuestaoModel(
      id: 307,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Adjetivo e Substantivo',
      enunciado: 'Na expressão "homem pobre" e "pobre homem", a inversão da ordem dos vocábulos altera a classe gramatical das palavras mantendo rigorosamente inalterado o sentido semântico.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'ERRADO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: ERRADO

🔍 POSIÇÃO DO ADJETIVO E TRANSFORMAÇÃO SEMÂNTICA:
O item comete duplo equívoco conceituado pelas bancas examinadoras:
1. Quanto à classe gramatical: Em ambas as expressões, "homem" continua sendo SUBSTANTIVO e "pobre" continua funcionando como ADJETIVO modificador. Não há mudança de classe gramatical.
2. Quanto ao valor semântico (significado): O sentido é RADICALMENTE ALTERADO!
   • "Homem pobre" (adjetivo posposto ao substantivo): Sentido denotativo, literal, objetivo. Refere-se à condição socioeconômica do indivíduo (indigente, desprovido de dinheiro ou patrimônio).
   • "Pobre homem" (adjetivo anteposto ao substantivo): Sentido conotativo, figurado, afetivo e subjetivo. Refere-se a um indivíduo desafortunado, digno de compaixão, coitado ou infeliz.

Outros exemplos clássicos de prova:
• "Grande homem" (ilustre, notável) vs. "Homem grande" (de elevada estatura física).
• "Velho amigo" (amizade antiga) vs. "Amigo velho" (idoso em idade).''',
    ),
    QuestaoModel(
      id: 308,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Conjunções Subordinativas',
      enunciado: 'A locução conjuntiva "à medida que" expressa ideia de proporção, enquanto a expressão "na medida em que" expressa ideia de causa.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 DIFERENCIAÇÃO SEMÂNTICA RIGOROSA:
1. "À MEDIDA QUE" (Proporcional):
   • Conjunção subordinativa proporcional. Indica que duas grandezas ou acontecimentos variam de forma simultânea e proporcional.
   • Equivale a: "à proporção que", "ao passo que".
   • Exemplo: "À medida que os agentes avançavam no curso tático, ganhavam precisão nos disparos."
2. "NA MEDIDA EM QUE" (Causal / Explicativo):
   • Locução conjuntiva causal. Indica o motivo determinante, a justificativa pela qual algo ocorre.
   • Equivale a: "já que", "visto que", "porque", "uma vez que".
   • Exemplo: "A operação foi suspensa na medida em que a tempestade comprometeu a visibilidade dos helicópteros."

💡 AVISO DE ERRO CRASSO:
Expressões híbridas como "à medida em que" ou "na medida que" NÃO EXISTEM no padrão culto e são consideradas erros gravíssimos de redação oficial!''',
    ),
    QuestaoModel(
      id: 309,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Advérbios',
      enunciado: 'O vocábulo "bastante" comporta-se como advérbio invariável quando modifica adjetivos, verbos ou outros advérbios, mas flexiona-se como pronome indefinido adjetivo quando modifica substantivos plurais.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 O TESTE INFALÍVEL DO "MUITO / MUITOS":
O vocábulo "bastante" tem duas personalidades morfossintáticas na prova:
1. BASTANTE como ADVÉRBIO (Invariável):
   • Modifica um verbo, um adjetivo ou outro advérbio, indicando intensidade.
   • Teste: Substitua por "MUITO" (no singular). Se couber "muito", use "bastante" (sempre invariável).
   • Exemplo: "Os policiais estavam BASTANTE cansados" (troque: estavam muito cansados).
2. BASTANTES como PRONOME INDEFINIDO ADJETIVO (Variável):
   • Acompanha um substantivo, indicando quantidade considerável.
   • Teste: Substitua por "MUITOS / MUITAS". Se for para o plural, "bastantes" OBRIGATORIAMENTE vai para o plural!
   • Exemplo: "Havia BASTANTES viaturas no pátio" (troque: havia muitas viaturas).
   • Exemplo: "Eles apresentaram BASTANTES provas ao delegado" (troque: muitas provas).''',
    ),
    QuestaoModel(
      id: 310,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Tempos e Modos Verbais',
      enunciado: 'Na frase: "Se os candidatos estudassem o edital com rigor, obteriam melhores notas na prova", a forma verbal "estudassem" está conjugada no:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Pretérito imperfeito do subjuntivo.',
        'B': 'Futuro do pretérito do indicativo.',
        'C': 'Pretérito mais-que-perfeito do subjuntivo.',
        'D': 'Presente do subjuntivo.',
        'E': 'Pretérito perfeito do indicativo.',
      },
      gabaritoOficial: 'A',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: A (Pretérito imperfeito do subjuntivo)

🔍 CORRELAÇÃO VERBAL TÍPICA DE CONCURSOS POLICIAIS:
O período apresenta a clássica estrutura de hipótese ou condição irreal:
• Oração Subordinada Condicional: "Se os candidatos estudassem..."
  - A desinência modo-temporal "-SSE-" (estuda-SSE-m, fize-SSE-m, quise-SSE-m) é a marca registrada e exclusiva do PRETÉRITO IMPERFEITO DO SUBJUNTIVO. Expressa uma hipótese ou condição incerta no plano da imaginação.
• Oração Principal: "...obteriam melhores notas."
  - O verbo "obteriam" traz a terminação "-RIA-" (obte-RIA-m), que é a marca exclusiva do FUTURO DO PRETÉRITO DO INDICATIVO.

💡 REGRA DE CORRELAÇÃO VERBAL OBRIGATÓRIA:
Pretérito Imperfeito do Subjuntivo (-sse) SEMPRE faz par harmônico com o Futuro do Pretérito do Indicativo (-ria):
• "Se eu estudasse (-sse), passaria (-ria)!"
• "Se nós treinássemos (-sse), venceríamos (-ria)!"''',
    ),
    QuestaoModel(
      id: 311,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Morfossintaxe do SE',
      enunciado: 'Em "Constatou-se a irregularidade nos livros contábeis", a partícula "se" atua como índice de indeterminação do sujeito.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'ERRADO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: ERRADO

🔍 O FAMOSO DUELO: PARTÍCULA APASSIVADORA (PA) VS ÍNDICE DE INDETERMINAÇÃO DO SUJEITO (IIS):
Para nunca mais errar essa questão no Cebraspe ou na AOCP:
1. Identifique a Transitividade do Verbo:
   • O verbo é "constatar". Quem constata, constata algo (Verbo Transitivo Direto - VTD).
2. Aplique a Regra de Ouro:
   • Verbo Transitivo Direto (VTD) + SE = O "SE" é PARTÍCULA APASSIVADORA (Pronome Apassivador)!
   • O elemento que parece objeto direto é, na verdade, o SUJEITO PACIENTE da oração.
   • Prova Real (Voz Passiva Analítica): "A irregularidade [Sujeito] foi constatada [Locução Passiva] nos livros contábeis."
3. E se fosse para o plural?
   • A concordância seria obrigatória: "Constataram-se as irregularidades" (As irregularidades foram constatadas).

Quando o "SE" seria Índice de Indeterminação do Sujeito (IIS)?
• Somente com Verbo Transitivo Indireto (VTI), Verbo Intransitivo (VI) ou Verbo de Ligação (VL), ficando o verbo OBRIGATORIAMENTE fixado na 3ª pessoa do singular (ex: "Precisa-se de agentes", "Vive-se bem aqui").''',
    ),
    QuestaoModel(
      id: 312,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Preposições e Valores Semânticos',
      enunciado: 'Em "O policial defendeu a comunidade COM bravura", a preposição "com" introduz circunstância de:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Companhia.',
        'B': 'Instrumento.',
        'C': 'Modo.',
        'D': 'Causa.',
        'E': 'Conformidade.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (Modo)

🔍 VALORES SEMÂNTICOS DA PREPOSIÇÃO "COM":
A preposição "com" é riquíssima em nuances circunstanciais. Veja como diferenciar com precisão cirúrgica:
• Modo: Responde à pergunta "De que maneira / Como a ação foi realizada?". Na frase: Como o policial defendeu a comunidade? "Com bravura" (= bravamente, de modo bravo). Trata-se de Adjunto Adverbial de Modo.
• Companhia (Alternativa A): Exige coparticipante humano na conduta: "O policial patrulhou as ruas com o sargento."
• Instrumento (Alternativa B): Refere-se à ferramenta, arma ou meio físico utilizado na execução do ato: "O policial rompeu o obstáculo com um aríete."
• Causa (Alternativa D): Representa o motivo originador: "Tremia com o frio intenso da madrugada."
• Conformidade (Alternativa E): Traduz acordo com norma: "Agiu de acordo com o regulamento."''',
    ),
    QuestaoModel(
      id: 313,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Pronomes Demonstrativos',
      enunciado: 'O pronome "este" (e suas variações) é empregado para fazer referência a algo que ainda será dito no texto (catáfora), enquanto "esse" refere-se a algo imediatamente mencionado antes (anáfora).',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 EMPREGO TEXTUAL (ENDOFÓRICO) DOS DEMONSTRATIVOS:
No interior do texto, os pronomes demonstrativos exercem funções coesivas rigorosamente catalogadas na gramática normativa:
1. "ESTE / ESTA / ISTO" (Função Catafórica):
   • Aponta para uma informação nova, que será revelada logo a seguir.
   • Exemplo: "O lema da tropa é ESTE: servir e proteger com coragem." (O lema ainda vai ser lido após os dois-pontos).
2. "ESSE / ESSA / ISSO" (Função Anafórica):
   • Resgata uma informação, conceito ou fato que acabou de ser exposto nas linhas anteriores.
   • Exemplo: "A disciplina é o alicerce da corporação. Sem ESSA base, as instituições ruem." ("ESSA base" resgata a palavra "disciplina" dita antes).

💡 MACETE CRAVOU:
• ESSE (com dois "S") = Olha para o PASSADO do texto (anáfora).
• ESTE (com "T") = Aponta para o FUTURO do texto (catáfora).''',
    ),
    QuestaoModel(
      id: 314,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Conjunções Coordenativas',
      enunciado: 'A conjunção "pois", quando colocada depois do verbo da oração (posposta), possui valor estritamente conclusivo.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 A REGRA DE OURO DA CONJUNÇÃO "POIS":
A posição sintática do vocábulo "pois" altera completamente o seu valor lógico-semântico na oração coordenada:
1. "POIS" ANTEPOSTO AO VERBO (Antes do verbo):
   • Classificação: Conjunção Coordenativa Explicativa (ou Subordinativa Causal).
   • Sentido: Porque, visto que, já que.
   • Exemplo: "Não avance na escuridão, POIS há perigo iminente." (Explicação).
2. "POIS" POSPOSTO AO VERBO (Depois do verbo, isolado entre vírgulas):
   • Classificação: Conjunção Coordenativa Conclusiva.
   • Sentido: Portanto, por conseguinte, logo.
   • Exemplo: "O candidato treinou intensamente todos os dias; será, POIS, convocado para o curso de formação." (Conclusão lógica inquestionável).

Portanto, o item expressa um dos axiomas gramaticais mais consagrados em concursos públicos.''',
    ),
    QuestaoModel(
      id: 315,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Artigo Definido e Indefinido',
      enunciado: 'O emprego do artigo indefinido antes de substantivo próprio, como em "Ele pensa que é um Sherlock Holmes da perícia", produz efeito semântico de aproximação estilística ou comparação figurada.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 VALOR ESTILÍSTICO DO ARTIGO INDEFINIDO:
Gramaticalmente, substantivos próprios (nomes de pessoas, cidades, marcas) dispensam o artigo indefinido, pois já possuem referente único e determinado no mundo.
• Quando o falante deliberadamente antepõe um artigo indefinido ("um Sherlock Holmes", "uma Maria Bonita", "um Pelé"), ocorre um fenômeno semântico de metaplasmo ou personificação comparativa:
  - O nome próprio converte-se simbolicamente em um substantivo comum de valor qualitativo;
  - Significa: "alguém dotado das qualidades, habilidades investigativas ou traços notáveis daquele personagem".
• O item define essa nuance com perfeita precisão estilística e gramatical.''',
    ),
  ],
);

