# 💻 NOÇÕES DE INFORMÁTICA - PM-PE (SOLDADO)
## Cronograma Oficial do Edital • Método Tático CRAVOU
### Fonte de Referência: Aulas Demonstrativas Estratégia Concursos & Edital Instituto AOCP

---

## 1. HARDWARE E SISTEMAS OPERACIONAIS (WINDOWS 10/11 & LINUX)
- **Hierarquia de Memórias (Velocidade vs Capacidade)**:
  - Mais rápida e mais cara: Registradores da CPU $\to$ Memória Cache (L1, L2, L3) $\to$ Memória Principal (RAM - volátil, perde dados ao desligar) $\to$ Memórias Secundárias (SSD NVMe, HD, Pendrive - não voláteis).
  - **Memória ROM**: Memória de leitura, não volátil, que grava o BIOS/UEFI e o POST (rotina de autoteste ao ligar a máquina).
- **Atalhos Clássicos do Windows 10/11 em Concursos**:
  - `Win + L`: Bloqueia o computador imediatamente (*Lock*).
  - `Win + D`: Minimiza todas as janelas e exibe a Área de Trabalho (*Desktop*).
  - `Win + Shift + S`: Ferramenta de Captura de tela recortada.
  - `Ctrl + Shift + Esc`: Abre direto o Gerenciador de Tarefas (sem passar pela tela de segurança do Ctrl+Alt+Del).
- **Comandos Essenciais do Terminal Linux**:
  - `pwd`: Exibe o diretório atual de trabalho (*Print Working Directory*).
  - `ls`: Lista arquivos e pastas (com `-l` mostra permissões e detalhes).
  - `cd`: Navega entre diretórios.
  - `mkdir`: Cria novo diretório.
  - `rm -rf`: Remove arquivos/diretórios recursivamente forçado.
  - `chmod`: Altera as permissões de acesso (leitura `r`, escrita `w`, execução `x`).
  - `grep`: Busca por padrões de texto dentro de arquivos.

---

## 2. SUÍTE DE ESCRITÓRIO: MS OFFICE (WORD/EXCEL) VS LIBREOFFICE (WRITER/CALC)
- **Formatos Nativos de Arquivo**:
  - Processador de Texto: Word = `.docx` | LibreOffice Writer = `.odt` (OpenDocument Text).
  - Planilha Eletrônica: Excel = `.xlsx` | LibreOffice Calc = `.ods` (OpenDocument Spreadsheet).
- **Fórmulas Matemáticas e Lógicas em Planilhas**:
  - `=SOMA(A1:A5)`: Soma de A1 até A5 (os dois pontos indicam intervalo contínuo).
  - `=SOMA(A1;A5)`: Soma apenas a célula A1 E a célula A5 (ponto e vírgula separa elementos).
  - `=MÉDIA(A1:A5)`: Média aritmética das células.
  - `=SE(teste_lógico; valor_se_verdadeiro; valor_se_falso)`: Condicional.
  - `=PROCV(valor_procurado; matriz_tabela; número_índice_coluna; [procurar_intervalo])`: Busca vertical na primeira coluna da tabela.

---

## 3. REDES DE COMPUTADORES, INTERNET E PROTOCOLOS
- **Classificação por Abrangência Geográfica**:
  - `PAN`: Rede pessoal (Bluetooth até ~10 metros).
  - `LAN`: Rede local (computadores do quartel, residência, escritório).
  - `MAN`: Rede metropolitana (conecta batalhões dentro da Região Metropolitana do Recife).
  - `WAN`: Rede de longa distância (conecta estados, países ou a Internet global).
- **Protocolos da Pilha TCP/IP em Provas**:
  - `HTTP` (Porta 80): Navegação web sem criptografia.
  - `HTTPS` (Porta 443): Navegação web segura com protocolo SSL/TLS.
  - `DNS` (Porta 53): Converte nomes de domínio em endereços IP legíveis (ex.: www.pm.pe.gov.br $\to$ 177.x.x.x).
  - `DHCP`: Atribui automaticamente endereços IP dinâmicos aos dispositivos que conectam à rede.
  - `SMTP` (Porta 587): Envio de correio eletrônico (*Sua Mensagem Tá Partindo*).
  - `IMAP` (Porta 143/993): Recebimento de e-mails com **sincronização no servidor** (mensagens continuam disponíveis na nuvem).
  - `POP3` (Porta 110/995): Recebimento de e-mails com **download e remoção do servidor** para a máquina local.

---

## 4. SEGURANÇA DA INFORMAÇÃO E AMEAÇAS VIRTUAIS
- **Princípios Básicos (Mnemônico CIDAN)**:
  - **C**onfidencialidade: Acesso apenas por pessoas autorizadas (garantida por criptografia).
  - **I**ntegridade: Proteção contra alteração não autorizada (garantida por Hash criptográfico).
  - **D**isponibilidade: Sistema acessível sempre que necessário (garantida por backups e no-breaks).
  - **A**utenticidade: Confirmação da identidade do emissor (garantida por certificados digitais).
  - **N**ão Repúdio (Irretratabilidade): Impossibilidade de o autor negar a autoria de uma ação praticada.
- **Principais Pragas Virtuais (Malwares)**:
  - *Ransomware*: Código malicioso que **criptografa os arquivos da vítima** e exige pagamento de resgate (geralmente em criptomoedas) para liberar a chave de decodificação.
  - *Phishing*: Técnica de engenharia social que utiliza e-mails, SMS ou sites falsos idênticos aos oficiais para induzir a vítima a fornecer senhas bancárias ou dados sigilosos.
  - *Worm*: Propaga-se de forma **automática** pela rede explorando vulnerabilidades, sem precisar infectar arquivos hospedeiros.
  - *Trojan (Cavalo de Troia)*: Programa aparentemente inofensivo (jogo, utilitário) que, ao ser executado, abre portas de comunicação para invasores (*Backdoor*).

---

## 🧠 MAPA MENTAL TÁTICO CRAVOU - NOÇÕES DE INFORMÁTICA

```
                          ┌─────────────────────────────────────────────────────────┐
                          │             NOÇÕES DE INFORMÁTICA (PM-PE)               │
                          └────────────────────────────┬────────────────────────────┘
                                                       │
         ┌──────────────────────────────┬──────────────┴──────────────┬──────────────────────────────┐
         │                              │                             │                              │
┌────────▼────────────────┐ ┌───────────▼───────────┐ ┌───────────────▼─────────────┐ ┌──────────────▼─────────────┐
│ HARDWARE & SISTEMAS     │ │ SUÍTE DE ESCRITÓRIO   │ │ REDES & PROTOCOLOS          │ │ SEGURANÇA DA INFORMAÇÃO     │
├─────────────────────────┤ ├───────────────────────┤ ├─────────────────────────────┤ ├─────────────────────────────┤
│ • RAM: Volátil (trabalho│ │ • Word: .docx         │ │ • HTTPS: Porta 443 (SSL/TLS)│ │ • Princípios C.I.D.A.N      │
│ • ROM: Não volátil(BIOS)│ │ • Writer: .odt        │ │ • DNS: Converte URL em IP   │ │ • Ransomware: Criptografa e │
│ • Win+L: Bloqueia tela  │ │ • Excel: .xlsx        │ │ • SMTP: Envia e-mails       │ │   exige resgate             │
│ • Win+D: Mostra Desktop │ │ • Calc: .ods          │ │ • IMAP: Sincroniza na nuvem │ │ • Phishing: Isca / Golpe    │
│ • Linux: pwd, ls, chmod │ │ • Intervalo: A1:A5    │ │ • POP3: Baixa e deleta nuvem│ │ • Worm: Propagação autônoma │
└─────────────────────────┘ └───────────────────────┘ └─────────────────────────────┘ └─────────────────────────────┘
```

---

## 🎯 BATERIA DE QUESTÕES COMENTADAS (ESTILO INSTITUTO AOCP - PM-PE)

### Questão 01 (Instituto AOCP - PM-PE)
Um policial militar em serviço administrativo necessitou bloquear imediatamente o seu computador com Windows 11 para impedir o acesso de terceiros enquanto se afastava temporariamente da mesa. O atalho de teclado que executa essa ação de forma instantânea é:
- A) Ctrl + Alt + Del
- B) Win + L
- C) Win + D
- D) Alt + F4
- E) Shift + Esc
**Gabarito Oficial: B**
*Comentário Didático CRAVOU: B é a correta. O atalho de teclado da tecla Windows combinada com a letra L (Lock) bloqueia a sessão do usuário de maneira instantânea, exigindo nova senha para desbloqueio.*

### Questão 02 (Instituto AOCP - PM-PE)
O tipo de malware que sequestra dados institucionais, criptografando os arquivos e diretórios dos servidores da organização e exigindo pagamento financeiro para disponibilizar o meio de recuperação, é denominado:
- A) Adware
- B) Spyware
- C) Ransomware
- D) Rootkit
- E) Keylogger
**Gabarito Oficial: C**
*Comentário Didático CRAVOU: C é a correta. Ransomware vem de "ransom" (resgate). É o ataque que bloqueia o acesso aos dados via cifra criptográfica exigindo recompensa pecuniária.*
