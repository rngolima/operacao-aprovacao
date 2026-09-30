import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../../core/widgets/tactical_owl_logo.dart';
import '../../data/services/admin_content_service.dart';
import 'upload_edital_screen.dart';
import 'cadastrar_material_screen.dart';
import 'gestao_usuarios_screen.dart';

/// Painel de Controle Oficial do Administrador (QG CRAVOU).
/// Centro de comando para o Fundador/Admin gerenciar editais, materiais didáticos,
/// métricas de tração de usuários, monetização e infraestrutura.
class AdminDashboardScreen extends StatefulWidget {
  final String adminNome;

  const AdminDashboardScreen({
    super.key,
    this.adminNome = 'Rudson Lima',
  });

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  void initState() {
    super.initState();
    AdminContentService.instance.addListener(_onServiceChanged);
  }

  @override
  void dispose() {
    AdminContentService.instance.removeListener(_onServiceChanged);
    super.dispose();
  }

  void _onServiceChanged() {
    if (mounted) setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0.5,
        titleSpacing: 12,
        title: Row(
          children: [
            const TacticalOwlLogo(size: 28),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'PAINEL DO ADMINISTRADOR',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.8,
                    color: AppColors.brandNavy,
                  ),
                ),
                Text(
                  'QG CRAVOU • GESTÃO E OPERAÇÃO',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.brandOrange,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: OutlinedButton.icon(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.visibility_rounded, size: 14),
              label: const Text('VISÃO ALUNO', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.brandNavy,
                side: const BorderSide(color: AppColors.brandNavy),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // BANNER DE BOAS-VINDAS DO FUNDADOR
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0F172A), Color(0xFF1E3A8A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: AppColors.brandOrange,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text('👑', style: TextStyle(fontSize: 22)),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Olá, ${widget.adminNome}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Painel de Controle Ativo • Sistema CRAVOU 100% Operacional',
                          style: TextStyle(
                            color: Color(0xFFCBD5E1),
                            fontSize: 11.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF16A34A),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'ONLINE',
                      style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // SEÇÃO 1: MÉTRICAS DE TRAÇÃO & AUDITORIA DE USUÁRIOS
            Text(
              'AUDITORIA DE USUÁRIOS & MONETIZAÇÃO',
              style: AppTypography.tagLabel.copyWith(color: AppColors.textPrimary, letterSpacing: 0.8),
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: _cardMetrica(
                    rotulo: 'TOTAL DE USUÁRIOS',
                    valor: '1.482',
                    badge: '+14% esta sem.',
                    corBadge: const Color(0xFF16A34A),
                    icone: Icons.people_alt_rounded,
                    corIcone: const Color(0xFF1E3A8A),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _cardMetrica(
                    rotulo: 'USUÁRIOS ATIVOS HOJE',
                    valor: '834',
                    badge: '56.2% ativos',
                    corBadge: const Color(0xFF16A34A),
                    icone: Icons.bolt_rounded,
                    corIcone: const Color(0xFFF59E0B),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _cardMetrica(
                    rotulo: 'ASSINANTES CRAVOU PRO',
                    valor: '318',
                    badge: '21.4% conversão',
                    corBadge: AppColors.brandOrange,
                    icone: Icons.workspace_premium_rounded,
                    corIcone: AppColors.brandOrange,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _cardMetrica(
                    rotulo: 'MRR (RECEITA RECORRENTE)',
                    valor: 'R\$ 22.166',
                    badge: 'Fatur. R\$ 89.4k',
                    corBadge: const Color(0xFF15803D),
                    icone: Icons.trending_up_rounded,
                    corIcone: const Color(0xFF15803D),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            // SEÇÃO 2: AÇÕES RÁPIDAS DE GESTÃO DO ADMINISTRADOR
            Text(
              'AÇÕES DE GESTÃO OPERACIONAL',
              style: AppTypography.tagLabel.copyWith(color: AppColors.textPrimary, letterSpacing: 0.8),
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: _botaoAcaoGrande(
                    icone: Icons.upload_file_rounded,
                    titulo: 'Carregar Edital',
                    subtitulo: 'Upload de PDF, análise de disciplinas e publicação no app',
                    cor: const Color(0xFF1E3A8A),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const UploadEditalScreen()),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _botaoAcaoGrande(
                    icone: Icons.menu_book_rounded,
                    titulo: 'Subir Materiais',
                    subtitulo: 'Cadastrar aulas, resumos teóricos e questões oficiais',
                    cor: AppColors.brandOrange,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const CadastrarMaterialScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _botaoAcaoLargo(
              icone: Icons.people_outline_rounded,
              titulo: 'Gerenciar Todos os Usuários & Confirmações de E-mail',
              subtitulo: 'Acesse a lista completa de 1.482 candidatos, audite status LGPD e planos PRO',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const GestaoUsuariosScreen()),
                );
              },
            ),

            const SizedBox(height: 18),

            // SEÇÃO 3: DISTRIBUIÇÃO DOS ALUNOS POR CONCURSO ALVO
            Text(
              'DISTRIBUIÇÃO DE ALUNOS POR CONCURSO ALVO',
              style: AppTypography.tagLabel.copyWith(color: AppColors.textPrimary, letterSpacing: 0.8),
            ),
            const SizedBox(height: 8),

            TacticalCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _barraDistribuicao('PM-PE (Polícia Militar)', 1120, 1482, '75.5%', const Color(0xFF16A34A)),
                  const SizedBox(height: 12),
                  _barraDistribuicao('PC-PE (Polícia Civil)', 242, 1482, '16.3%', const Color(0xFF1E3A8A)),
                  const SizedBox(height: 12),
                  _barraDistribuicao('PP-PE (Polícia Penal)', 120, 1482, '8.2%', const Color(0xFFB45309)),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // SEÇÃO 4: EDITAIS ATIVOS NO SISTEMA
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'EDITAIS OFICIAIS GERENCIADOS',
                  style: AppTypography.tagLabel.copyWith(color: AppColors.textPrimary, letterSpacing: 0.8),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const UploadEditalScreen()),
                    );
                  },
                  child: const Text(
                    '+ Carregar Novo',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.brandCobalt),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            ...AdminContentService.instance.editais.map((edital) {
              final bool isAtivo = edital.status == 'PUBLICADO';
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TacticalCard(
                  padding: const EdgeInsets.all(14),
                  borderColor: isAtivo ? const Color(0xFF16A34A) : AppColors.surfaceBorder,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isAtivo ? const Color(0xFFDCFCE7) : AppColors.surfaceElevated,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.picture_as_pdf_rounded,
                          color: isAtivo ? const Color(0xFF15803D) : AppColors.brandNavy,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              edital.concurso,
                              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Banca ${edital.banca} • ${edital.vagas} • ${edital.disciplinas.length} Disciplinas • ${edital.nomeArquivo}',
                              style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: isAtivo ? const Color(0xFF16A34A) : const Color(0xFFE2E8F0),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          edital.status,
                          style: TextStyle(
                            color: isAtivo ? Colors.white : const Color(0xFF475569),
                            fontSize: 9.5,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 18),

            // SEÇÃO 5: MATERIAIS DE APRENDIZAGEM & QUESTÕES EM PRODUÇÃO
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'MATERIAIS & QUESTÕES ALIMENTADOS (PRODUÇÃO)',
                  style: AppTypography.tagLabel.copyWith(color: AppColors.textPrimary, letterSpacing: 0.8),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const CadastrarMaterialScreen()),
                    );
                  },
                  child: const Text(
                    '+ Subir Mais',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.brandCobalt),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            ...AdminContentService.instance.materiais.take(5).map((mat) {
              final bool isAula = mat.tipo == 'AULA_RESUMO';
              final bool isPdf = mat.tipo == 'LEGISLACAO';
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TacticalCard(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isAula
                              ? AppColors.brandCobalt.withValues(alpha: 0.1)
                              : isPdf
                                  ? const Color(0xFFFEF2F2)
                                  : const Color(0xFFF0FDF4),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          isAula
                              ? Icons.menu_book_rounded
                              : isPdf
                                  ? Icons.picture_as_pdf_rounded
                                  : Icons.quiz_rounded,
                          color: isAula
                              ? AppColors.brandCobalt
                              : isPdf
                                  ? const Color(0xFFDC2626)
                                  : const Color(0xFF16A34A),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mat.titulo,
                              style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${mat.disciplina} • ${mat.autor} • ${mat.dataUpload}',
                              style: const TextStyle(fontSize: 10.5, color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceElevated,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.surfaceBorder),
                        ),
                        child: Text(
                          mat.tipo.replaceAll('_', ' '),
                          style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: AppColors.textSecondary),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 18),

            // SEÇÃO 5: TELEMETRIA DE INFRAESTRUTURA & BANCO DE DADOS
            Text(
              'TELEMETRIA DE SISTEMA & BANCO DE DADOS',
              style: AppTypography.tagLabel.copyWith(color: AppColors.textPrimary, letterSpacing: 0.8),
            ),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.surfaceElevated,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.surfaceBorder),
              ),
              child: Column(
                children: [
                  _linhaStatus('Backend API (Spring Boot)', 'ONLINE • 99.98% Uptime', const Color(0xFF16A34A)),
                  const SizedBox(height: 8),
                  _linhaStatus('Banco de Dados PostgreSQL', 'CONECTADO • Latência 14ms', const Color(0xFF16A34A)),
                  const SizedBox(height: 8),
                  _linhaStatus('Motor de IA / Análise de Editais', 'OPERACIONAL • Gemini Flash Ativo', const Color(0xFF16A34A)),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _cardMetrica({
    required String rotulo,
    required String valor,
    required String badge,
    required Color corBadge,
    required IconData icone,
    required Color corIcone,
  }) {
    return TacticalCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                rotulo,
                style: const TextStyle(fontSize: 9.5, fontWeight: FontWeight.w800, color: AppColors.textSecondary),
              ),
              Icon(icone, size: 16, color: corIcone),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            valor,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.brandNavy),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: corBadge.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              badge,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: corBadge),
            ),
          ),
        ],
      ),
    );
  }

  Widget _botaoAcaoGrande({
    required IconData icone,
    required String titulo,
    required String subtitulo,
    required Color cor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: cor.withValues(alpha: 0.4), width: 1.2),
          boxShadow: [
            BoxShadow(color: cor.withValues(alpha: 0.08), blurRadius: 6, offset: const Offset(0, 2)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: cor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(icone, color: cor, size: 22),
            ),
            const SizedBox(height: 10),
            Text(titulo, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
            const SizedBox(height: 4),
            Text(subtitulo, style: const TextStyle(fontSize: 10.5, color: AppColors.textSecondary, height: 1.3)),
          ],
        ),
      ),
    );
  }

  Widget _botaoAcaoLargo({
    required IconData icone,
    required String titulo,
    required String subtitulo,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.surfaceBorder),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.brandNavy.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.group_rounded, color: AppColors.brandNavy, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titulo, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Text(subtitulo, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }

  Widget _barraDistribuicao(String titulo, int valor, int total, String porcentagem, Color cor) {
    final ratio = (valor / total).clamp(0.0, 1.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titulo, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            Text('$valor alunos ($porcentagem)', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w800, color: cor)),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: ratio,
            minHeight: 8,
            backgroundColor: AppColors.surfaceBorder,
            valueColor: AlwaysStoppedAnimation<Color>(cor),
          ),
        ),
      ],
    );
  }

  Widget _linhaStatus(String componente, String status, Color cor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            componente,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 8, height: 8, decoration: BoxDecoration(color: cor, shape: BoxShape.circle)),
            const SizedBox(width: 6),
            Text(status, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: cor)),
          ],
        ),
      ],
    );
  }
}
