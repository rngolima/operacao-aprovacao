# 📐 RACIOCÍNIO LÓGICO MATEMÁTICO COMPLETO - POLÍCIA MILITAR DE PERNAMBUCO (SOLDADO)
## Edital Oficial Portaria Conjunta SAD/SDS nº 299/2026 e Portaria nº 83/2023 • Instituto AOCP
### Método Tático CRAVOU • 100% dos Tópicos do Edital

---

## 1. ESTRUTURAS LÓGICAS, CONECTIVOS & TABELAS-VERDADE

### 1.1 Proposições Lógicas Simples e Compostas
- **Conceito de Proposição**: Frase declarativa que possui sentido completo e aceita apenas um valor lógico: **VERDADEIRO (V)** ou **FALSO (F)**.
- **Princípios Fundamentais**:
  - *Identidade*: O que é verdadeiro é verdadeiro; o que é falso é falso.
  - *Não Contradição*: Uma proposição não pode ser verdadeira e falsa ao mesmo tempo.
  - *Terceiro Excluído*: Uma proposição ou é verdadeira ou é falsa; não há uma terceira opção.
- **NÃO são Proposições Lógicas (Pegadinhas AOCP)**:
  - Frases interrogativas (*"O suspeito fugiu?"*);
  - Frases exclamativas (*"Que operação policial excelente!"*);
  - Frases imperativas (*"Soldado, apresente-se à guarda!"*);
  - Sentenças abertas com incógnitas (*"Ele é um criminoso perigoso"* ou *"x + 5 = 12"* - sem valor determinado para a variável).

### 1.2 Os 5 Conectivos Lógicos e a Tabela-Verdade Tática
| Conectivo | Operação Lógica | Símbolo | Regra de Ouro CRAVOU | Exemplo Prático |
| :--- | :--- | :---: | :--- | :--- |
| **"E"** | Conjunção | ^ | **Só é VERDADE se AMBAS forem verdadeiras**! Um falso contamina tudo. | V ^ V = V |
| **"OU"** | Disjunção Inclusiva | v | **Só é FALSA se AMBAS forem falsas**! Uma verdade salva tudo. | F v F = F |
| **"OU... OU"**| Disjunção Exclusiva | v_ | **Só é VERDADE se os valores forem DIFERENTES** (um V e um F). | V v_ F = V |
| **"SE... ENTÃO"**| Condicional | -> | **Só é FALSA na hipótese VERA FISCHER (V -> F = F)**! Em todos os outros casos, é Verdadeira! | V -> F = F |
| **"SE E SOMENTE SE"**| Bicondicional | <-> | **Só é VERDADE se os valores forem IGUAIS** (V e V ou F e F). | V <-> V = V / F <-> F = V |

---

## 2. NEGAÇÕES, EQUIVALÊNCIAS & QUANTIFICADORES LÓGICOS

### 2.1 Leis de De Morgan (Negação de Conjunções e Disjunções)
- **Negação do "E"**: Troca o E por OU e nega ambas as partes.
  - ~(P ^ Q) ≡ ~P v ~Q.
  - *Exemplo*: *"O soldado estuda e passa"* -> Negação: *"O soldado NÃO estuda OU NÃO passa"*.
- **Negação do "OU"**: Troca o OU por E e nega ambas as partes.
  - ~(P v Q) ≡ ~P ^ ~Q.
  - *Exemplo*: *"O carro é azul ou a moto é preta"* -> Negação: *"O carro NÃO é azul E a moto NÃO é preta"*.

### 2.2 Negação da Condicional (Mnemônico do MANÉ)
> Para negar "Se P, então Q", você **MANTÉM a 1ª E NEGA a 2ª**!
- ~(P -> Q) ≡ P ^ ~Q.
- *Exemplo*: *"Se o policial treina, então é promovido"* -> Negação: *"O policial treina E NÃO é promovido"*.

### 2.3 Equivalências Lógicas do Condicional (Contrapositiva e NEYMAR)
1. **Contrapositiva (Inverte e Nega Tudo)**:
   - P -> Q ≡ ~Q -> ~P.
   - *Exemplo*: *"Se chove, a viatura molha"* equivale a *"Se a viatura NÃO molhou, NÃO choveu"*.
2. **Regra do NEYMAR (Equivalência da Condicional com o "OU")**:
   - P -> Q ≡ ~P v Q.
   - **NE**ga a primeira, coloca **OU**, e **MA**ntém a segunda.

### 2.4 Negação dos Quantificadores Lógicos (Todo, Algum, Nenhum)
- **Regra de Ouro**: Para negar o universal "TODO", você precisa de **pelo menos um contraexemplo** (Mnemônico **P.E.A + NÃO**):
  - **P**elo menos um... NÃO;
  - **E**xiste um... que NÃO;
  - **A**lgum... NÃO.
- *Pegadinha Mortal da Banca AOCP*: NUNCA negue "Todo" dizendo "Nenhum"! A negação de *"Todo policial é honesto"* é *"Pelo menos um policial NÃO é honesto"* (e JAMAIS *"Nenhum policial é honesto"*).

---

## 3. LÓGICA DE ARGUMENTAÇÃO & DIAGRAMAS LÓGICOS (CONJUNTOS)

### 3.1 Argumentos Válidos e Falácias
- Um argumento é composto por **Premissas** e uma **Conclusão**.
- **Validade do Argumento**: Um argumento é **VÁLIDO** quando é impossível que todas as premissas sejam verdadeiras e a conclusão seja falsa ao mesmo tempo.
- Não confunda *validade lógica* com *verdade factual*. A validade depende estritamente da estrutura do raciocínio.

### 3.2 Diagramas de Venn e Problemas de Conjuntos
- Relações entre conjuntos:
  - *Todo A é B*: Conjunto A está totalmente contido no conjunto B (A ⊂ B).
  - *Nenhum A é B*: Conjuntos A e B são disjuntos (interseção vazia: A ∩ B = ∅).
  - *Algum A é B*: Há pelo menos um elemento na interseção (A ∩ B ≠ ∅).
- **Fórmula da União de Dois Conjuntos**:
  - n(A ∪ B) = n(A) + n(B) - n(A ∩ B).
  - *Problema Policial Clássico*: Numa delegacia de 50 policiais, 30 têm porte de fuzil e 25 têm treinamento de choque. Se 10 têm ambos, quantos não têm nenhum?
    - n(A ∪ B) = 30 + 25 - 10 = 45 policiais têm pelo menos uma habilitação.
    - Policiais sem nenhuma: 50 - 45 = **5 policiais**.

---

## 4. ANÁLISE COMBINATÓRIA & PROBABILIDADE (OFICIAL PM-PE)

### 4.1 Princípio Fundamental da Contagem (Princípio Multiplicativo)
- Se uma decisão $D_1$ pode ser tomada de $n_1$ maneiras e uma decisão $D_2$ de $n_2$ maneiras, o número total de possibilidades para tomar ambas sucessivamente é $n_1 \times n_2$.

### 4.2 Permutações, Arranjos e Combinações (A Pergunta de Ouro)
> **A ordem dos elementos importa?**
1. **Se a ordem IMPORTA -> ARRANJO ou PERMUTAÇÃO**:
   - Senhas bancárias, placas de viatura, premiações (1º, 2º e 3º lugar), cargos distintos (Comandante e Subcomandante).
   - *Fórmula do Arranjo*: $A(n, p) = \frac{n!}{(n - p)!}$.
   - *Permutação Simples*: Todos os elementos são reorganizados: $P_n = n!$.
2. **Se a ordem NÃO IMPORTA -> COMBINAÇÃO**:
   - Equipes de patrulha, comissões de sindicância, grupos de trabalho, sorteios de loteria.
   - *Fórmula da Combinação*: $C(n, p) = \frac{n!}{p!(n - p)!}$.
   - *Exemplo PM-PE*: De um grupo de 8 soldados, quantos grupos de 3 soldados podem ser formados para uma ronda?
     - Ordem não altera a equipe -> Combinação: $C(8, 3) = \frac{8 \times 7 \times 6}{3 \times 2 \times 1} = \mathbf{56\ equipes}$.

### 4.3 Probabilidade Clássica e Regra da Multiplicação
- **Definição de Probabilidade**:
  $$P(A) = \frac{\text{Número de casos favoráveis}}{\text{Número total de casos possíveis (Espaço Amostral)}}.$$
- **Eventos Independentes (Regra do "E" -> Multiplica)**:
  - $P(A \cap B) = P(A) \times P(B)$.
- **Eventos Mutuamente Excludentes (Regra do "OU" -> Soma)**:
  - $P(A \cup B) = P(A) + P(B)$.

---

## 🧠 MAPA MENTAL INTEGRADO - RACIOCÍNIO LÓGICO PM-PE

```
                          ┌─────────────────────────────────────────────────────────┐
                          │         RACIOCÍNIO LÓGICO MATEMÁTICO - PM-PE            │
                          └────────────────────────────┬────────────────────────────┘
                                                       │
         ┌──────────────────────────────┬──────────────┴──────────────┬──────────────────────────────┐
         │                              │                             │                              │
┌────────▼────────────────┐ ┌───────────▼───────────┐ ┌───────────────▼─────────────┐ ┌──────────────▼─────────────┐
│ TABELA-VERDADE          │ │ NEGAÇÃO & EQUIVALÊNCIA│ │ CONJUNTOS & VENN            │ │ COMBINATÓRIA & PROBABILIDADE │
├─────────────────────────┤ ├───────────────────────┤ ├─────────────────────────────┤ ├─────────────────────────────┤
│• E: Só V se tudo for V  │ │• Negação Se...Então:  │ │• Diagrama de Venn:          │ │• A ordem importa?           │
│• OU: Só F se tudo for F │ │  MANÉ (P ^ ~Q)        │ │  União = A + B - Interseção │ │  - SIM: Arranjo / Permutação│
│• Se..Então: Vera Fischer│ │• Negação do TODO:     │ │• Todo A é B: Contido        │ │  - NÃO: Combinação          │
│  (V -> F = F)           │ │  P.E.A + NÃO          │ │• Nenhum A é B: Disjuntos    │ │• Probabilidade = Fav / Total│
│• Bicond: Iguais dão V   │ │• Contrapositiva: Invert│ │• Lógica de Argumento Válido │ │• Regra do E: Multiplica     │
└─────────────────────────┘ └───────────────────────┘ └─────────────────────────────┘ └─────────────────────────────┘
```

---

## 🎯 BATERIA DE QUESTÕES OFICIAIS DO INSTITUTO AOCP

### Questão 01 (Instituto AOCP - Soldado PM-PE)
Assinale a alternativa que apresenta a negação lógica da proposição composta: "Se o soldado é aprovado no curso de formação, então ele recebe o porte de arma":
- A) Se o soldado não é aprovado no curso de formação, então ele não recebe o porte de arma.
- B) O soldado é aprovado no curso de formação e não recebe o porte de arma.
- C) O soldado não é aprovado no curso de formação ou recebe o porte de arma.
- D) Se o soldado recebe o porte de arma, então ele foi aprovado no curso de formação.
- E) O soldado não é aprovado no curso de formação e recebe o porte de arma.
**Gabarito Oficial: B**
*Comentário Didático CRAVOU: B está correta. Aplica-se a Regra do MANÉ: Mantém a primeira ("O soldado é aprovado no curso de formação") E Nega a segunda ("e não recebe o porte de arma").*

### Questão 02 (Instituto AOCP - Soldado PM-PE)
Um batalhão da Polícia Militar dispõe de 10 soldados para formar uma equipe de patrulhamento ostensivo composta por exatamente 4 soldados. De quantas maneiras distintas essa equipe de 4 soldados poderá ser escalada?
- A) 5.040 maneiras.
- B) 720 maneiras.
- C) 210 maneiras.
- D) 120 maneiras.
- E) 24 maneiras.
**Gabarito Oficial: C**
*Comentário Didático CRAVOU: C está correta. A ordem dos soldados na patrulha não altera a equipe, logo trata-se de uma Combinação Simples: $C(10, 4) = \frac{10 \times 9 \times 8 \times 7}{4 \times 3 \times 2 \times 1} = \frac{5.040}{24} = \mathbf{210\ maneiras}$.*
