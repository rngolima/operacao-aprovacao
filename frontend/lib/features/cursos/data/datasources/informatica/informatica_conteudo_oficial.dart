import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import '../../models/mapa_mental_model.dart';

/// Aula 01 Oficial de Informática (Soldado PM-PE)
final aulaGuiaItemInformatica01 = AulaGuiaItem(
  numero: '01',
  titulo: 'Hardware, Windows 10/11, Linux, Protocolos de Rede e Segurança (Ransomware & Phishing)',
  detalhes: '18 min • Método CRAVOU • 15 questões comentadas',
  concluida: false,
  destaque: true,
  conteudoTeorico: '''# INFORMÁTICA TÁTICA: HARDWARE, SISTEMAS, REDES E SEGURANÇA DA INFORMAÇÃO

## 1. HARDWARE E SISTEMAS OPERACIONAIS
- **Hierarquia de Memórias**:
  - *Registradores da CPU*: Mais rápidos e de menor capacidade.
  - *Memória Cache (L1, L2, L3)*: Memória ultra rápida integrada ao processador para acelerar dados repetitivos.
  - *Memória RAM*: Memória principal de trabalho, volátil (perde o conteúdo quando o computador é desligado).
  - *Memória ROM*: Não volátil, somente de leitura, armazena o BIOS/UEFI e a rotina de POST.
- **Atalhos Essenciais do Windows 10/11**:
  - `Win + L`: Bloqueia o computador instantaneamente (*Lock*).
  - `Win + D`: Minimiza tudo e exibe a Área de Trabalho (*Desktop*).
  - `Win + Shift + S`: Captura de tela interativa recortada.
  - `Ctrl + Shift + Esc`: Abre direto o Gerenciador de Tarefas.
- **Comandos Básicos do Terminal Linux**:
  - `pwd`: Mostra o diretório corrente de trabalho.
  - `ls -la`: Lista todos os arquivos e diretórios com permissões detalhadas.
  - `chmod`: Altera permissões de acesso (leitura `r`, escrita `w`, execução `x`).
  - `grep`: Procura termos e padrões de texto dentro de arquivos.

---

## 2. SUÍTE DE ESCRITÓRIO (WORD/EXCEL VS LIBREOFFICE WRITER/CALC)
- **Extensões de Arquivos Nativas**:
  - Microsoft Word: `.docx` | LibreOffice Writer: `.odt`
  - Microsoft Excel: `.xlsx` | LibreOffice Calc: `.ods`
- **Fórmulas Matemáticas em Planilhas**:
  - `=SOMA(A1:A5)`: Soma todos os valores da célula A1 até A5 (dois pontos = intervalo contínuo).
  - `=SOMA(A1;A5)`: Soma exclusivamente a célula A1 e a célula A5 (ponto e vírgula = elementos pontuais).
  - `=MÉDIA(A1:A5)`: Calcula a média aritmética das células do intervalo.
  - `=SE(teste_lógico; valor_se_verdadeiro; valor_se_falso)`: Função condicional lógica.

---

## 3. REDES DE COMPUTADORES E PROTOCOLOS DA INTERNET
- **Classificação por Extensão**:
  - `PAN`: Rede pessoal (Bluetooth).
  - `LAN`: Rede local (computadores do quartel ou prédio).
  - `MAN`: Rede metropolitana (conecta batalhões pela cidade).
  - `WAN`: Rede de alcance global (a Internet mundial).
- **Protocolos Mais Cobrados**:
  - `HTTP` (Porta 80): Comunicação web sem criptografia.
  - `HTTPS` (Porta 443): Comunicação web segura com criptografia SSL/TLS.
  - `DNS` (Porta 53): Converte endereços textuais em números IP.
  - `SMTP` (Porta 587): Protocolo de envio de e-mails (*Sua Mensagem Tá Partindo*).
  - `IMAP` (Porta 143/993): Recebimento com sincronização na nuvem (mensagens mantidas no servidor).
  - `POP3` (Porta 110): Recebimento com download para a máquina e deleção do servidor.

---

## 4. SEGURANÇA DA INFORMAÇÃO E AMEAÇAS CIBERNÉTICAS
- **Os 5 Princípios da Segurança (C.I.D.A.N)**:
  - **C**onfidencialidade: Sigilo dos dados contra olhares não autorizados.
  - **I**ntegridade: Proteção contra modificações ou corrupção indevida.
  - **D**isponibilidade: Sistema no ar e acessível quando requisitado.
  - **A**utenticidade: Certeza incontestável de quem produziu a informação.
  - **N**ão Repúdio: Impossibilidade jurídica de negar a prática de uma ação.
- **Malwares em Concursos**:
  - *Ransomware*: Código malicioso que criptografa os arquivos do sistema e exige resgate financeiro para restaurá-los.
  - *Phishing*: Isca por e-mail ou link falso que simula portais oficiais para roubar credenciais e senhas da vítima.
  - *Worm*: Malware que se replica sozinho pela rede através de falhas, sem necessitar de arquivo hospedeiro nem de ação do usuário.

---

## 5. NUVEM (CLOUD COMPUTING) & PROCEDIMENTOS DE BACKUP
- **Modelos de Nuvem (SPI)**:
  - *SaaS*: Software pronto na nuvem (Google Drive, Gmail, Office 365).
  - *PaaS*: Ambiente de desenvolvimento e hospedagem de aplicações.
  - *IaaS*: Infraestrutura bruta, servidores virtuais e armazenamento (AWS, Azure).
- **Tipos de Backup (Decoreba AOCP)**:
  - *Backup Completo (Full)*: Copia tudo e desmarca o atributo de arquivo.
  - *Backup Incremental*: Copia arquivos criados/alterados desde o último backup (seja full ou incremental). Mais rápido para gravar, mais lento para restaurar.
  - *Backup Diferencial*: Copia arquivos criados/alterados desde o último backup COMPLETO. Não desmarca o atributo. Restauração rápida (Full + Último Diferencial).''',
  mapaMental: const MapaMentalData(
    titulo: 'INFORMÁTICA: HARDWARE, REDES E SEGURANÇA',
    conceitoCentral: 'Memórias, Atalhos do Windows, Protocolos TCP/IP e Proteção contra Malwares (Ransomware/Phishing).',
    regraDeOuro: 'RAM é Volátil! Win+L bloqueia tela! HTTPS porta 443 é seguro! Ransomware criptografa arquivos e pede resgate!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Hardware e Memórias',
        subtitulo: 'RAM vs ROM',
        corRamo: Color(0xFF0284C7),
        icone: Icons.memory,
        itens: [
          MapaMentalItem(
            titulo: 'RAM',
            descricao: 'Memória principal volátil de execução de programas.',
            mnemonico: 'Desligou o PC = Perdeu dados da RAM',
          ),
          MapaMentalItem(
            titulo: 'ROM',
            descricao: 'Não volátil, gravada de fábrica para inicializar a BIOS/POST.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Atalhos do Windows',
        subtitulo: 'Win+L e Win+D',
        corRamo: Color(0xFF2563EB),
        icone: Icons.keyboard,
        itens: [
          MapaMentalItem(
            titulo: 'Win + L',
            descricao: 'Bloqueia o computador imediatamente para segurança.',
            mnemonico: 'L de Lock (Travar tela)',
          ),
          MapaMentalItem(
            titulo: 'Win + D',
            descricao: 'Minimiza todas as janelas e revela o Desktop.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Protocolos de Rede',
        subtitulo: 'HTTPS, SMTP e IMAP',
        corRamo: Color(0xFF10B981),
        icone: Icons.lan,
        itens: [
          MapaMentalItem(
            titulo: 'HTTPS (443)',
            descricao: 'Navegação criptografada com certificados SSL/TLS.',
          ),
          MapaMentalItem(
            titulo: 'SMTP vs IMAP',
            descricao: 'SMTP: Envia e-mail. IMAP: Recebe e sincroniza na nuvem.',
            mnemonico: 'SMTP = Sua Mensagem Tá Partindo',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Ameaças Virtuais',
        subtitulo: 'Ransomware e Phishing',
        corRamo: Color(0xFFDC2626),
        icone: Icons.security,
        itens: [
          MapaMentalItem(
            titulo: 'Ransomware',
            descricao: 'Criptografa dados da vítima e exige resgate em dinheiro.',
            mnemonico: 'Criptografia + Resgate = Ransomware',
          ),
          MapaMentalItem(
            titulo: 'Phishing',
            descricao: 'Páginas e e-mails falsificados como isca para roubar senhas.',
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
