import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import '../../models/mapa_mental_model.dart';

/// Aula 01 Oficial de Raciocínio Lógico e Matemática (Soldado PM-PE)
final aulaGuiaItemRlm01 = AulaGuiaItem(
  numero: '01',
  titulo: 'Proposições Lógicas, Conectivos, Tabela-Verdade, Leis de De Morgan e Regra do MANÉ',
  detalhes: '18 min • Método CRAVOU • 15 questões comentadas',
  concluida: false,
  destaque: true,
  conteudoTeorico: '''# RACIOCÍNIO LÓGICO TÁTICO: TABELA-VERDADE, NEGAÇÕES E EQUIVALÊNCIAS

## 1. O CONCEITO DE PROPOSIÇÃO E OS CONECTIVOS FUNDAMENTAIS
- **Proposição Lógica**: Frase declarativa que possui sentido completo e que pode ser valorada apenas como VERDADEIRA (V) ou FALSA (F), respeitando os princípios da Não Contradição e do Terceiro Excluído.
- **NÃO são Proposições**: Frases interrogativas, exclamativas, imperativas e sentenças abertas sem sujeito definido.
- **Tabela-Verdade dos Conectivos em Concursos**:
  1. *Conjunção ("E" - ^)*: Só é VERDADEIRA se AMBAS forem verdadeiras (V ∧ V = V).
  2. *Disjunção Inclusiva ("OU" - v)*: Só é FALSA se AMBAS forem falsas (F ∨ F = F).
  3. *Condicional ("SE... ENTÃO" - ->)*: Só é FALSA na hipótese VERA FISCHER (V → F = F). Em todos os outros casos, é VERDADEIRA!
  4. *Bicondicional ("SE E SOMENTE SE" - <->)*: É VERDADEIRA quando ambas tiverem valores iguais (V ↔ V = V e F ↔ F = V).

---

## 2. NEGAÇÃO DE PROPOSIÇÕES COMPOSTAS (DE MORGAN E MANÉ)
- **Leis de De Morgan**:
  - Negação do "E": Troca o E por OU e nega os dois lados.
    - ~(P ∧ Q) ≡ ~P ∨ ~Q.
  - Negação do "OU": Troca o OU por E e nega os dois lados.
    - ~(P ∨ Q) ≡ ~P ∧ ~Q.
- **Negação do Condicional (Mnemônico do MANÉ)**:
  - Para negar "Se P, então Q", você **MA**ntém o primeiro E **NÉ**ga o segundo!
  - ~(P → Q) ≡ P ∧ ~Q.
  - Exemplo: *"Se o soldado treina, então é promovido"* -> Negação: *"O soldado treina E NÃO é promovido"*.

---

## 3. EQUIVALÊNCIAS LÓGICAS DO CONDICIONAL (CONTRAPOSITIVA E NEYMAR)
1. **Contrapositiva (Inverte e Nega Tudo)**:
   - P → Q ≡ ~Q → ~P.
   - Exemplo: *"Se chove, a rua molha"* é equivalente a *"Se a rua NÃO molhou, NÃO choveu"*.
2. **Equivalência com o conectivo "OU" (Regra do NEYMAR)**:
   - P → Q ≡ ~P ∨ Q.
   - **NE**ga a primeira proposição, coloca **OU**, e **MA**ntém a segunda sem alterar.

---

## 4. QUANTIFICADORES LÓGICOS (TODO, ALGUM, NENHUM)
- **Regra de Ouro CRAVOU**: Para negar o quantificador universal "TODO", basta encontrar **pelo menos um contraexemplo** (Mnemônico P.E.A + NÃO):
  - **P**elo menos um... NÃO;
  - **E**xiste um... que NÃO;
  - **A**lgum... NÃO.
- CUIDADO com a pegadinha clássica da banca: NUNCA negue "Todo" dizendo "Nenhum"! Dizer *"Nenhum"* é um erro grotesco de extrapolação.

---

## 5. DIAGRAMAS LÓGICOS & CONJUNTOS DE VENN
- **Fórmula da União**: n(A ∪ B) = n(A) + n(B) - n(A ∩ B).
- **Relações de Pertinência**:
  - *Todo A é B*: Conjunto A totalmente inserido dentro de B (A ⊂ B).
  - *Nenhum A é B*: Conjuntos disjuntos sem nenhum ponto em comum.
  - *Algum A é B*: Interseção não vazia.

---

## 6. ANÁLISE COMBINATÓRIA & PROBABILIDADE
- **A Ordem Importa?**
  - **Se a ordem IMPORTA -> ARRANJO**: Senhas, filas, premiações, cargos distintos (Comandante e Subcomandante). Fórmula: A(n, p) = n! / (n - p)!
  - **Se a ordem NÃO IMPORTA -> COMBINAÇÃO**: Equipes de patrulha, grupos de policiais, comissões de ronda. Fórmula: C(n, p) = n! / [p!(n - p)!]
- **Probabilidade Clássica**:
  - P(A) = Casos Favoráveis / Casos Possíveis (Espaço Amostral).
  - Regra do "E": Eventos sucessivos/independentes -> MULTIPLICA as probabilidades.
  - Regra do "OU": Eventos alternativos -> SOMA as probabilidades.''',
  mapaMental: const MapaMentalData(
    titulo: 'RACIOCÍNIO LÓGICO: PROPOSIÇÕES E EQUIVALÊNCIAS',
    conceitoCentral: 'Tabela-Verdade dos 5 Conectivos, Regra do MANÉ para o Condicional e Leis de De Morgan.',
    regraDeOuro: 'Se...Então só é Falso na VERA FISCHER (V -> F). Para negar Se...Então: MANTÉM a 1ª E NEGA a 2ª (MANÉ)!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Tabela-Verdade',
        subtitulo: 'Regras de Ouro',
        corRamo: Color(0xFF6366F1),
        icone: Icons.table_chart,
        itens: [
          MapaMentalItem(
            titulo: 'Condicional (Se...Então)',
            descricao: 'Só é FALSA no caso Vera Fischer (V -> F = F).',
            mnemonico: 'Vera Fischer é Falsa!',
          ),
          MapaMentalItem(
            titulo: 'Conjunção e Disjunção',
            descricao: 'E: Só verdade se tudo for verdade. OU: Só falso se tudo for falso.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Negação do Condicional',
        subtitulo: 'Regra do MANÉ',
        corRamo: Color(0xFFDC2626),
        icone: Icons.close,
        itens: [
          MapaMentalItem(
            titulo: 'MANÉ',
            descricao: 'MAntém a primeira E NÉga a segunda.',
            mnemonico: '~(P -> Q) = P ^ ~Q',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Equivalências Lógicas',
        subtitulo: 'Contrapositiva e NEYMAR',
        corRamo: Color(0xFF10B981),
        icone: Icons.sync_alt,
        itens: [
          MapaMentalItem(
            titulo: 'Contrapositiva',
            descricao: 'Inverte as duas partes negando ambas.',
            mnemonico: 'P -> Q equivale a ~Q -> ~P',
          ),
          MapaMentalItem(
            titulo: 'Regra do NEYMAR',
            descricao: 'NEga a primeira + OU + Mantém a segunda (~P v Q).',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Quantificadores',
        subtitulo: 'Todo, Algum e Nenhum',
        corRamo: Color(0xFFF59E0B),
        icone: Icons.all_inclusive,
        itens: [
          MapaMentalItem(
            titulo: 'Negação do TODO',
            descricao: 'Pelo menos um NÃO / Algum NÃO / Existe um que NÃO.',
            mnemonico: 'P.E.A + NÃO (Nunca use Nenhum)',
          ),
        ],
      ),
    ],
  ),
  questoes: const [
    QuestaoModel(
      id: 701,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Raciocínio Lógico Matemático',
      assunto: 'Negação do Condicional',
      enunciado: 'A negação lógica da sentença condicional "Se o policial militar agir com bravura, então será condecorado com a medalha de mérito" é dada por:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Se o policial militar não agir com bravura, então não será condecorado.',
        'B': 'O policial militar age com bravura e não é condecorado com a medalha de mérito.',
        'C': 'O policial militar não age com bravura ou é condecorado com a medalha de mérito.',
        'D': 'Se o policial militar for condecorado, então ele agiu com bravura.',
        'E': 'O policial militar não age com bravura se e somente se for condecorado.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Regra do MANÉ)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• B) CORRETA. Para negar P → Q, aplicamos a Regra do MANÉ: Mantém a primeira ("O policial militar age com bravura") E Nega a segunda ("não é condecorado"). Fórmula: P ∧ ~Q.''',
    ),
    QuestaoModel(
      id: 702,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Raciocínio Lógico Matemático',
      assunto: 'Equivalência Lógica do Condicional',
      enunciado: 'Assinale a alternativa que apresenta uma proposição logicamente equivalente a: "Se a viatura está em patrulhamento, então a criminalidade diminui":',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Se a criminalidade diminui, então a viatura está em patrulhamento.',
        'B': 'A viatura não está em patrulhamento e a criminalidade não diminui.',
        'C': 'Se a criminalidade não diminui, então a viatura não está em patrulhamento.',
        'D': 'Ou a viatura está em patrulhamento, ou a criminalidade diminui.',
        'E': 'A criminalidade diminui se e somente se a viatura estiver na oficina.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (Contrapositiva)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• C) CORRETA. A contrapositiva inverte e nega ambos os termos: P → Q ≡ ~Q → ~P. Portanto: "Se a criminalidade NÃO diminui, então a viatura NÃO está em patrulhamento".''',
    ),
  ],
);

/// Acervo Oficial de Raciocínio Lógico da PM-PE
class RlmConteudoOficial {
  RlmConteudoOficial._();

  static final List<AulaGuiaItem> aulas = [
    aulaGuiaItemRlm01,
  ];

  static ModuloGuiaEstudo get moduloGuiaEstudo {
    return ModuloGuiaEstudo(
      id: 'rlm_pmpe',
      nome: 'Raciocínio Lógico Matemático (Oficial PM-PE)',
      icone: '📐',
      corBadge: const Color(0xFF6366F1),
      totalAulas: aulas.length,
      totalQuestoes: aulaGuiaItemRlm01.questoes?.length ?? 15,
      aulas: aulas,
    );
  }
}
