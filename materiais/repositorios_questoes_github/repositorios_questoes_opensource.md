# 📚 Guia de Repositórios Open Source e Datasets de Questões (2022 - 2026)

Este documento cataloga os principais repositórios open source, APIs abertas e datasets jurídicos/de concursos públicos disponíveis no GitHub e Hugging Face, com foco em atualização (2022 em diante), licença livre para integração no ecossistema do **CRAVOU**.

---

## 1. Repositórios Open Source no GitHub

### 1.1 `rodrigoborgesmachado/questoesConcursos`
- **Link:** [https://github.com/rodrigoborgesmachado/questoesConcursos](https://github.com/rodrigoborgesmachado/questoesConcursos)
- **Tecnologia:** React + .NET 8 + C# + PostgreSQL
- **Descrição:** Plataforma open source moderna para prática de questões, com suporte a filtros por banca, disciplina e assunto.
- **Utilidade para o CRAVOU:** Modelo relacional de banco de dados para questões, alternativas, gabaritos e resolução de simulados.

### 1.2 `VictorGM01/controle_de_questoes`
- **Link:** [https://github.com/VictorGM01/controle_de_questoes](https://github.com/VictorGM01/controle_de_questoes)
- **Tecnologia:** Python / Django / SQLite
- **Descrição:** Aplicação para rastreamento de taxa de acerto, tempo por questão e métricas de desempenho por disciplina.
- **Utilidade para o CRAVOU:** Algoritmo de cálculo de tempo médio e recomendação de revisão.

### 1.3 `gabriel-antonelli/extract-enem-data`
- **Link:** [https://github.com/gabriel-antonelli/extract-enem-data](https://github.com/gabriel-antonelli/extract-enem-data)
- **Tecnologia:** Python (BeautifulSoup, PDFPlumber, PyPDF2)
- **Descrição:** Scripts automatizados de extração e parsing de provas oficiais em PDF, transformando cadernos de questões em JSON estruturado com alternativas e gabaritos.
- **Utilidade para o CRAVOU:** Pipeline reutilizável para processar cadernos de provas do Cebraspe e Instituto AOCP.

### 1.4 `ebsiqueira/Poo2` (Acervo Público de Concursos)
- **Link:** [https://github.com/ebsiqueira/Poo2](https://github.com/ebsiqueira/Poo2)
- **Descrição:** Compilação de links públicos, provas e cadernos de 1001 questões comentadas de Direito Constitucional, Penal e Administrativo para certames federais e estaduais.

---

## 2. Datasets de Questões e Raciocínio Jurídico (Hugging Face)

### 2.1 `maritaca-ai/oab-bench` & `felipeoes/oab_bench`
- **Links:** 
  - [https://huggingface.co/datasets/maritaca-ai/oab-bench](https://huggingface.co/datasets/maritaca-ai/oab-bench)
  - [https://huggingface.co/datasets/felipeoes/oab_bench](https://huggingface.co/datasets/felipeoes/oab_bench)
- **Conteúdo:** Centenas de questões de múltipla escolha recentes (2022 a 2024) cobrindo **Direito Penal, Direito Constitucional e Direito Administrativo**, estruturadas em formato JSON/Parquet com gabarito oficial fundamentado.
- **Licença:** Aberta para pesquisa e uso educacional.

### 2.2 `celsowm/legal_br_sft`
- **Link:** [https://huggingface.co/datasets/celsowm/legal_br_sft](https://huggingface.co/datasets/celsowm/legal_br_sft)
- **Conteúdo:** Casos práticos, fundamentação jurídica em artigos de lei (Código Penal, CF/88, Leis Especiais) e raciocínio analítico aplicado.
- **Utilidade para o CRAVOU:** Alimentação do motor do Professor CRAVOU AI para gerar justificativas e destrinchar alternativas erradas.

---

## 3. Fontes Oficiais de Questões Públicas (Bancas Policiais)

As bancas examinadoras publicam oficialmente os cadernos de provas e gabaritos definitivos que são de **domínio público e livre reprodução** para fins pedagógicos (conforme Lei de Direitos Autorais 9.610/98, Art. 8º, IV):
- **Cebraspe (Cespe/UnB):** Portal de Concursos Realizados (PC-PE, PM-AL, PC-DF, PRF, PF).
- **Instituto AOCP:** Concursos Realizados (PM-PE 2024, CBM-PE 2024, PC-GO).
- **FGV Conhecimento:** Provas Policiais (PM-SP, PC-AM).

---

## 4. Script Utilitário para Importação Local (JSON)

Na pasta `scripts/`, disponibilizamos o script `importador_questoes_json.py` para carregar questões de repositórios em lote diretamente para o banco de dados do CRAVOU.
