const path = require('path');
const { formatarCadernoCravou } = require('./gerador_caderno_cravou');

async function gerar() {
  const cadernoInformatica = {
    disciplina: 'Noções de Informática Tática',
    subtitulo: 'Hardware, Sistemas Operacionais (Windows/Linux), Redes, Segurança e Nuvem',
    banca: 'Instituto AOCP',
    concurso: 'PM-PE • Soldado da Polícia Militar',
    arquivoSaida: path.join(__dirname, 'CRAVOU_PMPE_Informatica_Caderno_Oficial.pdf'),
    topicos: [
      {
        titulo: 'Hardware, Arquitetura e Hierarquia de Memórias',
        itens: [
          { texto: 'Hierarquia de velocidade: Registradores (CPU) > Memória Cache (SRAM L1/L2/L3) > Memória RAM (DRAM volátil) > SSD (NVMe/SATA Flash) > HDD (magnético mecânico).' },
          { texto: 'Memória RAM é de acesso aleatório, de trabalho temporário e VOLÁTIL (ao desligar o computador os dados são perdidos).' },
          { texto: 'Memória ROM é permanente e não volátil gravada na placa-mãe. Armazena o firmware básico: BIOS/UEFI e a rotina POST (autoteste da inicialização).' },
          { tipo: 'destaque', texto: 'A memória Cache não precisa de refresh periódico (SRAM) e foi criada especificamente para mitigar o gargalo de velocidade entre CPU e Memória RAM.' }
        ]
      },
      {
        titulo: 'Sistemas Operacionais: Microsoft Windows 10/11 & Linux',
        itens: [
          { texto: 'Atalhos de Ouro do Windows: Win + L (Bloqueia sessão); Win + D (Mostra Desktop); Win + E (Explorador); Win + V (Histórico da área de transferência); Ctrl + Shift + Esc (Gerenciador de Tarefas direto).' },
          { texto: 'Segurança no Windows: BitLocker realiza criptografia completa do disco exigindo chip TPM. Windows Defender traz proteção em tempo real e proteção contra ransomware.' },
          { texto: 'Linux: Kernel livre, multiusuário, multitarefa preemptivo e Case-Sensitive (diferencia maiúsculas de minúsculas).' },
          { texto: 'Diretórios Linux: /bin (executáveis gerais); /sbin (executáveis do root); /etc (configurações do sistema); /home (pastas pessoais dos usuários comuns); /var (arquivos variáveis e logs).' },
          { tipo: 'mnemonico', texto: 'CHMOD Permissões Octais: Leitura (r=4), Escrita (w=2), Execução (x=1). Exemplo: chmod 755 = Dono 7 (rwx), Grupo 5 (r-x), Outros 5 (r-x).' }
        ]
      },
      {
        titulo: 'Suítes de Escritório: Microsoft Office vs LibreOffice',
        itens: [
          { texto: 'Extensões: Word (.docx) vs LibreOffice Writer (.odt); Excel (.xlsx) vs LibreOffice Calc (.ods).' },
          { texto: 'Fórmulas em Planilhas: =SOMA(A1:A5) soma de A1 ATÉ A5 (dois pontos = intervalo contínuo). =SOMA(A1;A5) soma apenas A1 E A5 (ponto e vírgula = elementos pontuais).' },
          { texto: 'Funções Mais Cobradas: =CONT.SE(intervalo; critério), =SOMASE(intervalo; critério), =SE(teste; valor_v; valor_f).' },
          { tipo: 'destaque', texto: 'Trancamento de referências: O cifrão ($) fixa coluna ou linha para o auto-preenchimento. $A$1 fixa ambos; A$1 fixa apenas a linha.' }
        ]
      },
      {
        titulo: 'Redes de Computadores e Modelo OSI / TCP-IP',
        itens: [
          { texto: 'Classificação Geográfica: PAN (Pessoal/Bluetooth) < LAN (Local/Edifício) < MAN (Metropolitana) < WAN (Longa Distância/Internet).' },
          { texto: 'Equipamentos: Hub (Camada 1 - difusão por broadcast com colisão); Switch (Camada 2 - baseado em MAC address via unicast); Roteador (Camada 3 - baseado em endereços lógicos IP).' },
          { texto: 'Portas Cruciais: HTTP (80), HTTPS (443 - SSL/TLS), DNS (53 - converte URLs em IPs), DHCP (67/68 - distribui IPs dinâmicos), SSH (22 - terminal criptografado).' },
          { tipo: 'mnemonico', texto: 'E-mails: SMTP ("Sua Mensagem Tá Partindo" - envio porta 587); POP3 (recebe e baixa na máquina); IMAP (recebe e sincroniza na nuvem).' }
        ]
      },
      {
        titulo: 'Segurança da Informação, Malwares e Criptografia',
        itens: [
          { tipo: 'mnemonico', texto: 'Princípios Básicos (C.I.D.A.N): Confidencialidade, Integridade, Disponibilidade, Autenticidade, Não Repúdio (irretratabilidade).' },
          { texto: 'Ransomware: Código malicioso que sequestra ou criptografa os arquivos do usuário exigindo resgate (geralmente em criptomoeda).' },
          { texto: 'Worm: Verme autônomo que se propaga sozinho pela rede sem necessidade de hospedeiro nem de clique do usuário.' },
          { texto: 'Trojan: Cavalo de Troia disfarçado de programa útil que abre portas dos fundos (backdoors) para invasão externa.' },
          { tipo: 'destaque', texto: 'Assinatura Digital: O emissor cifra o Hash do documento com a sua própria CHAVE PRIVADA. O receptor valida com a CHAVE PÚBLICA do emissor. Garante Integridade, Autenticidade e Não Repúdio.' }
        ]
      }
    ],
    questoes: [
      {
        banca: 'Instituto AOCP',
        orgao: 'PM-PE',
        assunto: 'Protocolos de Rede (TCP/IP)',
        enunciado: 'No âmbito dos protocolos da arquitetura TCP/IP, qual protocolo é o responsável pelo envio de mensagens de correio eletrônico entre clientes e servidores de e-mail?',
        alternativas: {
          'A': 'IMAP',
          'B': 'POP3',
          'C': 'SMTP',
          'D': 'FTP',
          'E': 'DNS'
        },
        gabarito: 'C (SMTP)',
        comentario: 'CRAVOU! O protocolo SMTP (Simple Mail Transfer Protocol - "Sua Mensagem Tá Partindo") opera no envio de mensagens de e-mail. IMAP e POP3 atuam no recebimento.'
      },
      {
        banca: 'Instituto AOCP',
        orgao: 'PM-PE',
        assunto: 'Malwares e Ameaças Virtuais',
        enunciado: 'Um tipo de código malicioso que tem sido muito frequente em ataques consiste na infecção do computador e sequestro de arquivos mediante criptografia, exigindo o pagamento de resgate para recuperação. Trata-se do:',
        alternativas: {
          'A': 'Spyware',
          'B': 'Worm',
          'C': 'Ransomware',
          'D': 'Rootkit',
          'E': 'Keylogger'
        },
        gabarito: 'C (Ransomware)',
        comentario: 'CRAVOU! Ransomware é a classe de malware voltada para extorsão cibernética, sequestrando arquivos locais através de criptografia e cobrando resgate.'
      },
      {
        banca: 'Instituto AOCP',
        orgao: 'Polícia Científica',
        assunto: 'Criptografia e Assinatura Digital',
        enunciado: 'Para que um remetente assine digitalmente um documento eletrônico garantindo a sua autenticidade e o não repúdio, ele deve utilizar:',
        alternativas: {
          'A': 'A chave pública do destinatário.',
          'B': 'A chave privada do destinatário.',
          'C': 'A sua própria chave privada.',
          'D': 'A sua própria chave pública.',
          'E': 'A chave simétrica compartilhada.'
        },
        gabarito: 'C (Sua própria chave privada)',
        comentario: 'CRAVOU! Regra de Ouro: A assinatura digital é gerada com a CHAVE PRIVADA do emissor (somente ele possui) e validada por qualquer terceiro com a CHAVE PÚBLICA do emissor.'
      }
    ]
  };

  const gerado = await formatarCadernoCravou(cadernoInformatica);
  console.log('Caderno de Informática CRAVOU gerado com sucesso:', gerado);
}

gerar().catch(console.error);
