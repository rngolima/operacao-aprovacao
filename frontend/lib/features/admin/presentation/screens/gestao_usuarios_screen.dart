import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../data/models/admin_models.dart';

/// Tela Administrativa para Visualização, Auditoria e Gestão de Usuários Cadastrados
class GestaoUsuariosScreen extends StatefulWidget {
  const GestaoUsuariosScreen({super.key});

  @override
  State<GestaoUsuariosScreen> createState() => _GestaoUsuariosScreenState();
}

class _GestaoUsuariosScreenState extends State<GestaoUsuariosScreen> {
  String _filtroConcurso = 'TODOS';
  String _filtroStatus = 'TODOS';
  final _buscaCtrl = TextEditingController();

  final List<UsuarioAdminModel> _usuariosCadastrados = [
    const UsuarioAdminModel(
      id: 1,
      nome: 'Rudson Lima (Você)',
      email: 'rudson.lima@cravou.com.br',
      concursoAlvo: 'PM-PE (Polícia Militar)',
      cargoAlvo: 'Soldado Combatente',
      statusInscricao: 'HOMOLOGADO',
      isPro: true,
      dataCadastro: '30/09/2026',
      questoesRespondidas: 148,
      taxaAcerto: 84.5,
    ),
    const UsuarioAdminModel(
      id: 2,
      nome: 'Carlos Eduardo Santos',
      email: 'carlos.eduardo@gmail.com',
      concursoAlvo: 'PM-PE (Polícia Militar)',
      cargoAlvo: 'Soldado Combatente',
      statusInscricao: 'HOMOLOGADO',
      isPro: true,
      dataCadastro: '30/09/2026',
      questoesRespondidas: 92,
      taxaAcerto: 78.0,
    ),
    const UsuarioAdminModel(
      id: 3,
      nome: 'Juliana Beatriz Melo',
      email: 'juliana.melo@hotmail.com',
      concursoAlvo: 'PM-PE (Polícia Militar)',
      cargoAlvo: 'Soldado Combatente',
      statusInscricao: 'HOMOLOGADO',
      isPro: false,
      dataCadastro: '29/09/2026',
      questoesRespondidas: 64,
      taxaAcerto: 81.2,
    ),
    const UsuarioAdminModel(
      id: 4,
      nome: 'Marcos Vinicius Pereira',
      email: 'marcos.v@outlook.com',
      concursoAlvo: 'PC-PE (Polícia Civil)',
      cargoAlvo: 'Agente de Polícia',
      statusInscricao: 'HOMOLOGADO',
      isPro: true,
      dataCadastro: '28/09/2026',
      questoesRespondidas: 210,
      taxaAcerto: 75.4,
    ),
    const UsuarioAdminModel(
      id: 5,
      nome: 'Lucas Gabriel Albuquerque',
      email: 'lucas.gabriel@gmail.com',
      concursoAlvo: 'PM-PE (Polícia Militar)',
      cargoAlvo: 'Soldado Combatente',
      statusInscricao: 'PENDENTE_EMAIL',
      isPro: false,
      dataCadastro: '30/09/2026',
      questoesRespondidas: 0,
      taxaAcerto: 0.0,
    ),
    const UsuarioAdminModel(
      id: 6,
      nome: 'Fernanda Caroline Dias',
      email: 'fernanda.dias@yahoo.com.br',
      concursoAlvo: 'PP-PE (Polícia Penal)',
      cargoAlvo: 'Policial Penal',
      statusInscricao: 'HOMOLOGADO',
      isPro: false,
      dataCadastro: '27/09/2026',
      questoesRespondidas: 115,
      taxaAcerto: 72.8,
    ),
  ];

  @override
  void dispose() {
    _buscaCtrl.dispose();
    super.dispose();
  }

  void _abrirAcoesUsuario(UsuarioAdminModel user) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.brandNavy,
                    child: Text(
                      user.nome.split(' ').map((n) => n[0]).take(2).join(),
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.nome, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        Text(user.email, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.star_rounded, color: AppColors.brandOrange),
                title: Text(user.isPro ? 'Revogar Plano PRO' : 'Liberar Assinatura CRAVOU PRO', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                subtitle: const Text('Conceder ou retirar acesso ilimitado a simulados e questões', style: TextStyle(fontSize: 11)),
                onTap: () {
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Status PRO de ${user.nome} atualizado!')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.mail_outline_rounded, color: AppColors.brandCobalt),
                title: const Text('Reenviar E-mail de Confirmação (LGPD)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                subtitle: const Text('Dispara novo código de 6 dígitos para o candidato', style: TextStyle(fontSize: 11)),
                onTap: () {
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Código de verificação reenviado para ${user.email}!')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock_reset_rounded, color: Color(0xFF64748B)),
                title: const Text('Redefinir Senha do Usuário', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                subtitle: const Text('Envia link seguro para recuperação de credencial', style: TextStyle(fontSize: 11)),
                onTap: () {
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Link de redefinição enviado para ${user.email}!')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final query = _buscaCtrl.text.toLowerCase().trim();

    final filtrados = _usuariosCadastrados.where((u) {
      final matchBusca = query.isEmpty ||
          u.nome.toLowerCase().contains(query) ||
          u.email.toLowerCase().contains(query);

      final matchConcurso = _filtroConcurso == 'TODOS' ||
          u.concursoAlvo.toUpperCase().contains(_filtroConcurso);

      final matchStatus = _filtroStatus == 'TODOS' ||
          (_filtroStatus == 'HOMOLOGADOS' && u.statusInscricao == 'HOMOLOGADO') ||
          (_filtroStatus == 'PENDENTES' && u.statusInscricao == 'PENDENTE_EMAIL') ||
          (_filtroStatus == 'PRO' && u.isPro);

      return matchBusca && matchConcurso && matchStatus;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gestão de Usuários & Alunos',
              style: AppTypography.heading3.copyWith(fontSize: 17, fontWeight: FontWeight.w800),
            ),
            const Text(
              'QG ADMINISTRADOR • BASE DE DADOS',
              style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: AppColors.brandOrange),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // CARDS KPI DE AUDITORIA
            Row(
              children: [
                Expanded(child: _kpiCard('TOTAL ALUNOS', '1.482', '+14% sem.', const Color(0xFF1E3A8A))),
                const SizedBox(width: 8),
                Expanded(child: _kpiCard('ATIVOS HOJE', '834', '56.2%', const Color(0xFF16A34A))),
                const SizedBox(width: 8),
                Expanded(child: _kpiCard('ALUNOS PRO', '318', '21.4%', const Color(0xFFEA580C))),
              ],
            ),

            const SizedBox(height: 16),

            // BARRA DE PESQUISA
            TextField(
              controller: _buscaCtrl,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Buscar por nome ou e-mail do aluno...',
                hintStyle: const TextStyle(fontSize: 12.5),
                prefixIcon: const Icon(Icons.search, size: 20),
                suffixIcon: _buscaCtrl.text.isNotEmpty
                    ? IconButton(icon: const Icon(Icons.clear, size: 18), onPressed: () => setState(() => _buscaCtrl.clear()))
                    : null,
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppColors.surfaceBorder)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppColors.surfaceBorder)),
              ),
            ),

            const SizedBox(height: 10),

            // FILTROS RÁPIDOS
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _chipFiltro('TODOS OS CONCURSOS', _filtroConcurso == 'TODOS', () => setState(() => _filtroConcurso = 'TODOS')),
                  const SizedBox(width: 6),
                  _chipFiltro('PM-PE (1.120)', _filtroConcurso == 'PM-PE', () => setState(() => _filtroConcurso = 'PM-PE')),
                  const SizedBox(width: 6),
                  _chipFiltro('PC-PE (242)', _filtroConcurso == 'PC-PE', () => setState(() => _filtroConcurso = 'PC-PE')),
                  const SizedBox(width: 6),
                  _chipFiltro('PP-PE (120)', _filtroConcurso == 'PP-PE', () => setState(() => _filtroConcurso = 'PP-PE')),
                  const SizedBox(width: 12),
                  _chipFiltro('👑 SÓ PRO', _filtroStatus == 'PRO', () => setState(() => _filtroStatus = _filtroStatus == 'PRO' ? 'TODOS' : 'PRO')),
                  const SizedBox(width: 6),
                  _chipFiltro('⏳ PENDENTES', _filtroStatus == 'PENDENTES', () => setState(() => _filtroStatus = _filtroStatus == 'PENDENTES' ? 'TODOS' : 'PENDENTES')),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Text(
              '${filtrados.length} ALUNOS ENCONTRADOS',
              style: AppTypography.tagLabel.copyWith(color: AppColors.textPrimary, letterSpacing: 0.8),
            ),
            const SizedBox(height: 8),

            // LISTA DE USUÁRIOS
            ...filtrados.map((usuario) {
              final isHomologado = usuario.statusInscricao == 'HOMOLOGADO';
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TacticalCard(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: usuario.isPro ? const Color(0xFFFEF3C7) : AppColors.surfaceElevated,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: usuario.isPro ? const Color(0xFFF59E0B) : AppColors.surfaceBorder,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    usuario.isPro ? '👑' : '👤',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    usuario.nome,
                                    style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    usuario.email,
                                    style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.more_vert, size: 18, color: AppColors.textSecondary),
                            onPressed: () => _abrirAcoesUsuario(usuario),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(height: 1, color: AppColors.surfaceBorder),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Alvo: ${usuario.concursoAlvo}',
                            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.brandNavy),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: isHomologado ? const Color(0xFFDCFCE7) : const Color(0xFFFEF3C7),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: isHomologado ? const Color(0xFF86EFAC) : const Color(0xFFFDE68A),
                              ),
                            ),
                            child: Text(
                              isHomologado ? 'VALIDADO' : 'PENDENTE E-MAIL',
                              style: TextStyle(
                                fontSize: 9.5,
                                fontWeight: FontWeight.bold,
                                color: isHomologado ? const Color(0xFF166534) : const Color(0xFFB45309),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${usuario.questoesRespondidas} questões • ${usuario.taxaAcerto}% acertos',
                            style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                          ),
                          Text(
                            'Cadastrado em: ${usuario.dataCadastro}',
                            style: const TextStyle(fontSize: 10.5, color: Color(0xFF94A3B8)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _kpiCard(String label, String valor, String badge, Color cor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.surfaceBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: AppColors.textSecondary)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(valor, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: cor)),
              Text(badge, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: cor)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chipFiltro(String label, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.brandNavy : AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? AppColors.brandNavy : AppColors.surfaceBorder),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
            color: isSelected ? Colors.white : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
