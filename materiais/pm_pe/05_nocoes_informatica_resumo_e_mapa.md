# 💻 NOÇÕES DE INFORMÁTICA COMPLETA - POLÍCIA MILITAR DE PERNAMBUCO (SOLDADO)
## Edital Oficial Portaria Conjunta SAD/SDS nº 299/2026 e Portaria nº 83/2023 • Instituto AOCP
### Método Tático CRAVOU • 100% dos Tópicos do Edital

---

## 1. REDES DE COMPUTADORES, INTERNET, INTRANET & EXTRANET

### 1.1 Conceitos e Diferenças Essenciais
- **Internet**: Rede mundial de computadores pública, descentralizada e baseada na pilha de protocolos TCP/IP.
- **Intranet**: Rede privada corporativa que utiliza a **mesma tecnologia e protocolos da Internet** (TCP/IP, HTTP, SMTP), mas com **acesso restrito exclusivamente aos colaboradores ou integrantes da instituição** (ex: sistema interno da PM-PE).
- **Extranet**: Extensão da Intranet que permite **acesso externo controlado e autenticado a terceiros autorizados** (ex: fornecedores, parceiros ou policiais em missão remota).

### 1.2 Protocolos de Comunicação em Redes (Decoreba de Prova)
| Protocolo | Significado e Função | Porta Padrão | Camada |
| :--- | :--- | :---: | :---: |
| **HTTP** | HyperText Transfer Protocol (transferência de páginas web sem criptografia) | 80 | Aplicação |
| **HTTPS** | HTTP Seguro (páginas web com criptografia SSL/TLS) | **443** | Aplicação |
| **DNS** | Domain Name System (converte nomes de domínio em endereços IP) | **53** | Aplicação |
| **DHCP** | Dynamic Host Configuration Protocol (atribui endereços IP dinamicamente) | 67/68 | Aplicação |
| **FTP** | File Transfer Protocol (transferência de arquivos entre cliente e servidor) | 20 (dados) / 21 (controle) | Aplicação |
| **SSH** | Secure Shell (acesso e administração remota criptografada) | **22** | Aplicação |
| **Telnet** | Acesso remoto sem criptografia (inseguro) | 23 | Aplicação |
| **SMTP** | Simple Mail Transfer Protocol (**Sua Mensagem Tá Partindo** -> Envio de e-mail) | 587 (submissão) / 25 | Aplicação |
| **POP3** | Post Office Protocol (**Baixa as mensagens do servidor e apaga localmente**) | 110 / 995 (SSL) | Aplicação |
| **IMAP** | Internet Message Access Protocol (**Sincroniza e mantém as mensagens no servidor**) | 143 / 993 (SSL) | Aplicação |

---

## 2. NAVEGADORES, NUVEM (CLOUD COMPUTING) & PROCEDIMENTOS DE BACKUP

### 2.1 Navegadores de Internet (Chrome, Edge, Firefox)
- **Navegação Anônima / InPrivate**:
  - Atalhos: `Ctrl + Shift + N` (Google Chrome / Edge) ou `Ctrl + Shift + P` (Mozilla Firefox).
  - **O que faz**: NÃO salva histórico de navegação, cookies, dados de sites nem informações inseridas em formulários no dispositivo local.
  - **O que NÃO faz (Pegadinha AOCP)**: NÃO torna o usuário invisível na rede! A atividade ainda é visível para o provedor de internet, para o administrador da rede corporativa e para os sites acessados.

### 2.2 Computação em Nuvem (Cloud Computing)
- **Modelos de Serviço (SPI)**:
  1. **SaaS (Software as a Service)**: O usuário consome o aplicativo final pela internet sem gerenciar infraestrutura (ex: Google Workspace, Gmail, Microsoft 365, Dropbox).
  2. **PaaS (Platform as a Service)**: Plataforma para desenvolvedores criarem aplicativos (ex: Google App Engine, Heroku).
  3. **IaaS (Infrastructure as a Service)**: Fornecimento de hardware virtualizado, servidores e capacidade de processamento/armazenamento bruto (ex: AWS EC2, Google Cloud Compute, Microsoft Azure VMs).

### 2.3 Procedimentos de Armazenamento e Rotinas de Backup
- **Backup Completo (Full)**:
  - Copia **todos os dados** selecionados;
  - Desmarca o atributo de arquivo (marca que foi copiado);
  - Mais demorado para criar, mas a restauração é a mais rápida (exige apenas 1 fita/arquivo).
- **Backup Incremental**:
  - Copia **apenas os arquivos criados ou modificados desde o ÚLTIMO backup** (seja Full ou Incremental);
  - Desmarca o atributo de arquivo;
  - Criação rápida; restauração exige o último Backup Completo **+ TODOS os backups incrementais intermediários**.
- **Backup Diferencial**:
  - Copia **todos os arquivos criados ou modificados desde o ÚLTIMO backup COMPLETO**;
  - **NÃO desmarca** o atributo de arquivo;
  - Restauração exige apenas o **último Backup Completo + o ÚLTIMO backup diferencial**.

---

## 3. SEGURANÇA DA INFORMAÇÃO, MALWARES & PROTEÇÃO

### 3.1 Princípios Básicos da Segurança da Informação (Mnemônico C.I.D.A.N)
1. **C**onfidencialidade: Garantia de que a informação só será acessada por pessoas expressamente autorizadas (protegida por criptografia).
2. **I**ntegridade: Garantia de que a informação não foi alterada, corrompida ou destruída de forma não autorizada (verificada por algoritmos de Hash como SHA-256 e MD5).
3. **D**isponibilidade: Garantia de que o sistema e os dados estarão acessíveis sempre que os usuários autorizados necessitarem.
4. **A**utenticidade: Garantia da identidade de quem enviou ou gerou a informação (garantida por certificados digitais e assinaturas).
5. **N**ão Repúdio (Irretratabilidade): Impossibilidade de o autor negar a autoria de uma ação ou transação digital realizada com sua chave privada.

### 3.2 Principais Ameaças, Pragas Virtuais e Engenharia Social
- **Vírus**: Programa malicioso que precisa de um arquivo hospedeiro e de **execução direta pelo usuário** para se propagar.
- **Worm (Verme)**: Programa autônomo que se propaga automaticamente pela rede **sem necessidade de hospedeiro nem de ação do usuário**, explorando falhas do sistema operacional.
- **Trojan Horse (Cavalo de Troia)**: Programa disfarçado de aplicativo legítimo (jogo, utilitário) que, ao ser executado, abre portas do sistema (*backdoors*) para invasores.
- **Ransomware**: Malware que **criptografa os arquivos da vítima** e exige o pagamento de um resgate (geralmente em criptomoedas) para fornecer a chave de descriptografia.
- **Spyware**: Software espião que monitora as atividades do usuário:
  - *Keylogger*: Registra tudo o que é digitado no teclado físico;
  - *Screenlogger*: Captura imagens da tela nos cliques do mouse.
- **Phishing**: Técnica de fraude eletrônica que usa mensagens, e-mails ou páginas falsas para enganar a vítima e roubar senhas e dados bancários.

### 3.3 Mecanismos de Proteção e Defesa
- **Firewall**: Dispositivo de hardware ou software que atua como barreira de proteção, filtrando e controlando o tráfego de rede com base em regras preestabelecidas (bloqueia portas não autorizadas). **Atenção**: O Firewall NÃO substitui o antivírus, pois ele não analisa arquivos infectados dentro de pacotes de dados legítimos!
- **Antivírus**: Software projetado para detectar, isolar e remover códigos maliciosos baseando-se em assinaturas conhecidas e análise heurística.
- **Autenticação em Duas Etapas (2FA)**: Adição de uma segunda camada de verificação combinando fatores: o que você sabe (senha) + o que você tem (código SMS/app autenticador) + o que você é (biometria).

---

## 🧠 MAPA MENTAL INTEGRADO - INFORMÁTICA PM-PE

```
                          ┌─────────────────────────────────────────────────────────┐
                          │         NOÇÕES DE INFORMÁTICA COMPLETA - PM-PE          │
                          └────────────────────────────┬────────────────────────────┘
                                                       │
         ┌──────────────────────────────┬──────────────┴──────────────┬──────────────────────────────┐
         │                              │                             │                              │
┌────────▼────────────────┐ ┌───────────▼───────────┐ ┌───────────────▼─────────────┐ ┌──────────────▼─────────────┐
│ REDES & PROTOCOLOS      │ │ NUVEM & BACKUP        │ │ SEGURANÇA (C.I.D.A.N)       │ │ MALWARES & DEFESA           │
├───────────────────── ───┤ ├───────────────────────┤ ├─────────────────────────────┤ ├─────────────────────────────┤
│• HTTPS: Porta 443 cript.│ │• SaaS: Software final │ │• Confidencialidade (cripto) │ │• Ransomware: Criptografa    │
│• SMTP: Envia e-mail     │ │• IaaS: Infraestrutura │ │• Integridade (Hash)         │ │  dados e cobra resgate      │
│• POP3: Baixa e apaga    │ │• Backup Full: Tudo    │ │• Disponibilidade (acesso)   │ │• Worm: Propagação autônoma  │
│• IMAP: Sincroniza nuvem │ │• Incremental: Desde o │ │• Autenticidade (Certificado)│ │• Phishing: Isca para roubar │
│• Intranet: Acesso priv. │ │  último backup        │ │• Não Repúdio: Sem negar ato │ │• Firewall: Filtro de portas │
└─────────────────────────┘ └───────────────────────┘ └─────────────────────────────┘ └─────────────────────────────┘
```

---

## 🎯 BATERIA DE QUESTÕES OFICIAIS DO INSTITUTO AOCP

### Questão 01 (Instituto AOCP - Soldado PM-PE)
No âmbito dos protocolos da arquitetura TCP/IP, qual protocolo é o responsável pelo envio de mensagens de correio eletrônico entre clientes e servidores de e-mail?
- A) IMAP.
- B) POP3.
- C) SMTP.
- D) FTP.
- E) DNS.
**Gabarito Oficial: C**
*Comentário Didático CRAVOU: C está correta. Mnemônico CRAVOU: SMTP ("Sua Mensagem Tá Partindo") é o protocolo de envio de mensagens de e-mail. IMAP e POP3 são protocolos de recebimento e consulta.*

### Questão 02 (Instituto AOCP - Soldado PM-PE)
Um tipo de ataque virtual que tem se tornado muito frequente consiste na infecção do computador por um programa malicioso que criptografa os arquivos do usuário, tornando-os inacessíveis, e exige o pagamento de um valor para a liberação dos dados. Esse malware é conhecido como:
- A) Spyware.
- B) Worm.
- C) Ransomware.
- D) Rootkit.
- E) Trojan Downloader.
**Gabarito Oficial: C**
*Comentário Didático CRAVOU: C está correta. O Ransomware é o software malicioso que restringe o acesso ao sistema ou sequestra os arquivos mediante criptografia, solicitando um resgate financeiro.*
