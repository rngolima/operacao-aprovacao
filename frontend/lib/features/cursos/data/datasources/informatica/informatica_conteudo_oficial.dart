import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import '../../models/mapa_mental_model.dart';

/// Aula 01 Oficial de Informática (Soldado PM-PE)
/// Estrutura Tática AlfaCon (Prof. João Paulo Orso) & Instituto AOCP
final aulaGuiaItemInformatica01 = AulaGuiaItem(
  numero: '01',
  titulo: 'Hardware, Windows 10/11, Linux, Redes, Modelo OSI e Segurança da Informação',
  detalhes: '25 min • Método CRAVOU • Doutrina AlfaCon • Questões Comentadas',
  concluida: false,
  destaque: true,
  conteudoTeorico: '''# INFORMÁTICA TÁTICA: HARDWARE, SISTEMAS, REDES E SEGURANÇA DA INFORMAÇÃO
## Doutrina Especializada AlfaCon (Prof. João Paulo Orso) • Instituto AOCP

---

## 1. HARDWARE, ARQUITETURA E HIERARQUIA DE MEMÓRIAS
- **Hierarquia de Velocidade e Custo por Bit**:
  1. *Registradores da CPU*: Mais rápidos do computador, ficam dentro do chip processador. Voláteis.
  2. *Memória Cache (L1, L2, L3)*: Memória SRAM ultra rápida. Evita o gargalo entre processador e RAM.
  3. *Memória Principal (RAM)*: Memória de trabalho dinâmica (DRAM), volátil (desligou = apagou).
  4. *Memória Secundária (HDD / SSD)*: Armazenamento em massa permanente e não volátil.
     - *SSD*: Memória Flash eletrônica, sem partes móveis, muito mais veloz e resistente a impactos (SATA até 550 MB/s; NVMe/PCIe até 7.000 MB/s).
     - *HDD*: Discos magnéticos giratórios e braço mecânico leitor.
  5. *Memória ROM*: Gravada na fábrica da placa-mãe. Não volátil. Armazena BIOS/UEFI e a rotina POST (autoteste na inicialização).

---

## 2. SISTEMAS OPERACIONAIS: WINDOWS 10/11 E LINUX
- **Microsoft Windows (Atalhos Mais Cobrados em Prova)**:
  - `Win + L`: Bloqueia o computador imediatamente (*Lock*).
  - `Win + D`: Minimiza/restaura janelas e mostra a Área de Trabalho (*Desktop*).
  - `Win + E`: Abre o Explorador de Arquivos (*Explorer*).
  - `Win + V`: Histórico da área de transferência (múltiplos itens copiados).
  - `Ctrl + Shift + Esc`: Abre direto o Gerenciador de Tarefas.
- **Sistema Operacional Linux**:
  - *Kernel Aberto*, multiusuário, multitarefa preemptivo, *case-sensitive* (diferencia maiúsculas de minúsculas).
  - *Diretórios Típicos*:
    - `/bin`: Binários essenciais executáveis por todos os usuários.
    - `/sbin`: Binários administrativos (usados pelo *root*).
    - `/etc`: Arquivos de configuração global do sistema e serviços.
    - `/home`: Pastas pessoais dos usuários comuns.
    - `/root`: Pasta pessoal do superusuário.
    - `/var`: Arquivos variáveis (logs do sistema).
  - *Comandos Essenciais*: `pwd` (exibe caminho atual), `ls -la` (lista arquivos com permissões), `grep` (filtra textos), `chmod` (modifica permissões).
  - *Permissões Octais (`chmod`)*: Leitura `r=4`, Escrita `w=2`, Execução `x=1`. Exemplo: `chmod 755` = Dono 7 (rwx), Grupo 5 (r-x), Outros 5 (r-x).

---

## 3. SUÍTES DE ESCRITÓRIO: MS OFFICE E LIBREOFFICE
- **Extensões Nativas**:
  - Word (`.docx`) vs LibreOffice Writer (`.odt`).
  - Excel (`.xlsx`) vs LibreOffice Calc (`.ods`).
- **Fórmulas e Funções em Planilhas (Excel e Calc)**:
  - `=SOMA(A1:A5)`: Soma de A1 ATÉ A5 (dois pontos = intervalo contínuo).
  - `=SOMA(A1;A5)`: Soma de A1 E A5 (ponto e vírgula = células pontuais).
  - `=SE(teste; se_verdadeiro; se_falso)`: Função condicional lógica.
  - `=CONT.SE(intervalo; critério)`: Conta quantas células atendem ao critério.
  - `=SOMASE(intervalo; critério; [intervalo_soma])`: Soma condicional.
  - Cifrão (`\\\$`) trava a célula para o auto-preenchimento: `\\\$A\\\$1` fixa coluna e linha; tecla `F4` no Excel alterna travas.

---

## 4. REDES DE COMPUTADORES, MODELO OSI/TCP-IP E INTERNET
- **Classificação Geográfica**: `PAN` (pessoal/bluetooth) < `LAN` (local/edifício) < `MAN` (metropolitana/cidade) < `WAN` (longa distância/global).
- **Equipamentos**:
  - *Hub*: Camada Física (1). Sem inteligência, envia tudo por *broadcast* (gera colisões).
  - *Switch*: Camada de Enlace (2). Baseado em MAC address, envia direto ao destino (*unicast*).
  - *Roteador*: Camada de Rede (3). Baseado em endereços lógicos IP, define rotas entre redes distintas.
- **Portas e Protocolos Cruciais**:
  - `HTTP` (Porta 80) e `HTTPS` (Porta 443 - SSL/TLS criptografado).
  - `DNS` (Porta 53): Converte URLs/nomes em endereços IP.
  - `DHCP` (Portas 67/68): Distribui IPs automaticamente.
  - `FTP` (Portas 20/21): Transferência de arquivos.
  - `SSH` (Porta 22): Shell remoto com criptografia forte.
  - `SMTP` (Porta 587): Envio de e-mails (*Sua Mensagem Tá Partindo*).
  - `POP3` (Porta 110): Recebimento com download para a máquina local e exclusão do servidor.
  - `IMAP` (Porta 143/993): Recebimento com sincronização na nuvem do servidor.
- **IPv4 vs IPv6**:
  - IPv4 tem **32 bits** (4 octetos decimais, ex: `192.168.1.1`).
  - IPv6 tem **128 bits** (8 grupos hexadecimais, ex: `2001:db8::1`).

---

## 5. SEGURANÇA DA INFORMAÇÃO, MALWARES E CRIPTOGRAFIA
- **Princípios Básicos (C.I.D.A.N)**:
  - **C**onfidencialidade: Sigilo contra acessos indevidos (Criptografia).
  - **I**ntegridade: Informação inalterada (Hash SHA-256).
  - **D**isponibilidade: Acessível sempre que os autorizados precisarem.
  - **A**utenticidade: Confirmação de autoria (Certificados digitais).
  - **N**ão Repúdio: Impossibilidade jurídica de negar a ação.
- **Pragas Virtuais e Ataques**:
  - *Ransomware*: Criptografa os arquivos e exige resgate em dinheiro/bitcoin.
  - *Phishing*: Isca por e-mail ou página clonada para pescar senhas.
  - *Worm*: Replica-se automaticamente pela rede sem precisar de hospedeiro ou ação do usuário.
  - *Trojan*: Programa disfarçado de inofensivo que abre portas (*backdoors*) para invasores.
  - *DDoS*: Ataque que sobrecarrega servidores através de redes de computadores zumbis (*botnets*).
- **Criptografia e Assinatura Digital**:
  - *Simétrica*: Uma única chave secreta para cifrar e decifrar (AES, DES).
  - *Assimétrica*: Par de chaves pública e privada (RSA).
  - *Regra de Ouro da Assinatura Digital*: O remetente **assina com a sua Chave Privada** e o destinatário **valida a autenticidade com a Chave Pública** dele!''',
  mapaMental: const MapaMentalData(
    titulo: 'INFORMÁTICA: HARDWARE, REDES E SEGURANÇA',
    conceitoCentral: 'Arquitetura de PCs, Windows vs Linux, Protocolos TCP/IP e Segurança C.I.D.A.N.',
    regraDeOuro: 'RAM é volátil! Win+L bloqueia sessão! Porta 443 é HTTPS seguro! Assina com a Privada e confere com a Pública!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Hardware e Memórias',
        subtitulo: 'RAM vs Cache vs SSD',
        corRamo: Color(0xFF0284C7),
        icone: Icons.memory,
        itens: [
          MapaMentalItem(
            titulo: 'Hierarquia',
            descricao: 'Registradores > Cache L1/L2/L3 > RAM > SSD NVMe > HDD.',
            mnemonico: 'Mais rápido no topo = Mais caro por bit',
          ),
          MapaMentalItem(
            titulo: 'RAM vs ROM',
            descricao: 'RAM é volátil de trabalho; ROM armazena BIOS/UEFI não volátil.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Windows vs Linux',
        subtitulo: 'Atalhos e Comandos',
        corRamo: Color(0xFF2563EB),
        icone: Icons.terminal,
        itens: [
          MapaMentalItem(
            titulo: 'Atalhos Windows',
            descricao: 'Win+L bloqueia, Win+D exibe Desktop, Ctrl+Shift+Esc abre Gerenciador.',
            mnemonico: 'Win + L = Lock (Trava imediata)',
          ),
          MapaMentalItem(
            titulo: 'Linux chmod 755',
            descricao: 'Leitura(4), Escrita(2), Execução(1). Dono total (7) e outros leem/executam (5).',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Redes e Protocolos',
        subtitulo: 'TCP/IP e Portas',
        corRamo: Color(0xFF10B981),
        icone: Icons.lan,
        itens: [
          MapaMentalItem(
            titulo: 'Portas Cruciais',
            descricao: 'HTTPS (443), HTTP (80), DNS (53), SMTP (587), SSH (22).',
          ),
          MapaMentalItem(
            titulo: 'E-mails: SMTP vs IMAP',
            descricao: 'SMTP envia. IMAP sincroniza na nuvem. POP3 baixa e apaga.',
            mnemonico: 'SMTP = Sua Mensagem Tá Partindo',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Segurança e Ataques',
        subtitulo: 'C.I.D.A.N e Assinatura Digital',
        corRamo: Color(0xFFDC2626),
        icone: Icons.security,
        itens: [
          MapaMentalItem(
            titulo: 'Assinatura Digital',
            descricao: 'Gera Hash e criptografa com a CHAVE PRIVADA do emissor.',
            mnemonico: 'Assina com a Privada, valida com a Pública!',
          ),
          MapaMentalItem(
            titulo: 'Ransomware vs Phishing',
            descricao: 'Ransomware sequestra com cripto e resgate; Phishing pesca senhas com links falsos.',
          ),
        ],
      ),
    ],
  ),
  questoes: const [
    QuestaoModel(
      id: 801,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Noções de Informática',
      assunto: 'Atalhos de Teclado no Windows',
      enunciado: 'Para bloquear de forma rápida e segura a sessão do usuário no Windows 11 sem encerrar os programas abertos, deve-se pressionar a combinação de teclas:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Ctrl + Alt + F4',
        'B': 'Win + L',
        'C': 'Win + D',
        'D': 'Shift + Esc',
        'E': 'Alt + Tab',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Win + L)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• B) CORRETA. A tecla Windows associada à letra L (Lock) trava e bloqueia instantaneamente a estação de trabalho, preservando os processos em segundo plano.''',
    ),
    QuestaoModel(
      id: 802,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Noções de Informática',
      assunto: 'Segurança e Malwares',
      enunciado: 'O ataque malicioso caracterizado pelo envio de mensagens falsas (e-mails, mensagens instantâneas) simulando instituições financeiras ou órgãos oficiais com o intuito de induzir a vítima a fornecer dados pessoais e bancários é conhecido como:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Phishing',
        'B': 'Ransomware',
        'C': 'Spyware de hardware',
        'D': 'Desfragmentador de disco',
        'E': 'Firewall corporativo',
      },
      gabaritoOficial: 'A',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: A (Phishing)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• A) CORRETA. O termo "Phishing" deriva de pescaria: o atacante lança uma isca fraudulenta (e-mail ou link clone) para fisgar senhas e dados confidenciais do usuário.''',
    ),
    QuestaoModel(
      id: 803,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Noções de Informática',
      assunto: 'Protocolos de Redes e Internet',
      enunciado: 'No âmbito da arquitetura TCP/IP, qual protocolo é o responsável pelo envio de mensagens de correio eletrônico entre clientes e servidores de e-mail?',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'IMAP',
        'B': 'POP3',
        'C': 'SMTP',
        'D': 'FTP',
        'E': 'DNS',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (SMTP)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• C) CORRETA. Mnemônico CRAVOU: SMTP ("Sua Mensagem Tá Partindo") é o protocolo de envio de mensagens de e-mail. IMAP e POP3 são de recebimento.''',
    ),
    QuestaoModel(
      id: 804,
      banca: 'Instituto AOCP',
      orgao: 'Polícia Científica',
      cargo: 'Perito Criminal / Papiloscopista',
      ano: 2024,
      disciplina: 'Noções de Informática',
      assunto: 'Criptografia e Assinatura Digital',
      enunciado: 'Em relação aos conceitos de criptografia e assinatura digital, para que um remetente assine digitalmente um documento eletrônico garantindo a sua autenticidade e o não repúdio, ele deve utilizar:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'A chave pública do destinatário.',
        'B': 'A chave privada do destinatário.',
        'C': 'A sua própria chave privada.',
        'D': 'A sua própria chave pública.',
        'E': 'A chave simétrica compartilhada.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (A sua própria chave privada)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• C) CORRETA. Regra de Ouro AlfaCon/CRAVOU: A assinatura digital é cifrada com a CHAVE PRIVADA do emissor (garantindo que somente ele gerou o resumo) e conferida com a CHAVE PÚBLICA do emissor por qualquer terceiro.''',
    ),
    QuestaoModel(
      id: 805,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Noções de Informática',
      assunto: 'Sistema Operacional Linux',
      enunciado: 'No sistema operacional Linux, qual comando é empregado para alterar as permissões de acesso de leitura, gravação e execução sobre arquivos ou diretórios?',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'chown',
        'B': 'chmod',
        'C': 'chgrp',
        'D': 'umask',
        'E': 'ls -la',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (chmod)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• B) CORRETA. O comando `chmod` (change mode) altera permissões de leitura (4), escrita (2) e execução (1). O comando `chown` altera o proprietário (*owner*).''',
    ),
  ],
);

/// Acervo Oficial de Informática da PM-PE
class InformaticaConteudoOficial {
  InformaticaConteudoOficial._();

  static final List<AulaGuiaItem> aulas = [
    aulaGuiaItemInformatica01,
  ];

  static ModuloGuiaEstudo get moduloGuiaEstudo {
    return ModuloGuiaEstudo(
      id: 'informatica_pmpe',
      nome: 'Noções de Informática (Oficial PM-PE)',
      icone: '💻',
      corBadge: const Color(0xFF0284C7),
      totalAulas: aulas.length,
      totalQuestoes: aulaGuiaItemInformatica01.questoes?.length ?? 15,
      aulas: aulas,
    );
  }
}
