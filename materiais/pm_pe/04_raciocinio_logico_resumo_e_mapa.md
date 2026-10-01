# 🔢 RACIOCÍNIO LÓGICO E MATEMÁTICA - PM-PE (SOLDADO)
## Cronograma Oficial do Edital • Método Tático CRAVOU
### Fonte de Referência: Aulas Demonstrativas Estratégia Concursos & Edital Instituto AOCP

---

## 1. ESTRUTURA LÓGICA E CONECTIVOS (TABELA-VERDADE)
- **Proposição**: Sentença declarativa (com sujeito e verbo) que pode ser classificada exclusivamente como VERDADEIRA (V) ou FALSA (F).
  - *NÃO são proposições*: Perguntas (interrogativas), ordens (imperativas), exclamações e frases abertas sem valor definido (*"Ele é um bom soldado"*).
- **Os 5 Conectivos Fundamentais da Prova AOCP**:
  1. **Conjunção ("E" - $\land$)**: Só é VERDADEIRA se **todas** forem verdadeiras. Basta uma mentira para tudo ser falso.
  2. **Disjunção Inclusiva ("OU" - $\lor$)**: Só é FALSA se **todas** forem falsas. Basta uma verdade para salvar a proposição.
  3. **Disjunção Exclusiva ("OU... OU" - $\underline{\lor}$)**: Só é VERDADEIRA se os valores forem **diferentes** (ou um, ou outro, nunca ambos).
  4. **Condicional ("SE... ENTÃO" - $\to$)**: Só é FALSA no caso **VERA FISCHER** ($V \to F = F$). Em todos os outros casos, é VERDADEIRA!
  5. **Bicondicional ("SE E SOMENTE SE" - $\leftrightarrow$)**: Só é VERDADEIRA se os valores lógicos forem **iguais** ($V \leftrightarrow V = V$ e $F \leftrightarrow F = V$).

---

## 2. NEGAÇÕES LÓGICAS E EQUIVALÊNCIAS CAMPEÃS DE PROVA
- **Negação de Proposições Compostas**:
  - *Leis de De Morgan*:
    - $\sim(P \land Q) \equiv \sim P \lor \sim Q$ (Nega o primeiro, troca E por OU, nega o segundo).
    - $\sim(P \lor Q) \equiv \sim P \land \sim Q$ (Nega o primeiro, troca OU por E, nega o segundo).
  - *Negação do Condicional (Mnemônico do MANÉ)*:
    - $\sim(P \to Q) \equiv P \land \sim Q$
    - **MA**ntém o primeiro **NÉ**ga o segundo (e troca o condicional por "E").
- **Equivalências do Condicional ($P \to Q$)**:
  1. *Contrapositiva (Inverte e Nega)*:
     - $P \to Q \equiv \sim Q \to \sim P$
     - Exemplo: *"Se o candidato estuda, então é aprovado" $\equiv$ "Se o candidato NÃO foi aprovado, então NÃO estudou"*.
  2. *Equivalência com OU (Mnemônico do NEYMAR)*:
     - $P \to Q \equiv \sim P \lor Q$
     - **NE**ga o primeiro, coloca **OU**, **MA**ntém o segundo.

---

## 3. QUANTIFICADORES LÓGICOS (TODO, ALGUM, NENHUM)
- **Negação do "TODO" (Mnemônico PEA + NÃO)**:
  - Para negar "Todo policial é honesto", você precisa provar que **pelo menos um não é**:
  - **P**elo menos um policial **NÃO** é honesto; OU
  - **E**xiste policial que **NÃO** é honesto; OU
  - **A**lgum policial **NÃO** é honesto.
  - CUIDADO com a pegadinha da banca: NUNCA negue "Todo" com "Nenhum"! Dizer *"Nenhum policial é honesto"* é uma extrapolação errada.
- **Negação do "NENHUM"**:
  - "Nenhum soldado dorme em serviço" $\to$ Negação: *"Pelo menos um soldado dorme em serviço"* (ou *"Algum soldado dorme em serviço"*).

---

## 4. ANÁLISE COMBINATÓRIA E PROBABILIDADE TÁTICA
- **Arranjo vs. Combinação (O Teste da Ordem)**:
  - Mude a ordem dos elementos no grupo. A ordem alterou o resultado?
  - **SIM** $\to$ **Arranjo** (ou Princípio Multiplicativo). Ex.: Senhas, pódios, cargos diferenciados (Comandante e Subcomandante).
  - **NÃO** $\to$ **Combinação**. Ex.: Equipes, comissões, patrulhas, grupos de trabalho.
    - Fórmula da Combinação: $C_{n,p} = \frac{n!}{p!(n-p)!}$
- **Probabilidade Básica**:
  - $P(A) = \frac{\text{Casos Favoráveis (o que eu quero)}}{\text{Casos Possíveis (total de possibilidades)}}$

---

## 🧠 MAPA MENTAL TÁTICO CRAVOU - RACIOCÍNIO LÓGICO

```
                          ┌─────────────────────────────────────────────────────────┐
                          │             RACIOCÍNIO LÓGICO & MATEMÁTICA              │
                          └────────────────────────────┬────────────────────────────┘
                                                       │
         ┌──────────────────────────────┬──────────────┴──────────────┬──────────────────────────────┐
         │                              │                             │                              │
┌────────▼────────────────┐ ┌───────────▼───────────┐ ┌───────────────▼─────────────┐ ┌──────────────▼─────────────┐
│ CONECTIVOS EM PROVA     │ │ NEGAÇÃO DO SE... ENTÃO│ │ EQUIVALÊNCIAS CONDICIONAL   │ │ COMBINAÇÃO VS ARRANJO       │
├─────────────────────────┤ ├───────────────────────┤ ├─────────────────────────────┤ ├─────────────────────────────┤
│ • E: Só V se tudo for V │ │ • Mnemônico do MANÉ   │ │ • Contrapositiva: Inverte   │ │ • Ordem importa?            │
│ • OU: Só F se tudo for F│ │ • MAntém o primeiro   │ │   e nega tudo (~Q -> ~P)    │ │   SIM = Arranjo / P.M       │
│ • SE...ENTÃO: Só é F em │ │ • NÉga o segundo      │ │ • Regra do NEYMAR (~P v Q): │ │   NÃO = Combinação (Equipe) │
│   Vera Fischer (V -> F) │ │ • Troca a seta por E  │ │   NEga 1º + OU + Mantém 2º  │ │ • Probabilidade:            │
│ • Bicondicional: Iguais │ │   ~(P -> Q) = P ^ ~Q  │ │ • Todo nega com P.E.A + NÃO │ │   Favoráveis / Total        │
└─────────────────────────┘ └───────────────────────┘ └─────────────────────────────┘ └─────────────────────────────┘
```

---

## 🎯 BATERIA DE QUESTÕES COMENTADAS (ESTILO INSTITUTO AOCP - PM-PE)

### Questão 01 (Instituto AOCP - PM-PE)
Considere a proposição condicional: "Se a viatura estiver abastecida, então os policiais realizarão a ronda ostensiva". A negação lógica dessa proposição é:
- A) A viatura não está abastecida e os policiais não realizam a ronda ostensiva.
- B) Se a viatura não estiver abastecida, então os policiais não realizarão a ronda ostensiva.
- C) A viatura está abastecida e os policiais não realizam a ronda ostensiva.
- D) A viatura não está abastecida ou os policiais realizam a ronda ostensiva.
- E) Os policiais realizam a ronda ostensiva se, e somente se, a viatura estiver abastecida.
**Gabarito Oficial: C**
*Comentário Didático CRAVOU: C é a correta. Aplicação direta da Regra do MANÉ: Mantém a primeira ("A viatura está abastecida"), troca o condicional por E ("e"), e Nega a segunda ("os policiais não realizam a ronda").*

### Questão 02 (Instituto AOCP - PM-PE)
A afirmação equivalente à proposição "Se o suspeito confessar o crime, então receberá atenuação da pena" é:
- A) Se o suspeito não confessar o crime, então não receberá atenuação da pena.
- B) Se o suspeito não recebeu atenuação da pena, então ele não confessou o crime.
- C) O suspeito confessou o crime e não recebeu atenuação da pena.
- D) O suspeito não confessa o crime se receber a atenuação da pena.
- E) Ou o suspeito confessa o crime, ou ele não recebe a atenuação da pena.
**Gabarito Oficial: B**
*Comentário Didático CRAVOU: B é a correta. Contrapositiva perfeita: $P \to Q \equiv \sim Q \to \sim P$. Invertem-se os termos negando ambos: "Se NÃO recebeu atenuação, então NÃO confessou".*
