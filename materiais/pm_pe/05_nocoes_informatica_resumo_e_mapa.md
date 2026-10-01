# 💻 NOÇÕES DE INFORMÁTICA COMPLETA - POLÍCIA MILITAR DE PERNAMBUCO (SOLDADO)
## Edital Oficial Portaria Conjunta SAD/SDS nº 299/2026 e Portaria nº 83/2023 • Instituto AOCP
### Método Tático CRAVOU • Doutrina AlfaCon / Prof. João Paulo Orso • 100% dos Tópicos

---

## 1. HARDWARE, ARQUITETURA DE COMPUTADORES & MEMÓRIAS

### 1.1 Hierarquia e Tipos de Memória
A banca adora cobrar velocidade, volatilidade e capacidade:
1. **Registradores da CPU**:
   - Memória mais rápida, de menor capacidade e maior custo por bit.
   - Fica dentro do núcleo do processador (*core*).
   - Volátil.
2. **Memória Cache (L1, L2, L3)**:
   - Memória estática de ultravelocidade (**SRAM**).
   - Não necessita de recarga constante de energia (*refresh*).
   - Fica no processador para mitigar o gargalo de velocidade entre CPU e Memória RAM.
   - Níveis: **L1** (menor, mais rápida, por núcleo) -> **L2** (média) -> **L3** (maior, compartilhada entre núcleos).
3. **Memória Principal (RAM - Random Access Memory)**:
   - Memória dinâmica (**DRAM**), necessita de recarga periódica de capacitores (*refresh cycle*).
   - **Volátil**: Ao cortar a energia (desligar ou reiniciar o PC), **todos os dados são perdidos**.
   - É a área de trabalho onde o Sistema Operacional e os programas abertos ficam carregados.
4. **Memória Secundária / Armazenamento em Massa**:
   - **Não volátil**: Dados permanecem gravados mesmo desligado.
   - **HDD (Hard Disk Drive)**: Magnético, partes mecânicas móveis (pratos giratórios e braço leitor), sensível a choques mecânicos.
   - **SSD (Solid State Drive)**: Memória Flash (eletrônica/sem partes móveis), muito mais rápido, consome menos energia e resistente a impactos físicos. Interfaces: SATA (até ~550 MB/s) e NVMe/PCIe (3.500 MB/s a 7.000 MB/s).
5. **Memória ROM (Read-Only Memory)**:
   - **Não volátil**, gravada pelo fabricante da placa-mãe.
   - Contém o firmware essencial:
     - **BIOS / UEFI**: Sistema básico de entrada e saída.
     - **POST (Power-On Self-Test)**: Autoteste de hardware executado assim que a máquina é ligada.
     - **Setup**: Tela de configuração de hardware e ordem de boot (armazenada na memória volátil CMOS, alimentada por bateria CR2032).

---

## 2. SISTEMAS OPERACIONAIS: WINDOWS 10/11 & LINUX

### 2.1 Microsoft Windows 10 e 11
- **Atalhos Táticos Indispensáveis (AOCP)**:
  - `Win + L`: Bloqueia o computador imediatamente (**L**ock).
  - `Win + D`: Minimiza/restaura todas as janelas e exibe a Área de Trabalho (**D**esktop).
  - `Win + E`: Abre o Explorador de Arquivos (**E**xplorer).
  - `Win + I`: Abre as Configurações do Windows.
  - `Win + R`: Abre a caixa Executar (**R**un).
  - `Win + V`: Histórico da Área de Transferência (múltiplos textos/imagens copiados).
  - `Win + Shift + S`: Ferramenta de Captura interativa de tela.
  - `Ctrl + Shift + Esc`: Abre direto o Gerenciador de Tarefas (sem passar pela tela de segurança do `Ctrl + Alt + Del`).
- **Recursos de Segurança do Windows**:
  - **BitLocker**: Criptografia de unidade completa (disco rígido/pendrive) que exige chip TPM (Trusted Platform Module).
  - **Windows Defender / Segurança do Windows**: Antivírus nativo com proteção em tempo real, proteção contra ransomware e firewall integrado.

### 2.2 Sistema Operacional Linux (Distribuições e Comandos)
- **Características do Kernel Linux**:
  - Código aberto (*Open Source*), multiusuário, multitarefa preemptivo.
  - Estrutura de arquivos unificada sob a raiz (`/` - barra inclinada para frente).
  - *Case-Sensitive*: Diferencia maiúsculas de minúsculas (`Arquivo.txt` ≠ `arquivo.txt`).
- **Diretórios Estruturais**:
  - `/bin`: Binários essenciais executáveis do sistema usados por todos os usuários.
  - `/sbin`: Binários administrativos (usados pelo superusuário *root*).
  - `/etc`: Arquivos de configuração global do sistema e serviços.
  - `/home`: Diretórios pessoais dos usuários comuns (ex: `/home/soldado/`).
  - `/root`: Diretório pessoal do superusuário (*root*).
  - `/var`: Arquivos de dados variáveis (logs do sistema, filas de impressão).
  - `/tmp`: Arquivos temporários (apagados periodicamente).
  - `/dev`: Arquivos especiais que representam dispositivos de hardware.
- **Comandos Essenciais no Terminal Linux**:
  - `pwd`: Exibe o caminho do diretório corrente (*print working directory*).
  - `ls -la`: Lista arquivos com detalhes (permissões, dono, tamanho e ocultos iniciados por `.`).
  - `cd`: Navega entre diretórios (`cd ..` sobe um nível).
  - `mkdir`: Cria diretório.
  - `rm -rf`: Remove diretórios e arquivos recursivamente e forçadamente.
  - `cp`: Copia arquivos (`cp -r` para diretórios).
  - `mv`: Move ou renomeia arquivos.
  - `grep`: Filtra linhas de texto que contêm uma expressão ou palavra-chave.
  - `find`: Localiza arquivos na árvore de diretórios.
  - `ps aux` ou `top`: Monitora processos em execução.
  - `kill`: Finaliza um processo pelo seu PID.
  - `chmod`: Modifica as permissões de acesso a arquivos.
- **Tabela de Permissões Octais do Linux (`chmod`)**:
  - Tipos de usuários: Usuário dono (**u**ser), Grupo (**g**roup), Outros (**o**thers).
  - Leitura (**r**ead) = **4**
  - Gravação/Escrita (**w**rite) = **2**
  - Execução (**x**ecute) = **1**
  - *Exemplo Clássico*: `chmod 755 arquivo.sh`
    - Dono: `4 + 2 + 1 = 7` (leitura, escrita e execução)
    - Grupo: `4 + 0 + 1 = 5` (leitura e execução)
    - Outros: `4 + 0 + 1 = 5` (leitura e execução)

---

## 3. SUÍTES DE ESCRITÓRIO: MS OFFICE (WORD/EXCEL) & LIBREOFFICE (WRITER/CALC)

### 3.1 Processadores de Texto (Word vs Writer)
| Recurso / Ação | Microsoft Word | LibreOffice Writer |
| :--- | :--- | :--- |
| **Formato Nativo** | `.docx` | `.odt` (OpenDocument Text) |
| **Salvar Documento** | `Ctrl + B` | `Ctrl + S` |
| **Imprimir Documento** | `Ctrl + P` | `Ctrl + P` |
| **Negrito** | `Ctrl + N` | `Ctrl + B` (Bold) |
| **Itálico** | `Ctrl + I` | `Ctrl + I` |
| **Sublinhado** | `Ctrl + S` | `Ctrl + U` (Underline) |
| **Localizar Texto** | `Ctrl + L` | `Ctrl + F` (Find) |
| **Substituir Texto** | `Ctrl + U` | `Ctrl + H` |
| **Alinhar ao Centro** | `Ctrl + E` | `Ctrl + E` |
| **Justificar** | `Ctrl + J` | `Ctrl + J` |

### 3.2 Planilhas Eletrônicas (Excel vs Calc)
- **Extensões Nativas**: Excel (`.xlsx`) | Calc (`.ods`).
- **Operadores de Intervalo (Pegadinha Universal AOCP)**:
  - Dois pontos (`:`): Intervalo contínuo ("ATÉ"). Ex: `=SOMA(A1:A5)` soma A1 + A2 + A3 + A4 + A5.
  - Ponto e vírgula (`;`): Separador de argumentos pontuais ("E"). Ex: `=SOMA(A1;A5)` soma apenas A1 + A5.
- **Fórmulas e Funções Mais Cobradas**:
  - `=SOMA(intervalo)`: Soma valores numéricos.
  - `=MÉDIA(intervalo)`: Média aritmética simples.
  - `=MÁXIMO(intervalo)`: Retorna o maior valor numérico.
  - `=MÍNIMO(intervalo)`: Retorna o menor valor numérico.
  - `=MAIOR(intervalo; k)`: Retorna o k-ésimo maior valor (ex: `=MAIOR(A1:A10; 2)` retorna o 2º maior).
  - `=MENOR(intervalo; k)`: Retorna o k-ésimo menor valor.
  - `=CONT.SE(intervalo; critério)`: Conta quantas células atendem a uma condição (ex: `=CONT.SE(B1:B10; ">50")`).
  - `=SOMASE(intervalo; critério; [intervalo_soma])`: Soma somente as células que atendem a uma condição.
  - `=SE(teste_lógico; valor_se_verdadeiro; valor_se_falso)`: Condicional binária.
  - `=PROCV(valor_procurado; matriz_tabela; número_índice_coluna; [procurar_intervalo])`: Busca vertical em tabela.
- **Trancamento de Célula (Referências Absolutas)**:
  - Cifrão (`$`) fixa a linha ou coluna para não mudar no arrasto:
    - `$A$1`: Fixa coluna A e linha 1 (absoluta total).
    - `$A1`: Fixa coluna A (linha varia).
    - `A$1`: Fixa linha 1 (coluna varia).
    - Pressionar tecla `F4` no Excel alterna os trancamentos.

---

## 4. REDES DE COMPUTADORES, MODELO OSI/TCP-IP E INTERNET

### 4.1 Classificação Geográfica de Redes
- **PAN (Personal Area Network)**: Rede pessoal em torno de uma pessoa (Bluetooth, alcance de poucos metros).
- **LAN (Local Area Network)**: Rede local cobrindo uma sala, edifício ou batalhão militar.
- **MAN (Metropolitan Area Network)**: Rede metropolitana que interliga prédios e batalhões em uma mesma cidade.
- **WAN (Wide Area Network)**: Rede de longa distância geograficamente dispersa (cidades, países ou a Internet).

### 4.2 Equipamentos de Interconexão de Redes
- **Hub**: Dispositivo da camada física (Camada 1). Não tem inteligência: recebe dados em uma porta e replica por difusão (*broadcast*) para todas as portas, gerando colisões de rede. Obsoleto.
- **Switch**: Dispositivo da camada de enlace (Camada 2 - baseado em endereços físicos MAC). Inteligente: envia os pacotes diretamente à porta de destino (*unicast*), evitando colisões.
- **Roteador**: Dispositivo da camada de rede (Camada 3 - baseado em endereços lógicos IP). Responsável por encontrar a melhor rota entre diferentes redes.

### 4.3 Modelo OSI (7 Camadas) vs Arquitetura TCP/IP (4 Camadas)
| Camada OSI (7) | Função Principal | Camada TCP/IP (4) | Protocolos Associados |
| :--- | :--- | :--- | :--- |
| **7. Aplicação** | Interface direta com o usuário | **Aplicação** | HTTP, HTTPS, DNS, DHCP, FTP, SSH, SMTP, POP3, IMAP |
| **6. Apresentação** | Formatação, criptografia e compressão |  | SSL/TLS, JPEG, ASCII |
| **5. Sessão** | Estabelece e gerencia sessões |  | NetBIOS |
| **4. Transporte** | Comunicação ponta a ponta e portas | **Transporte** | **TCP** (confiável, orientado a conexão, controle de fluxo) e **UDP** (rápido, sem conexão, sem garantia de entrega - streaming/DNS) |
| **3. Rede** | Endereçamento lógico e roteamento | **Internet** | **IP** (IPv4 / IPv6), ICMP (ping), ARP |
| **2. Enlace** | Endereçamento físico (MAC) e controle de acesso | **Acesso à Rede** | Ethernet, Wi-Fi (802.11) |
| **1. Física** | Transmissão de bits em meio físico |  | Cabos (par trançado, fibra óptica), conectores RJ-45 |

### 4.4 Portas e Protocolos Mais Cobrados em Concursos
- **HTTP (Porta 80)**: Transferência de hipertexto sem criptografia.
- **HTTPS (Porta 443)**: Transferência segura com criptografia SSL/TLS.
- **DNS (Porta 53)**: Sistema de Nomes de Domínio (converte URLs como `www.pm.pe.gov.br` em endereços IP). Usa preferencialmente protocolo UDP.
- **DHCP (Portas 67/68)**: Atribui configurações de rede (IP, máscara, gateway, DNS) de forma dinâmica e automática aos clientes.
- **FTP (Portas 20 dados / 21 controle)**: Transferência de arquivos.
- **SSH (Porta 22)**: Shell seguro com autenticação e comunicação criptografada.
- **Telnet (Porta 23)**: Terminal remoto inseguro (dados trafegam em texto claro).
- **SMTP (Porta 587 / 25)**: Envio de e-mails (*Simple Mail Transfer Protocol* -> "Sua Mensagem Tá Partindo").
- **POP3 (Porta 110 / 995 SSL)**: Recebimento de e-mails baixando para a máquina do usuário e deletando do servidor.
- **IMAP (Porta 143 / 993 SSL)**: Recebimento de e-mails mantendo-os sincronizados na nuvem do servidor.

### 4.5 Endereçamento IP: IPv4 vs IPv6
- **IPv4**:
  - Endereço de **32 bits**, representado em 4 octetos decimais separados por pontos (ex: `192.168.1.1`).
  - Total teórico: ~4,3 bilhões de endereços (esgotado).
- **IPv6**:
  - Endereço de **128 bits**, representado em 8 blocos hexadecimais separados por dois-pontos (ex: `2001:0db8:85a3:0000:0000:8a2e:0370:7334`).
  - Permite compressão de zeros consecutivos por `::` (uma única vez por endereço).

---

## 5. SEGURANÇA DA INFORMAÇÃO, MALWARES, CRIPTOGRAFIA & ATAQUES

### 5.1 Princípios Básicos (Mnemônico C.I.D.A.N)
1. **Confidencialidade**: Proteção contra acesso não autorizado (garantida por criptografia e controle de acesso).
2. **Integridade**: Garantia de que a informação não foi modificada ou corrompida indevidamente (garantida por funções de resumo Hash: SHA-256, MD5).
3. **Disponibilidade**: Garantia de acesso contínuo aos dados pelos usuários autorizados sempre que necessário.
4. **Autenticidade**: Confirmação incontestável da identidade de quem produziu ou enviou a mensagem (certificados digitais).
5. **Não Repúdio (Irretratabilidade)**: Impossibilidade jurídica de o emissor negar a autoria do envio de uma informação assinada digitalmente com sua chave privada.

### 5.2 Tipos de Malwares (Códigos Maliciosos)
- **Vírus**: Programa malicioso que infecta arquivos executáveis existentes (precisa de hospedeiro) e depende da **ação do usuário** (clicar/executar) para se propagar.
- **Worm (Verme)**: Programa autônomo que se propaga sozinho pela rede explorando vulnerabilidades, **sem precisar de hospedeiro nem de ação do usuário**. Consome banda de rede excessiva.
- **Trojan Horse (Cavalo de Troia)**: Programa disfarçado de aplicativo legítimo ou útil (ex: protetor de tela, gerador de cupons) que, ao ser executado pelo usuário, abre brechas e portas traseiras (*backdoors*) para invasores.
- **Ransomware**: Malware que sequestra o sistema ou **criptografa os arquivos do usuário** e exige pagamento de resgate (frequentemente em Bitcoin) para disponibilizar a chave de recuperação.
- **Spyware**: Software espião que coleta informações sem consentimento:
  - *Keylogger*: Grava todas as teclas digitadas no teclado físico.
  - *Screenlogger*: Tira prints da tela no momento dos cliques do mouse.
  - *Adware*: Exibe publicidades e anúncios indesejados.
- **Rootkit**: Conjunto de ferramentas avançadas que se instala profundamente no sistema operacional para **ocultar a presença de invasores e de outros malwares** das ferramentas de antivírus.
- **Bot / Botnet**: Máquina infectada e controlada remotamente ("computador zumbi") que faz parte de uma rede zumbi utilizada para desferir ataques coordenados.

### 5.3 Golpes Cibernéticos e Engenharia Social
- **Phishing**: Fraude eletrônica que usa mensagens, sites falsificados ou e-mails clonados para induzir a vítima a fornecer credenciais de acesso, senhas e números de cartão.
- **Spear Phishing**: Phishing direcionado especificamente a uma pessoa, cargo ou organização específica.
- **Defacement**: Ataque de desfiguração ou pichação da página principal de um site público/governamental.
- **DDoS (Distributed Denial of Service)**: Ataque de negação de serviço distribuído em que milhares de computadores zumbis inundam um servidor com requisições simultâneas até causar o colapso e indisponibilidade do serviço.
- **Man-in-the-Middle (MitM)**: Ataque no qual o invasor intercepta secretamente a comunicação entre duas partes sem que elas percebam.

### 5.4 Criptografia e Assinatura Digital
- **Criptografia Simétrica (Chave Secreta Única)**:
  - A mesma chave é usada tanto para cifrar quanto para decifrar.
  - Rápida no processamento de grandes volumes de dados.
  - Exemplos: AES, DES, 3DES, RC4.
- **Criptografia Assimétrica (Par de Chaves Pública e Privada)**:
  - Chave Pública: Aberta e distribuída livremente para qualquer pessoa cifrar mensagens destinadas ao dono.
  - Chave Privada: Mantida em absoluto segredo pelo proprietário para decifrar as mensagens.
  - Exemplos: RSA, ECC, DSA.
- **Mecanismo da Assinatura Digital (Garante Integridade, Autenticidade e Não Repúdio)**:
  1. O emissor gera um Hash (resumo criptográfico) do documento original.
  2. O emissor criptografa esse Hash usando a sua própria **CHAVE PRIVADA**. Essa operação gera a Assinatura Digital.
  3. O receptor confere a autenticidade decifrando a assinatura com a **CHAVE PÚBLICA** do emissor e comparando o Hash resultante.
  - *Regra de Ouro AlfaCon*: **Assina com a Privada, confere com a Pública!**

---

## 6. NUVEM (CLOUD COMPUTING) & ROTINAS DE BACKUP

### 6.1 Modelos de Serviços em Nuvem (SPI)
1. **SaaS (Software as a Service)**:
   - O usuário consome o aplicativo final via navegador/web sem gerenciar nada da infraestrutura subjacente.
   - Exemplos: Google Drive, Gmail, Office 365, Trello.
2. **PaaS (Platform as a Service)**:
   - Fornece um ambiente de desenvolvimento e execução (linguagens, banco de dados, servidor web) para programadores hospedarem suas aplicações.
   - Exemplos: Heroku, Google App Engine, AWS Elastic Beanstalk.
3. **IaaS (Infrastructure as a Service)**:
   - Locação de capacidade computacional bruta (máquinas virtuais, processamento, memória, discos e redes). O cliente gerencia o Sistema Operacional e tudo acima dele.
   - Exemplos: Amazon AWS EC2, Microsoft Azure VMs, Google Compute Engine.

### 6.2 Rotinas de Backup
- **Backup Completo (Full)**:
  - Copia todos os dados da pasta/disco.
  - Desmarca o bit de arquivo (*archive bit* = desligado).
  - Mais lento para executar; mais rápido para restaurar (apenas 1 mídia).
- **Backup Incremental**:
  - Copia apenas os dados criados ou modificados **desde o último backup (Full ou Incremental)**.
  - Desmarca o bit de arquivo.
  - Rápido para executar; mais demorado para restaurar (necessita do último Full + todos os Incrementais em ordem).
- **Backup Diferencial**:
  - Copia todos os dados criados ou modificados **desde o último backup Completo (Full)**.
  - **NÃO desmarca o bit de arquivo**.
  - Restauração rápida: necessita apenas do último Full + o último Diferencial.

---

## 🧠 MAPA MENTAL INTEGRADO - INFORMÁTICA PM-PE

```
                                  ┌─────────────────────────────────────────────────────────┐
                                  │         NOÇÕES DE INFORMÁTICA COMPLETA - PM-PE          │
                                  └────────────────────────────┬────────────────────────────┘
                                                               │
     ┌─────────────────────────────┬───────────────────────────┴───────────────────────────┬─────────────────────────────┐
     │                             │                                                       │                             │
┌────▼────────────────────┐ ┌──────▼─────────────────────┐ ┌───────────────────────────────▼┐ ┌──────────────▼─────────────┐
│ ARQUITETURA & HARDWARE  │ │ SISTEMAS: WIN & LINUX      │ │ REDES, MODELO OSI & INTERNET   │ │ SEGURANÇA DA INFORMAÇÃO     │
├─────────────────────────┤ ├────────────────────────────┤ ├────────────────────────────────┤ ├─────────────────────────────┤
│• RAM: Volátil e dinâmico│ │• Win+L: Bloqueia sessão    │ │• TCP (confiável) vs UDP (fluxo)│ │• C.I.D.A.N: Princípios Base │
│• ROM/UEFI: Não volátil  │ │• Win+D: Mostra Desktop     │ │• Portas: 80(HTTP), 443(HTTPS)  │ │• Ransomware: Cripto+Resgate │
│• Cache L1/L2/L3: SRAM   │ │• Linux: Case-Sensitive     │ │• SMTP: Envia (Porta 587)       │ │• Worm: Auto-propagação rede │
│• SSD NVMe: Flash rápido │ │• chmod 755: rwx / r-x / r-x│ │• POP3: Baixa e apaga           │ │• Assinatura Digital: Chave  │
│• Registradores: Na CPU  │ │• /etc: Configurações       │ │• IMAP: Sincroniza na nuvem     │ │  Privada do emissor         │
└─────────────────────────┘ └────────────────────────────┘ └────────────────────────────────┘ └─────────────────────────────┘
```

---

## 🎯 BATERIA DE QUESTÕES OFICIAIS DO INSTITUTO AOCP & BANCAS POLICIAIS

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

### Questão 03 (Instituto AOCP - Polícia Científica)
No sistema operacional Windows 10/11, qual combinação de teclas permite ao usuário bloquear imediatamente a sua sessão de trabalho, exigindo nova inserção de credenciais de login para retorno?
- A) Ctrl + Shift + Esc.
- B) Alt + F4.
- C) Tecla do logotipo do Windows + L.
- D) Tecla do logotipo do Windows + D.
- E) Ctrl + Alt + Del.
**Gabarito Oficial: C**
*Comentário Didático CRAVOU: C está correta. O atalho Win + L (Lock) trava e bloqueia instantaneamente a estação de trabalho. Win + D exibe o Desktop. Ctrl + Shift + Esc abre o Gerenciador de Tarefas.*

### Questão 04 (Instituto AOCP - Carreira Policial)
No sistema operacional Linux, qual comando é utilizado para alterar as permissões de acesso de leitura, escrita e execução de arquivos e diretórios?
- A) chown.
- B) chmod.
- C) chgrp.
- D) umask.
- E) ls -l.
**Gabarito Oficial: B**
*Comentário Didático CRAVOU: B está correta. O comando `chmod` (change mode) altera permissões de arquivos e pastas. O comando `chown` altera o proprietário do arquivo.*

### Questão 05 (Instituto AOCP - Perito Oficial)
Em relação aos conceitos de criptografia e assinatura digital, para que um remetente assine digitalmente um documento eletrônico garantindo a sua autenticidade e o não repúdio, ele deve utilizar:
- A) A chave pública do destinatário.
- B) A chave privada do destinatário.
- C) A sua própria chave privada.
- D) A sua própria chave pública.
- E) A chave simétrica compartilhada.
**Gabarito Oficial: C**
*Comentário Didático CRAVOU: C está correta. Regra de Ouro AlfaCon/CRAVOU: A assinatura digital é gerada com a CHAVE PRIVADA do emissor (garantindo que somente ele pôde criá-la) e validada por qualquer um com a sua CHAVE PÚBLICA.*
