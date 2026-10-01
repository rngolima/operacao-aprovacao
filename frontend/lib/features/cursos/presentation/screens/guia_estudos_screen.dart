import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../../core/state/plano_estudo_state.dart';
import '../../../admin/data/services/admin_content_service.dart';
import '../../../questoes/data/models/questao_model.dart';
import '../../data/datasources/direito_constitucional/constitucional_conteudo_oficial.dart';
import '../../data/datasources/direito_penal/direito_penal_conteudo_oficial.dart';
import '../../data/datasources/portugues/portugues_conteudo_oficial.dart';
import '../../data/models/aula_guia_model.dart';
import '../../data/models/mapa_mental_model.dart';
import 'aula_detalhe_screen.dart';

/// Tela do Guia de Estudos Oficial (Inspirada na arquitetura do QConcursos).
/// Exibe a trilha por disciplinas do edital com aulas em síntese didática,
/// questões práticas e priorização inteligente pelas maiores dificuldades do candidato.
class GuiaEstudosScreen extends StatefulWidget {
  final String? concursoNome;
  final List<String>? disciplinasFoco;

  const GuiaEstudosScreen({
    super.key,
    this.concursoNome,
    this.disciplinasFoco,
  });

  @override
  State<GuiaEstudosScreen> createState() => _GuiaEstudosScreenState();
}

class _GuiaEstudosScreenState extends State<GuiaEstudosScreen> {
  final Map<String, bool> _moduloAberto = {};
  bool _mostrarApenasFoco = true;
  bool _priorizarDificuldades = true;

  @override
  void initState() {
    super.initState();
    _mostrarApenasFoco = widget.disciplinasFoco != null && widget.disciplinasFoco!.isNotEmpty;
    PlanoEstudoState.instance.addListener(_onPlanoMudou);
    AdminContentService.instance.addListener(_onPlanoMudou);
  }

  @override
  void dispose() {
    PlanoEstudoState.instance.removeListener(_onPlanoMudou);
    AdminContentService.instance.removeListener(_onPlanoMudou);
    super.dispose();
  }

  void _onPlanoMudou() {
    if (mounted) setState(() {});
  }

  bool _deveExibirModulo(String nomeModulo) {
    if (!_mostrarApenasFoco || widget.disciplinasFoco == null || widget.disciplinasFoco!.isEmpty) {
      return true;
    }
    final modLower = nomeModulo.toLowerCase();
    return widget.disciplinasFoco!.any((foco) {
      final fLower = foco.toLowerCase();
      return modLower.contains(fLower) || fLower.contains(modLower);
    });
  }

  // Mock de Questões Didáticas Vinculadas para a Aula de Crase
  final List<QuestaoModel> _questoesCrase = const [
    QuestaoModel(
      id: 1,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Crase & Regência',
      enunciado: 'No trecho: "O policial civil obedeceu a ordens emanadas de seus superiores hierárquicos sem hesitar.", o emprego do acento grave indicativo de crase no vocábulo "a" seria gramaticalmente obrigatório.',
      gabaritoOficial: 'ERRADO',
      comentarioDidatico: 'CRAVOU NO ERRO! Regra de Ouro da banca: "A" no singular diante de palavra no plural não tem crase ("a ordens"). O termo "ordens" está no plural e o "a" está desprovido de artigo feminino plural ("as"). Se houvesse crase, teria de ser "às ordens". Logo, o item está ERRADO.',
    ),
    QuestaoModel(
      id: 2,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Regência & Pronome Relativo',
      enunciado: 'A correção gramatical do texto seria mantida caso o segmento "o cargo que aspiro" fosse reescrito como "o cargo a que aspiro".',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO ACERTO! O verbo "aspirar", no sentido de desejar, almejar ou pretender, é transitivo indireto e rege a preposição "A" (aspirar A algo). Quando antecedido de pronome relativo ("que"), a preposição regida pelo verbo deve ser anteposta ao pronome relativo: "o cargo A que aspiro". Item CERTO.',
    ),
  ];

  // Mock de Questões da PMPE (História de PE)
  final List<QuestaoModel> _questoesHistoriaPe = const [
    QuestaoModel(
      id: 3,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'História de Pernambuco',
      assunto: 'Invasões Holandesas',
      enunciado: 'Durante o domínio holandês em Pernambuco sob a administração de Maurício de Nassau (1637-1644), a política de tolerância religiosa e os investimentos urbanísticos na Cidade Maurícia marcaram o apogeu da presença neerlandesa no Nordeste açucareiro.',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO ACERTO! O governo de Maurício de Nassau notabilizou-se pela liberdade de culto (concedida a católicos, calvinistas e judeus), embelezamento do Recife, saneamento e estímulo às artes e ciências, sendo considerado o período de ouro da ocupação holandesa.',
    ),
    QuestaoModel(
      id: 4,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'História de Pernambuco',
      assunto: 'Revolução Pernambucana de 1817',
      enunciado: 'A Revolução Pernambucana de 1817 instaurou uma república independente de caráter provisório em Pernambuco, motivada pela insatisfação com os altos impostos cobrados pela Coroa portuguesa sediada no Rio de Janeiro e pelas secas no Nordeste.',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO ACERTO! O movimento de 1817 proclamou a República de Pernambuco, com liberdade de imprensa e culto, opondo-se ao absolutismo monárquico joanino e à pesada carga tributária que financiava a corte no Rio.',
    ),
  ];

  // ========================================================================
  // GRADE COMPLETA E RIGOROSA DO CONTEÚDO PROGRAMÁTICO DA PM-PE (AOCP)
  // 6 DISCIPLINAS OFICIAIS • 10 QUESTÕES CADA • TOTAL 60 QUESTÕES
  // ========================================================================
  List<ModuloGuiaEstudo> _obterModulosPmpe() {
    final baseModulos = <ModuloGuiaEstudo>[
      PortuguesConteudoOficial.moduloGuiaEstudo,
      ModuloGuiaEstudo(
        id: 'historia',
        nome: 'História de Pernambuco',
        icone: '⚔️',
        corBadge: const Color(0xFF15803D),
        totalAulas: 7,
        totalQuestoes: 38,
        aulas: [
          AulaGuiaItem(
            numero: '01',
            titulo: 'Ocupação Pré-Colonial, Capitania Hereditária de Duarte Coelho e Economia Açucareira',
            detalhes: '14 min • Formação Social e Econômica • 8 questões',
            concluida: true,
            questoes: _questoesHistoriaPe,
          ),
          AulaGuiaItem(
            numero: '02',
            titulo: 'As Invasões Holandesas e o Governo de Maurício de Nassau no Recife (1637-1644)',
            detalhes: '16 min • Tolerância Religiosa e Urbanismo • 10 questões',
            concluida: false,
            destaque: true,
            questoes: _questoesHistoriaPe,
          ),
          AulaGuiaItem(
            numero: '03',
            titulo: 'A Insurreição Pernambucana e a Batalha dos Guararapes (1645-1654)',
            detalhes: '12 min • Expulsão Neerlandesa e Sentimento Nativista • 8 questões',
            concluida: false,
          ),
          AulaGuiaItem(
            numero: '04',
            titulo: 'A Guerra dos Mascates (1710-1711) e o Conflito entre Nobreza de Olinda e Comerciantes do Recife',
            detalhes: '12 min • Autonomia Política • 8 questões',
            concluida: false,
          ),
          AulaGuiaItem(
            numero: '05',
            titulo: 'A Revolução Pernambucana de 1817: República Provisória e Ruptura com a Coroa Joanina',
            detalhes: '15 min • Marco Revolucionário • 12 questões',
            concluida: false,
            questoes: _questoesHistoriaPe,
          ),
          AulaGuiaItem(
            numero: '06',
            titulo: 'A Confederação do Equador (1824) e a Luta Republicana de Frei Caneca',
            detalhes: '14 min • Constituição Outorgada de 1824 • 10 questões',
            concluida: false,
          ),
          AulaGuiaItem(
            numero: '07',
            titulo: 'A Revolução Praieira (1848) e Movimentos Político-Sociais em Pernambuco',
            detalhes: '12 min • Manifesto ao Mundo • 8 questões',
            concluida: false,
          ),
        ],
      ),
      ModuloGuiaEstudo(
        id: 'rlm',
        nome: 'Raciocínio Lógico Matemático',
        icone: '📐',
        corBadge: const Color(0xFF6366F1),
        totalAulas: 7,
        totalQuestoes: 40,
        aulas: [
          AulaGuiaItem(
            numero: '01',
            titulo: 'Estrutura Lógica de Relações Arbitrárias entre Pessoas, Lugares e Objetos',
            detalhes: '14 min • Associação Lógica • 10 questões',
            concluida: false,
            destaque: true,
          ),
          AulaGuiaItem(
            numero: '02',
            titulo: 'Lógica Proposicional: Proposições Simples/Compostas e Conectivos (e, ou, se...então)',
            detalhes: '16 min • Fundamentos Proposicionais • 12 questões',
            concluida: false,
          ),
          AulaGuiaItem(
            numero: '03',
            titulo: 'Construção de Tabelas-Verdade, Tautologia, Contradição e Contingência',
            detalhes: '15 min • Métodos Rápidos de Resolução • 12 questões',
            concluida: false,
          ),
          AulaGuiaItem(
            numero: '04',
            titulo: 'Equivalências Lógicas e Aplicação Rigorosa das Leis de De Morgan',
            detalhes: '14 min • Fórmulas Essenciais AOCP • 14 questões',
            concluida: false,
            destaque: true,
          ),
          AulaGuiaItem(
            numero: '05',
            titulo: 'Negação de Proposições Compostas e Condicionais (Regra do MANÉ)',
            detalhes: '12 min • Macetes Práticos de Prova • 12 questões',
            concluida: false,
          ),
          AulaGuiaItem(
            numero: '06',
            titulo: 'Diagramas Lógicos, Operações com Conjuntos e Quantificadores (Todo, Algum, Nenhum)',
            detalhes: '14 min • Interseção e Negação • 10 questões',
            concluida: false,
          ),
          AulaGuiaItem(
            numero: '07',
            titulo: 'Princípios de Contagem (Arranjo, Combinação e Permutação) e Probabilidade Básica',
            detalhes: '15 min • Análise Combinatória para Concursos • 10 questões',
            concluida: false,
          ),
        ],
      ),
      ModuloGuiaEstudo(
        id: 'informatica',
        nome: 'Noções de Informática',
        icone: '💻',
        corBadge: const Color(0xFF0284C7),
        totalAulas: 7,
        totalQuestoes: 36,
        aulas: [
          AulaGuiaItem(
            numero: '01',
            titulo: 'Hardware: Processadores, Memórias (RAM, ROM, Cache), Barramentos e Periféricos',
            detalhes: '12 min • Arquitetura de Computadores • 8 questões',
            concluida: false,
          ),
          AulaGuiaItem(
            numero: '02',
            titulo: 'Sistemas Operacionais: Windows 10/11 (Atalhos de Teclado, Gerenciador de Tarefas e Painel)',
            detalhes: '14 min • Recursos Práticos do Sistema • 10 questões',
            concluida: false,
          ),
          AulaGuiaItem(
            numero: '03',
            titulo: 'Conceitos Básicos do Ambiente Linux (Estrutura de Diretórios e Comandos do Terminal)',
            detalhes: '12 min • Comandos Essenciais para Concursos • 8 questões',
            concluida: false,
          ),
          AulaGuiaItem(
            numero: '04',
            titulo: 'Pacote Microsoft Office (Word e Excel) e LibreOffice (Writer e Calc)',
            detalhes: '15 min • Fórmulas do Excel e Formatação • 12 questões',
            concluida: false,
          ),
          AulaGuiaItem(
            numero: '05',
            titulo: 'Redes de Computadores, Conceitos de Internet/Intranet, Navegadores Web e E-mail',
            detalhes: '12 min • Protocolos (HTTP, HTTPS, TCP/IP, DNS) • 10 questões',
            concluida: false,
          ),
          AulaGuiaItem(
            numero: '06',
            titulo: 'Segurança da Informação: Vírus, Ransomware, Worms, Phishing, Engenharia Social e Backup',
            detalhes: '16 min • Ameaças e Mecanismos de Proteção • 15 questões',
            concluida: false,
            destaque: true,
          ),
          AulaGuiaItem(
            numero: '07',
            titulo: 'Armazenamento em Nuvem (Cloud Storage), Google Drive e Microsoft OneDrive',
            detalhes: '10 min • Sincronização e Compartilhamento • 8 questões',
            concluida: false,
          ),
        ],
      ),
      ConstitucionalConteudoOficial.moduloGuiaEstudo,
      DireitoPenalConteudoOficial.moduloGuiaEstudo,
      ModuloGuiaEstudo(
        id: 'direitos_humanos',
        nome: 'Direitos Humanos e Legislação Extravagante',
        icone: '⚖️',
        corBadge: const Color(0xFFDC2626),
        totalAulas: 7,
        totalQuestoes: 38,
        aulas: [
          AulaGuiaItem(
            numero: '01',
            titulo: 'Teoria Geral dos Direitos Humanos, Gerações/Dimensões de Direitos e Princípios Fundamentais',
            detalhes: '14 min • Conceitos Doutrinários • 10 questões',
            concluida: false,
          ),
          AulaGuiaItem(
            numero: '02',
            titulo: 'Declaração Universal dos Direitos Humanos (DUDH 1948 - ONU): Artigos e Aplicação Policial',
            detalhes: '15 min • Letra Integral da DUDH • 12 questões',
            concluida: false,
            destaque: true,
          ),
          AulaGuiaItem(
            numero: '03',
            titulo: 'Convenção Americana sobre Direitos Humanos (Pacto de San José da Costa Rica)',
            detalhes: '14 min • Direitos Civis e Políticos • 10 questões',
            concluida: false,
          ),
          AulaGuiaItem(
            numero: '04',
            titulo: 'Estatuto dos Policiais Militares do Estado de Pernambuco (Lei Estadual nº 6.783/1974)',
            detalhes: '18 min • Hierarquia, Disciplina, Direitos e Deveres • 15 questões',
            concluida: false,
            destaque: true,
          ),
          AulaGuiaItem(
            numero: '05',
            titulo: 'Lei de Abuso de Autoridade (Lei Federal nº 13.869/2019): Crimes e Sanções Administrativas',
            detalhes: '15 min • Condutas Típicas na Atividade Policial • 12 questões',
            concluida: false,
          ),
          AulaGuiaItem(
            numero: '06',
            titulo: 'Lei dos Crimes Hediondos (Lei nº 8.072/1990) e Lei de Tortura (Lei nº 9.455/1997)',
            detalhes: '14 min • Inafiançabilidade e Cumprimento de Pena • 12 questões',
            concluida: false,
          ),
          AulaGuiaItem(
            numero: '07',
            titulo: 'Estatuto do Desarmamento (Lei nº 10.826/2003) e Lei Maria da Penha (Lei nº 11.340/2006)',
            detalhes: '16 min • Tipos Penais e Medidas Protetivas • 12 questões',
            concluida: false,
          ),
        ],
      ),
    ];

    // Mescla aulas e materiais inseridos pelo Administrador em tempo real
    final customAulas = AdminContentService.instance.aulasCustomizadas;
    if (customAulas.isNotEmpty) {
      final List<ModuloGuiaEstudo> modulosAtualizados = [];
      for (final mod in baseModulos) {
        final aulasExtras = customAulas.where((a) {
          final modLower = mod.nome.toLowerCase();
          final discLower = a.disciplina.toLowerCase();
          return modLower.contains(discLower) || discLower.contains(modLower);
        }).map((a) {
          return AulaGuiaItem(
            numero: '${mod.aulas.length + 1}',
            titulo: a.titulo,
            detalhes: '${a.tempoLeitura} • Material Oficial Cravou',
            concluida: false,
            destaque: a.destaque,
            conteudoTeorico: a.conteudoTeorico,
          );
        }).toList();

        if (aulasExtras.isNotEmpty) {
          modulosAtualizados.add(ModuloGuiaEstudo(
            id: mod.id,
            nome: mod.nome,
            icone: mod.icone,
            corBadge: mod.corBadge,
            totalAulas: mod.totalAulas + aulasExtras.length,
            totalQuestoes: mod.totalQuestoes,
            aulas: [...mod.aulas, ...aulasExtras],
          ));
        } else {
          modulosAtualizados.add(mod);
        }
      }
      return modulosAtualizados;
    }

    return baseModulos;
  }

  void _abrirModalAjustarDificuldades() {
    final plano = PlanoEstudoState.instance;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 18,
                right: 18,
                top: 18,
                bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text('🎯', style: TextStyle(fontSize: 18)),
                          SizedBox(width: 8),
                          Text(
                            'Minhas Maiores Dificuldades',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: AppColors.brandNavy,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 20),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Selecione as disciplinas onde você mais erra ou tem receio na prova da PM-PE. Elas subirão imediatamente para o topo do seu Guia de Estudos com badge de prioridade tática máxima.',
                    style: TextStyle(fontSize: 12, color: AppColors.textSecondary, height: 1.35),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      'Raciocínio Lógico Matemático',
                      'Direito Constitucional',
                      'Língua Portuguesa',
                      'História de Pernambuco',
                      'Noções de Informática',
                      'Direitos Humanos e Legislação',
                    ].map((materia) {
                      final isSelected = plano.isMateriaDificuldade(materia);
                      return FilterChip(
                        avatar: Text(isSelected ? '⚠️' : '📚', style: const TextStyle(fontSize: 12)),
                        label: Text(
                          materia,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                            color: isSelected ? const Color(0xFF9A3412) : AppColors.textPrimary,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: const Color(0xFFFFEDD5),
                        backgroundColor: AppColors.surfaceElevated,
                        checkmarkColor: const Color(0xFFEA580C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: isSelected ? const Color(0xFFFB923C) : AppColors.surfaceBorder,
                            width: isSelected ? 1.5 : 1,
                          ),
                        ),
                        onSelected: (selected) {
                          plano.toggleMateriaDificuldade(materia);
                          setModalState(() {});
                          setState(() {});
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.brandNavy,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text(
                        'APLICAR PRIORIDADES TÁTICAS',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final plano = PlanoEstudoState.instance;
    final String concursoAtivo = widget.concursoNome ?? plano.concursoAlvo;
    final bool isPmpe = concursoAtivo.toUpperCase().contains('MILITAR') ||
        concursoAtivo.toUpperCase().contains('PMPE') ||
        concursoAtivo.toUpperCase().contains('PM-PE');

    // Módulos oficiais da PMPE ou gerais
    final modulosPmpe = _obterModulosPmpe();

    // Aplica a regra de priorização por dificuldade
    List<ModuloGuiaEstudo> modulosExibicao = List.from(modulosPmpe);
    if (_priorizarDificuldades) {
      modulosExibicao.sort((a, b) {
        final aDificuldade = plano.isMateriaDificuldade(a.nome);
        final bDificuldade = plano.isMateriaDificuldade(b.nome);
        if (aDificuldade && !bDificuldade) return -1;
        if (!aDificuldade && bDificuldade) return 1;
        return 0;
      });
    }

    // Filtra pelo modo foco se ativo
    if (_mostrarApenasFoco && widget.disciplinasFoco != null && widget.disciplinasFoco!.isNotEmpty) {
      modulosExibicao = modulosExibicao.where((m) => _deveExibirModulo(m.nome)).toList();
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0.5,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Guia de Estudos do Edital',
              style: AppTypography.heading3.copyWith(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              isPmpe ? 'PM-PE — Soldado da Polícia Militar • AOCP' : 'PC-PE — Agente de Polícia',
              style: AppTypography.caption.copyWith(fontSize: 12, color: AppColors.brandOrange, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card Unificado e Despoluído do Edital PM-PE com Inteligência de Dificuldades Integrada
            TacticalCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: isPmpe ? const Color(0xFF15803D) : AppColors.brandNavy,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.school_rounded, color: Colors.white, size: 22),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isPmpe ? 'Conteúdo Programático Oficial PM-PE' : 'Curso Reta Final PC-PE',
                              style: AppTypography.titleMedium.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              isPmpe
                                  ? 'Banca Instituto AOCP • 1.250 Vagas Soldado • 6 Disciplinas do Edital'
                                  : 'Banca Cebraspe • Material Autoral + Questões do Edital',
                              style: AppTypography.caption.copyWith(fontSize: 11.5),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Barra de Progresso Geral do Curso
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Progresso Global do Edital', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
                      Text('24% concluído (10/43 aulas)', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: AppColors.brandCobalt)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: 0.24,
                      minHeight: 5,
                      backgroundColor: AppColors.surfaceElevated,
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.brandCobalt),
                    ),
                  ),

                  const SizedBox(height: 12),
                  const Divider(height: 1, color: AppColors.surfaceBorder),
                  const SizedBox(height: 10),

                  // Seção Integrada e Compacta: Inteligência de Dificuldades CRAVOU
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text('🎯', style: TextStyle(fontSize: 14)),
                          SizedBox(width: 6),
                          Text(
                            'INTELIGÊNCIA DE DIFICULDADES CRAVOU',
                            style: TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF9A3412),
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: _abrirModalAjustarDificuldades,
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF7ED),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: const Color(0xFFFB923C)),
                          ),
                          child: const Text(
                            'AJUSTAR DIFICULDADES',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFFC2410C),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: [
                      ChoiceChip(
                        label: const Text('⭐ Priorizar Minhas Dificuldades', style: TextStyle(fontSize: 11)),
                        selected: _priorizarDificuldades,
                        selectedColor: const Color(0xFFEA580C),
                        labelStyle: TextStyle(
                          color: _priorizarDificuldades ? Colors.white : AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        onSelected: (val) {
                          setState(() => _priorizarDificuldades = true);
                        },
                      ),
                      ChoiceChip(
                        label: const Text('Ordem do Edital', style: TextStyle(fontSize: 11)),
                        selected: !_priorizarDificuldades,
                        selectedColor: AppColors.brandNavy,
                        labelStyle: TextStyle(
                          color: !_priorizarDificuldades ? Colors.white : AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        onSelected: (val) {
                          setState(() => _priorizarDificuldades = false);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Banner de Modo Foco (Meta de Hoje) - Versão Compacta e Elegante
            if (widget.disciplinasFoco != null && widget.disciplinasFoco!.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFBFDBFE)),
                ),
                child: Row(
                  children: [
                    const Text('📌', style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'FILTRADO: DISCIPLINAS DA META DE HOJE',
                            style: TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF1E3A8A),
                              letterSpacing: 0.3,
                            ),
                          ),
                          Text(
                            _mostrarApenasFoco
                                ? 'Exibindo apenas as matérias do seu planejamento de hoje.'
                                : 'Exibindo todo o edital programático.',
                            style: const TextStyle(fontSize: 10, color: Color(0xFF1D4ED8)),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => setState(() => _mostrarApenasFoco = !_mostrarApenasFoco),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        _mostrarApenasFoco ? 'VER TODAS' : 'SÓ DO DIA',
                        style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.w900, color: Color(0xFF1E3A8A)),
                      ),
                    ),
                  ],
                ),
              ),

            // Título da Seção de Disciplinas com Ações de Visualização Rápida
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _mostrarApenasFoco ? 'DISCIPLINAS DO DIA (FOCO)' : 'CONTEÚDO PROGRAMÁTICO (EDITAL AOCP)',
                  style: AppTypography.tagLabel.copyWith(
                    color: AppColors.textPrimary,
                    letterSpacing: 0.8,
                    fontSize: 12,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          for (final m in modulosExibicao) {
                            _moduloAberto[m.nome] = true;
                          }
                        });
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('Expandir', style: TextStyle(fontSize: 11, color: AppColors.brandCobalt, fontWeight: FontWeight.w600)),
                    ),
                    const Text('•', style: TextStyle(color: AppColors.surfaceBorder, fontSize: 10)),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          for (final m in modulosExibicao) {
                            _moduloAberto[m.nome] = false;
                          }
                        });
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('Recolher', style: TextStyle(fontSize: 11, color: AppColors.textSecondary, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Renderiza todos os módulos com ordenação inteligente e marcação de dificuldade
            ...modulosExibicao.asMap().entries.map((entry) {
              final index = entry.key;
              final modulo = entry.value;
              final ehDificuldade = plano.isMateriaDificuldade(modulo.nome);
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: _moduloCard(
                  nome: modulo.nome,
                  icone: modulo.icone,
                  totalAulas: modulo.totalAulas,
                  totalQuestoes: modulo.totalQuestoes,
                  corBadge: modulo.corBadge,
                  isDificuldade: ehDificuldade,
                  index: index,
                  aulas: modulo.aulas.map((aula) {
                    return _aulaItem(
                      numero: aula.numero,
                      titulo: aula.titulo,
                      detalhes: aula.detalhes,
                      concluida: aula.concluida,
                      destaque: aula.destaque,
                      onTap: () => _abrirAula(
                        modulo.nome,
                        'Aula ${aula.numero}: ${aula.titulo}',
                        questoes: aula.questoes,
                        conteudoTeorico: aula.conteudoTeorico,
                        mapaMental: aula.mapaMental,
                      ),
                    );
                  }).toList(),
                ),
              );
            }),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void _abrirAula(String disciplina, String titulo, {List<QuestaoModel>? questoes, String? conteudoTeorico, MapaMentalData? mapaMental}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AulaDetalheScreen(
          disciplina: disciplina,
          tituloAula: titulo,
          questoesVinculadas: questoes ?? _questoesCrase,
          conteudoTeorico: conteudoTeorico,
          mapaMental: mapaMental,
        ),
      ),
    );
  }

  Widget _moduloCard({
    required String nome,
    required String icone,
    required int totalAulas,
    required int totalQuestoes,
    required Color corBadge,
    required bool isDificuldade,
    int index = 0,
    required List<Widget> aulas,
  }) {
    final isOpen = _moduloAberto[nome] ??
        ((widget.disciplinasFoco != null && widget.disciplinasFoco!.isNotEmpty) || index == 0 || isDificuldade);

    return TacticalCard(
      padding: EdgeInsets.zero,
      borderColor: isDificuldade ? const Color(0xFFF97316) : null,
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _moduloAberto[nome] = !isOpen),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isDificuldade) ...[
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF7ED),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: const Color(0xFFFDBA74)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('⚠️', style: TextStyle(fontSize: 11)),
                          SizedBox(width: 4),
                          Text(
                            'PRIORIDADE TÁTICA • SUA MAIOR DIFICULDADE (CARGA REFORÇADA)',
                            style: TextStyle(
                              fontSize: 9.5,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFFC2410C),
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  Row(
                    children: [
                      Text(icone, style: const TextStyle(fontSize: 22)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nome,
                              style: AppTypography.titleMedium.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '$totalAulas aulas • $totalQuestoes questões oficiais AOCP',
                              style: AppTypography.caption.copyWith(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        isOpen ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (isOpen) ...[
            const Divider(height: 1, color: AppColors.surfaceBorder),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: aulas.length,
              separatorBuilder: (_, _) => const Divider(height: 1, color: AppColors.surfaceBorder),
              itemBuilder: (context, i) => aulas[i],
            ),
          ],
        ],
      ),
    );
  }

  Widget _aulaItem({
    required String numero,
    required String titulo,
    required String detalhes,
    required bool concluida,
    bool destaque = false,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: concluida
                    ? AppColors.success.withValues(alpha: 0.15)
                    : destaque
                        ? AppColors.brandOrange.withValues(alpha: 0.15)
                        : AppColors.surfaceElevated,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: concluida
                    ? const Icon(Icons.check, color: AppColors.success, size: 16)
                    : Text(
                        numero,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: destaque ? AppColors.brandOrange : AppColors.textPrimary,
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: destaque ? FontWeight.bold : FontWeight.w600,
                      color: destaque ? AppColors.brandOrange : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    detalhes,
                    style: AppTypography.caption.copyWith(fontSize: 10.5),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 12, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}
