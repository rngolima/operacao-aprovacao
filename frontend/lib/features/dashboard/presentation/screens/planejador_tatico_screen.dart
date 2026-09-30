import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../../core/state/plano_estudo_state.dart';
import '../../../questoes/presentation/screens/catalogo_questoes_screen.dart';

/// Modelo de dados de cada uma das 21 semanas do edital real da PM-PE (Instituto AOCP).
class SemanaCronograma {
  final int numero;
  final String periodo;
  final String faseNome;
  final int faseNumero;
  final String focoPrincipal;
  final String disciplina1;
  final String topicos1;
  final String disciplina2;
  final String topicos2;
  final int metaQuestoes;
  final String atividadeFimSemana;
  final bool isSemanaAtual;
  final bool isSemanaProva;

  const SemanaCronograma({
    required this.numero,
    required this.periodo,
    required this.faseNome,
    required this.faseNumero,
    required this.focoPrincipal,
    required this.disciplina1,
    required this.topicos1,
    required this.disciplina2,
    required this.topicos2,
    required this.metaQuestoes,
    required this.atividadeFimSemana,
    this.isSemanaAtual = false,
    this.isSemanaProva = false,
  });
}

/// Tela de Planejamento Tático de Estudos do Candidato CRAVOU.
///
/// Apresenta os números reais do Edital Oficial publicado em 30 de setembro de 2026:
/// - Banca: Instituto AOCP
/// - Vagas: 1.250 Soldado (1.320 certame)
/// - Prova Oficial: 21 de Fevereiro de 2027 (144 dias / 21 semanas)
/// - Cronograma completo detalhado da Semana 1 até o Dia da Prova (Semana 21).
class PlanejadorTaticoScreen extends StatefulWidget {
  const PlanejadorTaticoScreen({super.key});

  @override
  State<PlanejadorTaticoScreen> createState() => _PlanejadorTaticoScreenState();
}

class _PlanejadorTaticoScreenState extends State<PlanejadorTaticoScreen> {
  late int _horasPorDia;
  final int _diasAteProva = 144;
  final int _semanasAteProva = 21;
  final Set<String> _turnosSelecionados = {'🌙 Noite'};
  late Set<String> _materiasDificuldade;
  int _filtroFase = 0; // 0 = Todas, 1 = Fase 1, 2 = Fase 2, 3 = Fase 3, 4 = Fase 4
  bool _salvando = false;

  // Grade completa e oficial das 21 semanas da PM-PE (Instituto AOCP)
  late final List<SemanaCronograma> _cronograma21Semanas;

  @override
  void initState() {
    super.initState();
    _horasPorDia = PlanoEstudoState.instance.horasPorDia;
    _materiasDificuldade = Set.from(PlanoEstudoState.instance.materiasDificuldade);
    _cronograma21Semanas = _gerar21SemanasOficiais();
  }

  List<SemanaCronograma> _gerar21SemanasOficiais() {
    return [
      // FASE 1: FUNDAÇÃO TÁTICA (Semanas 1 a 5)
      const SemanaCronograma(
        numero: 1,
        periodo: '30/09 a 06/10/2026',
        faseNome: 'Fase 1 • Fundação Tática',
        faseNumero: 1,
        focoPrincipal: 'Compreensão de Texto e Art. 5º da CF/88',
        disciplina1: 'Língua Portuguesa (10 questões)',
        topicos1: 'Compreensão e Interpretação de Texto, Tipologia e Gêneros Textuais no padrão Instituto AOCP',
        disciplina2: 'Direito Constitucional (10 questões)',
        topicos2: 'Art. 5º da CF/88: Direitos Individuais e Coletivos (incisos I a XL) • Direito à Vida, Igualdade e Liberdade',
        metaQuestoes: 120,
        atividadeFimSemana: 'Auditoria de Erros + Teste Diagnóstico AOCP (30 questões)',
        isSemanaAtual: true,
      ),
      const SemanaCronograma(
        numero: 2,
        periodo: '07/10 a 13/10/2026',
        faseNome: 'Fase 1 • Fundação Tática',
        faseNumero: 1,
        focoPrincipal: 'História Colonial de PE & Lógica Proposicional',
        disciplina1: 'História de Pernambuco (10 questões)',
        topicos1: 'Capitanias Hereditárias, Duarte Coelho, Economia Açucareira e Formação da Sociedade Colonial',
        disciplina2: 'Raciocínio Lógico Matemático (10 questões)',
        topicos2: 'Lógica Proposicional: Proposições Simples e Compostas, Conectivos (e, ou, se... então, se e somente se)',
        metaQuestoes: 130,
        atividadeFimSemana: 'Caderno de 40 questões AOCP de RLM e História de PE',
      ),
      const SemanaCronograma(
        numero: 3,
        periodo: '14/10 a 20/10/2026',
        faseNome: 'Fase 1 • Fundação Tática',
        faseNumero: 1,
        focoPrincipal: 'Informática Básica & Direitos Humanos',
        disciplina1: 'Noções de Informática (10 questões)',
        topicos1: 'Conceitos de Hardware, Memórias, Periféricos, Arquitetura Básica e Dispositivos de Armazenamento',
        disciplina2: 'Direitos Humanos e Legislação (10 questões)',
        topicos2: 'Declaração Universal dos Direitos Humanos (DUDH 1948): Princípios Fundamentais e Dignidade da Pessoa Humana',
        metaQuestoes: 130,
        atividadeFimSemana: 'Mapeamento de Letra de Lei da DUDH + 35 questões',
      ),
      const SemanaCronograma(
        numero: 4,
        periodo: '21/10 a 27/10/2026',
        faseNome: 'Fase 1 • Fundação Tática',
        faseNumero: 1,
        focoPrincipal: 'Morfologia Portuguesa & Nacionalidade',
        disciplina1: 'Língua Portuguesa (10 questões)',
        topicos1: 'Classes de Palavras (Substantivo, Adjetivo, Pronomes e Emprego dos Verbos) e Ortografia Oficial',
        disciplina2: 'Direito Constitucional (10 questões)',
        topicos2: 'Nacionalidade (Art. 12 da CF) e Direitos Políticos (Art. 14 a 16 da CF)',
        metaQuestoes: 140,
        atividadeFimSemana: 'SIMULADO FASE 1 (60 Questões no Modelo AOCP)',
      ),
      const SemanaCronograma(
        numero: 5,
        periodo: '28/10 a 03/11/2026',
        faseNome: 'Fase 1 • Fundação Tática',
        faseNumero: 1,
        focoPrincipal: 'Período Nassau & Tabelas-Verdade',
        disciplina1: 'História de Pernambuco (10 questões)',
        topicos1: 'As Invasões Holandesas, Governo de Maurício de Nassau (1637-1644) e Insurreição Pernambucana',
        disciplina2: 'Raciocínio Lógico Matemático (10 questões)',
        topicos2: 'Construção de Tabelas-Verdade, Tautologia, Contradição e Contingência',
        metaQuestoes: 140,
        atividadeFimSemana: 'Caderno de 50 questões de Nassau e Tabelas-Verdade',
      ),

      // FASE 2: APROFUNDAMENTO TEÓRICO & EXERCÍCIOS AOCP (Semanas 6 a 10)
      const SemanaCronograma(
        numero: 6,
        periodo: '04/11 a 10/11/2026',
        faseNome: 'Fase 2 • Aprofundamento Teórico',
        faseNumero: 2,
        focoPrincipal: 'Sistemas Operacionais & Estatuto da PMPE',
        disciplina1: 'Noções de Informática (10 questões)',
        topicos1: 'Sistemas Operacionais Windows 10/11 e Conceitos de Linux (Estrutura de Diretórios e Comandos Básicos)',
        disciplina2: 'Legislação Extravagante (10 questões)',
        topicos2: 'Estatuto dos Policiais Militares de Pernambuco (Lei Estadual nº 6.783/1974) - Conceitos Iniciais e Hierarquia',
        metaQuestoes: 150,
        atividadeFimSemana: 'Flashcards da Lei 6.783/74 + Bateria de Informática',
      ),
      const SemanaCronograma(
        numero: 7,
        periodo: '11/11 a 17/11/2026',
        faseNome: 'Fase 2 • Aprofundamento Teórico',
        faseNumero: 2,
        focoPrincipal: 'Sintaxe da Oração & Segurança Pública',
        disciplina1: 'Língua Portuguesa (10 questões)',
        topicos1: 'Sintaxe da Oração: Sujeito, Predicado, Transitividade Verbal e Termos Integrantes',
        disciplina2: 'Direito Constitucional (10 questões)',
        topicos2: 'Da Segurança Pública (Art. 144 da CF/88): Atribuições da Polícia Militar, Polícia Civil e Corpos de Bombeiros',
        metaQuestoes: 150,
        atividadeFimSemana: 'SIMULADO FASE 2 (60 Questões Instituto AOCP)',
      ),
      const SemanaCronograma(
        numero: 8,
        periodo: '18/11 a 24/11/2026',
        faseNome: 'Fase 2 • Aprofundamento Teórico',
        faseNumero: 2,
        focoPrincipal: 'Guerra dos Mascates & Equivalências Lógicas',
        disciplina1: 'História de Pernambuco (10 questões)',
        topicos1: 'A Guerra dos Mascates (1710-1711): Conflito entre Olinda e Recife e seus desdobramentos socioeconômicos',
        disciplina2: 'Raciocínio Lógico Matemático (10 questões)',
        topicos2: 'Equivalências Lógicas e Negação de Proposições Compostas (Leis de De Morgan)',
        metaQuestoes: 150,
        atividadeFimSemana: 'Caderno de 50 questões comentadas Instituto AOCP',
      ),
      const SemanaCronograma(
        numero: 9,
        periodo: '25/11 a 01/12/2026',
        faseNome: 'Fase 2 • Aprofundamento Teórico',
        faseNumero: 2,
        focoPrincipal: 'Segurança da Informação & Lei Maria da Penha',
        disciplina1: 'Noções de Informática (10 questões)',
        topicos1: 'Segurança da Informação: Vírus, Worms, Trojan, Ransomware, Phishing, Spyware e Mecanismos de Proteção',
        disciplina2: 'Legislação Extravagante (10 questões)',
        topicos2: 'Lei Maria da Penha (Lei nº 11.340/2006): Medidas Protetivas de Urgência e Tipos de Violência Doméstica',
        metaQuestoes: 150,
        atividadeFimSemana: 'Oficina de Casos Práticos de Maria da Penha para a PM',
      ),
      const SemanaCronograma(
        numero: 10,
        periodo: '02/12 a 08/12/2026',
        faseNome: 'Fase 2 • Aprofundamento Teórico',
        faseNumero: 2,
        focoPrincipal: 'Regência, Crase AOCP & Pacto de San José',
        disciplina1: 'Língua Portuguesa (10 questões)',
        topicos1: 'Regência Verbal e Nominal, Emprego do Sinal Indicativo de Crase no padrão rigoroso do Instituto AOCP',
        disciplina2: 'Direitos Humanos (10 questões)',
        topicos2: 'Convenção Americana sobre Direitos Humanos (Pacto de San José da Costa Rica de 1969)',
        metaQuestoes: 160,
        atividadeFimSemana: 'SIMULADO FASE 2 CONSOLIDADO (60 Questões AOCP)',
      ),

      // FASE 3: LEGISLAÇÃO ESPECÍFICA & REDAÇÃO TÁTICA (Semanas 11 a 16)
      const SemanaCronograma(
        numero: 11,
        periodo: '09/12 a 15/12/2026',
        faseNome: 'Fase 3 • Legislação & Redação',
        faseNumero: 3,
        focoPrincipal: 'Revolução de 1817 & Diagramas Lógicos',
        disciplina1: 'História de Pernambuco (10 questões)',
        topicos1: 'A Revolução Pernambucana de 1817: Causas, Ideais Iluministas, a República Provisória e Desdobramentos',
        disciplina2: 'Raciocínio Lógico Matemático (10 questões)',
        topicos2: 'Diagramas Lógicos, Teoria dos Conjuntos (União, Interseção, Diferença) e Problemas com Conjuntos',
        metaQuestoes: 160,
        atividadeFimSemana: 'Bateria de 50 questões da Revolução de 1817 e Conjuntos',
      ),
      const SemanaCronograma(
        numero: 12,
        periodo: '16/12 a 22/12/2026',
        faseNome: 'Fase 3 • Legislação & Redação',
        faseNumero: 3,
        focoPrincipal: 'Pacote Office/LibreOffice & Estatuto do Desarmamento',
        disciplina1: 'Noções de Informática (10 questões)',
        topicos1: 'Processadores de Texto e Planilhas Eletrônicas (Microsoft Word/Excel e LibreOffice Writer/Calc)',
        disciplina2: 'Legislação Extravagante (10 questões)',
        topicos2: 'Estatuto do Desarmamento (Lei nº 10.826/2003): Porte, Posse, Disparo de Arma de Fogo e Crimes Relacionados',
        metaQuestoes: 160,
        atividadeFimSemana: 'Auditoria de Letra de Lei do Estatuto do Desarmamento',
      ),
      const SemanaCronograma(
        numero: 13,
        periodo: '23/12 a 29/12/2026',
        faseNome: 'Fase 3 • Legislação & Redação',
        faseNumero: 3,
        focoPrincipal: 'Oficina de Redação Discursiva PMPE (Tema Segurança)',
        disciplina1: 'Prova Discursiva (Redação Oficial)',
        topicos1: 'Estrutura da Redação Dissertativa-Argumentativa: Introdução com Tese Clara, Desenvolvimento e Proposta de Intervenção',
        disciplina2: 'Revisão Geral e Nivelamento',
        topicos2: 'Caderno de Erros das 6 Disciplinas com foco nos pontos críticos do Instituto AOCP',
        metaQuestoes: 150,
        atividadeFimSemana: 'REDAÇÃO DISCURSIVA Nº 1 (Tema: O Papel da PMPE no Combate à Criminalidade Moderna)',
      ),
      const SemanaCronograma(
        numero: 14,
        periodo: '30/12 a 05/01/2027',
        faseNome: 'Fase 3 • Legislação & Redação',
        faseNumero: 3,
        focoPrincipal: 'Pontuação, Concordância & Poder Executivo',
        disciplina1: 'Língua Portuguesa (10 questões)',
        topicos1: 'Pontuação (Uso da vírgula, ponto e vírgula e travessão) e Concordância Verbal e Nominal',
        disciplina2: 'Direito Constitucional (10 questões)',
        topicos2: 'Da Defesa do Estado e das Instituições Democráticas: Estado de Defesa, Estado de Sítio e Forças Armadas',
        metaQuestoes: 160,
        atividadeFimSemana: 'SIMULADO FASE 3 (60 Questões no Tempo Oficial de 4h)',
      ),
      const SemanaCronograma(
        numero: 15,
        periodo: '06/01 a 12/01/2027',
        faseNome: 'Fase 3 • Legislação & Redação',
        faseNumero: 3,
        focoPrincipal: 'Confederação do Equador & Aritmética AOCP',
        disciplina1: 'História de Pernambuco (10 questões)',
        topicos1: 'Confederação do Equador (1824), Frei Caneca, Revolução Praieira (1848) e Movimento Abolicionista em PE',
        disciplina2: 'Raciocínio Lógico Matemático (10 questões)',
        topicos2: 'Razão e Proporção, Regra de Três Simples e Composta, Porcentagem e Juros Simples',
        metaQuestoes: 170,
        atividadeFimSemana: 'REDAÇÃO DISCURSIVA Nº 2 + Bateria de 50 itens',
      ),
      const SemanaCronograma(
        numero: 16,
        periodo: '13/01 a 19/01/2027',
        faseNome: 'Fase 3 • Legislação & Redação',
        faseNumero: 3,
        focoPrincipal: 'Navegadores, Nuvem & Lei de Drogas / Abuso',
        disciplina1: 'Noções de Informática (10 questões)',
        topicos1: 'Navegadores Web (Chrome, Edge, Firefox), Protocolos (HTTP, HTTPS, FTP), Nuvem e Ferramentas Colaborativas',
        disciplina2: 'Legislação Extravagante (10 questões)',
        topicos2: 'Lei de Drogas (Lei nº 11.343/2006) e Nova Lei de Abuso de Autoridade (Lei nº 13.869/2019)',
        metaQuestoes: 170,
        atividadeFimSemana: 'SIMULADO FASE 3 CONSOLIDADO (60 Questões + Redação)',
      ),

      // FASE 4: BATERIAS COMPLETAS, RETA FINAL & SIMULADO GERAL (Semanas 17 a 21)
      const SemanaCronograma(
        numero: 17,
        periodo: '20/01 a 26/01/2027',
        faseNome: 'Fase 4 • Reta Final de Guerra',
        faseNumero: 4,
        focoPrincipal: 'Intensivo de Provas Anteriores AOCP & Redação PMPE',
        disciplina1: 'Baterias de Provas Instituto AOCP',
        topicos1: 'Resolução das últimas 5 provas aplicadas pelo Instituto AOCP para carreiras de segurança pública',
        disciplina2: 'Oficina de Redação Tática',
        topicos2: 'Laboratório de Redação com temas prioritários (Direitos Humanos e Policiamento Comunitário)',
        metaQuestoes: 180,
        atividadeFimSemana: 'REDAÇÃO DISCURSIVA Nº 3 + Correção Detalhada CRAVOU IA',
      ),
      const SemanaCronograma(
        numero: 18,
        periodo: '27/01 a 02/02/2027',
        faseNome: 'Fase 4 • Reta Final de Guerra',
        faseNumero: 4,
        focoPrincipal: 'Simulado Oficial PMPE 1 & Mapeamento de Vulnerabilidades',
        disciplina1: 'Simulado Geral 1 (60 Questões)',
        topicos1: 'Prova cronometrada idêntica ao edital da PMPE (10 Port, 10 Hist, 10 RLM, 10 Info, 10 Const, 10 DH/Leg)',
        disciplina2: 'Mapeamento de Vulnerabilidades',
        topicos2: 'Revisão forçada dos 20 assuntos com maior índice de erros acumulados nas semanas 1 a 17',
        metaQuestoes: 200,
        atividadeFimSemana: 'SIMULADO OFICIAL PMPE Nº 1 (Gabarito e Ranking em Tempo Real)',
      ),
      const SemanaCronograma(
        numero: 19,
        periodo: '03/02 a 09/02/2027',
        faseNome: 'Fase 4 • Reta Final de Guerra',
        faseNumero: 4,
        focoPrincipal: 'Letra de Lei Constitucional & Legislação Especial Militar',
        disciplina1: 'Direito Constitucional & Legislação da PMPE',
        topicos1: 'Revisão expressa do Art. 5º e Art. 144 da CF/88 + Estatuto PMPE (Lei 6.783/74) na ponta da língua',
        disciplina2: 'Português e RLM de Alta Incidência',
        topicos2: 'Tópicos mais cobrados pela banca: Crase, Concordância, Lógica Proposicional e Negações',
        metaQuestoes: 200,
        atividadeFimSemana: 'SIMULADO OFICIAL PMPE Nº 2 (60 Itens + Redação)',
      ),
      const SemanaCronograma(
        numero: 20,
        periodo: '10/02 a 16/02/2027',
        faseNome: 'Fase 4 • Reta Final de Guerra',
        faseNumero: 4,
        focoPrincipal: 'MEGA SIMULADO GERAL AOCP DE VÉSPERA',
        disciplina1: 'Mega Simulado Geral de Véspera',
        topicos1: 'Aplicação do simulado com nota de corte, cronômetro de 4 horas e folha de respostas oficial',
        disciplina2: 'Revisão Cirúrgica de Erros',
        topicos2: 'Sanar as últimas dúvidas conceituais e memorizar fórmulas finais de RLM e Informática',
        metaQuestoes: 180,
        atividadeFimSemana: 'MEGA SIMULADO GERAL AOCP + Plantão de Dúvidas CRAVOU',
      ),
      const SemanaCronograma(
        numero: 21,
        periodo: '17/02 a 21/02/2027',
        faseNome: 'Fase 4 • Semana da Prova',
        faseNumero: 4,
        focoPrincipal: '🎯 SEMANA DA PROVA • DIA D (21 DE FEVEREIRO DE 2027)',
        disciplina1: 'Revisão Leve & Flashcards Mnemônicos',
        topicos1: 'Leitura rápida dos resumos de História de PE, prazos legais e regras de crase',
        disciplina2: 'Preparação Emocional e Logística',
        topicos2: 'Conferência do local de prova, documento com foto, caneta preta em tubo transparente e hidratação',
        metaQuestoes: 60,
        atividadeFimSemana: '🚨 21/02/2027 (DOMINGO): APLICAÇÃO OFICIAL DA PROVA DA PM-PE!',
        isSemanaProva: true,
      ),
    ];
  }

  void _salvarPlanejamento() async {
    HapticFeedback.heavyImpact();
    setState(() => _salvando = true);

    final plano = PlanoEstudoState.instance;

    plano.setMateriasDificuldade(_materiasDificuldade);
    plano.atualizarPlano(
      concursoAlvo: plano.concursoAlvo,
      cargoAlvo: plano.cargoAlvo,
      banca: 'Instituto AOCP',
      nomeArquivo: 'Edital_Oficial_PMPE_AOCP_2026.pdf',
      tamanhoArquivo: '2.4 MB',
      horasPorDia: _horasPorDia,
      semanasAteProva: _semanasAteProva,
      disciplinas: [
        'Língua Portuguesa (10 questões)',
        'História de Pernambuco (10 questões)',
        'Raciocínio Lógico Matemático (10 questões)',
        'Noções de Informática (10 questões)',
        'Direito Constitucional (10 questões)',
        'Direitos Humanos e Legislação Extravagante (10 questões)',
        'Prova Discursiva (Redação - 40 pontos)',
      ],
    );

    await Future.delayed(const Duration(milliseconds: 300));

    if (!mounted) return;
    setState(() => _salvando = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Planejamento Tático atualizado com os dados oficiais do Edital da PM-PE! Meta: $_horasPorDia h/dia (~${_diasAteProva * _horasPorDia}h até a prova de 21/02/2027).',
        ),
        backgroundColor: const Color(0xFF16A34A),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final horasTotais = _diasAteProva * _horasPorDia;
    final questoesEstimadas = horasTotais * 8;

    final semanasFiltradas = _filtroFase == 0
        ? _cronograma21Semanas
        : _cronograma21Semanas.where((s) => s.faseNumero == _filtroFase).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary),
          tooltip: 'Voltar ao Painel',
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Planejador Tático',
          style: AppTypography.heading2.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: AppColors.brandNavy,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12, top: 11, bottom: 11),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF3C7),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFFCD34D)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('⏳', style: TextStyle(fontSize: 11)),
                SizedBox(width: 3),
                Text(
                  '144 dias',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFB45309),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // CARD 1: Comprovante de Inscrição Oficial Homologada
            TacticalCard(
              borderColor: const Color(0xFF16A34A),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
                        decoration: BoxDecoration(
                          color: const Color(0xFF16A34A),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.check_circle_rounded, color: Colors.white, size: 12),
                            SizedBox(width: 4),
                            Text(
                              'INSCRIÇÃO HOMOLOGADA',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9.5,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: const Color(0xFFBFDBFE)),
                        ),
                        child: const Text(
                          'Nº 2026-PMPE-08942',
                          style: TextStyle(
                            color: Color(0xFF1E3A8A),
                            fontSize: 9.5,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF7ED),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: const Color(0xFFFFEDD5)),
                        ),
                        child: const Text(
                          'EDITAL 30/09/2026',
                          style: TextStyle(
                            color: Color(0xFF9A3412),
                            fontSize: 9.5,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Polícia Militar de Pernambuco • Soldado Combatente',
                    style: AppTypography.titleMedium.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: AppColors.brandNavy,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Banca: Instituto AOCP • 1.250 Vagas de Soldado • Remuneração: R\$ 5.617,92',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      _badgeInfo('📅 Prova Oficial: 21/02/2027'),
                      _badgeInfo('📝 Inscrições: 05/10 a 05/11/2026'),
                      _badgeInfo('🎯 60 Questões AOCP + Redação'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // CARD 2: Cronograma Regressivo Rigoroso do Edital (144 dias / 21 semanas)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.calendar_month_rounded, color: AppColors.brandOrange, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'CRONOGRAMA REGRESSIVO OFICIAL DA PM-PE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _contadorCaixa(
                          rotulo: 'DIAS ATÉ A PROVA',
                          valor: '$_diasAteProva',
                          subtitulo: 'Prova em 21/02/2027',
                          corValor: AppColors.brandOrange,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _contadorCaixa(
                          rotulo: 'SEMANAS DE GUERRA',
                          valor: '$_semanasAteProva',
                          subtitulo: 'Semana 1 à Semana 21',
                          corValor: const Color(0xFF38BDF8),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _contadorCaixa(
                          rotulo: 'QUESTÕES AOCP',
                          valor: '60',
                          subtitulo: '5 Alternativas + Redação',
                          corValor: const Color(0xFF4ADE80),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Do dia da publicação do edital até o dia da prova são 21 semanas milimetricamente estruturadas para colocar você entre as primeiras posições das 1.250 vagas.',
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 11.5,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // CARD 3: Informar Disponibilidade Diária de Estudos
            TacticalCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sua Disponibilidade Diária de Estudos',
                    style: AppTypography.titleMedium.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Quantas horas líquidas você consegue estudar por dia para o concurso da PM-PE?',
                    style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 14),

                  // Seletor de Horas/Dia
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [2, 3, 4, 5, 6].map((horas) {
                      final isSelected = _horasPorDia == horas;
                      return ChoiceChip(
                        label: Text(
                          horas == 3 ? '$horas horas/dia (Recomendado)' : '$horas horas/dia',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                            color: isSelected ? Colors.white : AppColors.textPrimary,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: AppColors.brandNavy,
                        backgroundColor: AppColors.surfaceElevated,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: isSelected ? AppColors.brandNavy : AppColors.surfaceBorder,
                          ),
                        ),
                        onSelected: (selected) {
                          if (selected) {
                            HapticFeedback.selectionClick();
                            setState(() => _horasPorDia = horas);
                          }
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),

                  // Seletor de Turnos de Estudo
                  Text(
                    'Turnos de Estudo Ativos',
                    style: AppTypography.bodySmall.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: ['🌅 Manhã', '☀️ Tarde', '🌙 Noite'].map((turno) {
                      final isSelected = _turnosSelecionados.contains(turno);
                      return FilterChip(
                        label: Text(
                          turno,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
                            color: isSelected ? AppColors.brandCobalt : AppColors.textSecondary,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: AppColors.brandCobalt.withValues(alpha: 0.12),
                        backgroundColor: AppColors.surfaceElevated,
                        checkmarkColor: AppColors.brandCobalt,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: isSelected ? AppColors.brandCobalt : AppColors.surfaceBorder,
                          ),
                        ),
                        onSelected: (selected) {
                          HapticFeedback.selectionClick();
                          setState(() {
                            if (selected) {
                              _turnosSelecionados.add(turno);
                            } else if (_turnosSelecionados.length > 1) {
                              _turnosSelecionados.remove(turno);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // CARD 3.1: Mapeamento de Vulnerabilidades / Matérias de Maior Dificuldade
            TacticalCard(
              padding: const EdgeInsets.all(16),
              borderColor: const Color(0xFFEA580C).withValues(alpha: 0.35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF7ED),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: const Color(0xFFFFEDD5)),
                        ),
                        child: const Text('🎯', style: TextStyle(fontSize: 16)),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Matérias de Maior Dificuldade',
                              style: AppTypography.titleMedium.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              'Priorização Tática no Guia de Estudos e Simulados',
                              style: AppTypography.caption.copyWith(
                                color: const Color(0xFFC2410C),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Selecione as disciplinas em que você sente maior vulnerabilidade. O CRAVOU IA colocará essas matérias no topo do seu Guia de Estudos com selo de prioridade e reforço na carga de questões.',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 11.5,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Chips das 6 Matérias Oficiais da PMPE
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
                      final isSelected = _materiasDificuldade.any((d) =>
                          d.toLowerCase() == materia.toLowerCase() ||
                          materia.toLowerCase().contains(d.toLowerCase()));
                      return FilterChip(
                        avatar: Text(
                          isSelected ? '⚠️' : '📚',
                          style: const TextStyle(fontSize: 12),
                        ),
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
                          HapticFeedback.selectionClick();
                          setState(() {
                            if (selected) {
                              _materiasDificuldade.add(materia);
                            } else {
                              _materiasDificuldade.removeWhere((d) =>
                                  d.toLowerCase() == materia.toLowerCase() ||
                                  materia.toLowerCase().contains(d.toLowerCase()));
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFBEB),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xFFFDE68A)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline, size: 14, color: Color(0xFFB45309)),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            '${_materiasDificuldade.length} matéria(s) prioritária(s) selecionada(s) para reforço intensivo.',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF92400E),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // CARD 4: Projeção de Produtividade Tática até a Prova
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFBBF7D0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.insights_rounded, color: Color(0xFF15803D), size: 18),
                      SizedBox(width: 8),
                      Text(
                        'PROJEÇÃO TOTAL ATÉ A PROVA (21/02/2027)',
                        style: TextStyle(
                          color: Color(0xFF166534),
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Carga Horária Total:',
                              style: TextStyle(fontSize: 11, color: Color(0xFF334155)),
                            ),
                            Text(
                              '$horasTotais horas líquidas',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF0F172A),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Questões Instituto AOCP:',
                              style: TextStyle(fontSize: 11, color: Color(0xFF334155)),
                            ),
                            Text(
                              '~$questoesEstimadas itens',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF0F172A),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Simulados Oficiais:',
                              style: TextStyle(fontSize: 11, color: Color(0xFF334155)),
                            ),
                            Text(
                              '10 simulados',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF0F172A),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // CARD 5: CRONOGRAMA DA SEMANA 1 ATÉ A SEMANA 21 (DIA DA PROVA)
            TacticalCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cronograma da Semana 1 ao Dia da Prova',
                              style: AppTypography.titleMedium.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: AppColors.brandNavy,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Todas as 21 semanas detalhadas com tópicos, questões e simulados da PM-PE:',
                              style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.brandNavy,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          '21 SEMANAS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Filtro de Fases
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _filtroFaseChip(0, 'Todas (21 Semanas)'),
                        const SizedBox(width: 6),
                        _filtroFaseChip(1, 'Fase 1: Fundação (Sem 1-5)'),
                        const SizedBox(width: 6),
                        _filtroFaseChip(2, 'Fase 2: Aprofundamento (Sem 6-10)'),
                        const SizedBox(width: 6),
                        _filtroFaseChip(3, 'Fase 3: Legislação (Sem 11-16)'),
                        const SizedBox(width: 6),
                        _filtroFaseChip(4, 'Fase 4: Reta Final (Sem 17-21)'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Lista das Semanas Filtradas
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: semanasFiltradas.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final sem = semanasFiltradas[index];
                      return _cardSemanaItem(sem);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Botão Primário: SALVAR E ATUALIZAR MEU CRONOGRAMA
            SizedBox(
              height: 52,
              child: ElevatedButton.icon(
                onPressed: _salvando ? null : _salvarPlanejamento,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandNavy,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  ),
                  elevation: 0,
                ),
                icon: _salvando
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Icon(Icons.check_circle_rounded, size: 20),
                label: Text(
                  _salvando ? 'ATUALIZANDO CRONOGRAMA...' : 'SALVAR E ATUALIZAR MEU CRONOGRAMA',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _filtroFaseChip(int fase, String rotulo) {
    final isSelected = _filtroFase == fase;
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        setState(() => _filtroFase = fase);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.brandNavy : AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.brandNavy : AppColors.surfaceBorder,
          ),
        ),
        child: Text(
          rotulo,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
            color: isSelected ? Colors.white : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  Widget _cardSemanaItem(SemanaCronograma sem) {
    final bgColor = sem.isSemanaAtual
        ? const Color(0xFFF0FDF4)
        : sem.isSemanaProva
            ? const Color(0xFFFEF2F2)
            : AppColors.surfaceElevated;

    final borderColor = sem.isSemanaAtual
        ? const Color(0xFF86EFAC)
        : sem.isSemanaProva
            ? const Color(0xFFFCA5A5)
            : AppColors.surfaceBorder;

    return Material(
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: borderColor,
          width: sem.isSemanaAtual || sem.isSemanaProva ? 1.5 : 1.0,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: sem.isSemanaAtual || sem.isSemanaProva,
          tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          leading: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: sem.isSemanaAtual
                  ? const Color(0xFF16A34A)
                  : sem.isSemanaProva
                      ? const Color(0xFFDC2626)
                      : AppColors.brandNavy,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '${sem.numero}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  'Semana ${sem.numero} • ${sem.focoPrincipal}',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: sem.isSemanaProva ? const Color(0xFF991B1B) : AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          subtitle: Row(
            children: [
              Text(
                sem.periodo,
                style: const TextStyle(
                  fontSize: 10.5,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              if (sem.isSemanaAtual)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF16A34A),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'SEMANA ATUAL',
                    style: TextStyle(color: Colors.white, fontSize: 8.5, fontWeight: FontWeight.w900),
                  ),
                ),
              if (sem.isSemanaProva)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDC2626),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'DIA DA PROVA 21/02',
                    style: TextStyle(color: Colors.white, fontSize: 8.5, fontWeight: FontWeight.w900),
                  ),
                ),
            ],
          ),
          children: [
            const Divider(height: 14, color: AppColors.surfaceBorder),

            // Disciplina 1
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.bookmark_rounded, size: 16, color: AppColors.brandCobalt),
                const SizedBox(width: 6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sem.disciplina1,
                        style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: AppColors.brandNavy),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        sem.topicos1,
                        style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, height: 1.3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Disciplina 2
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.bookmark_rounded, size: 16, color: AppColors.brandOrange),
                const SizedBox(width: 6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sem.disciplina2,
                        style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: AppColors.brandNavy),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        sem.topicos2,
                        style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, height: 1.3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Rodapé do Card da Semana: Metas e Atividade de Fim de Semana
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'META: ${sem.metaQuestoes} questões AOCP',
                          style: const TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          sem.atividadeFimSemana,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: sem.isSemanaProva ? const Color(0xFFDC2626) : const Color(0xFFD97706),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const CatalogoQuestoesScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: sem.isSemanaAtual ? const Color(0xFF16A34A) : AppColors.brandNavy,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    ),
                    child: Text(
                      sem.isSemanaAtual ? 'TREINAR HOJE' : 'VER QUESTÕES',
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _badgeInfo(String texto) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.w600, color: Color(0xFF475569)),
      ),
    );
  }

  Widget _contadorCaixa({
    required String rotulo,
    required String valor,
    required String subtitulo,
    required Color corValor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        children: [
          Text(
            rotulo,
            style: const TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 8.5,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.3,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            valor,
            style: TextStyle(
              color: corValor,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            subtitulo,
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 8.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
