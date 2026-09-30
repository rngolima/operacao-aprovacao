import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../models/ia_mensagem_model.dart';
import '../../services/professor_cravou_service.dart';
import 'professor_cravou_avatar_widget.dart';

/// Modal interativo de Tira-Dúvidas e Mentoria com o Professor CRAVOU AI.
class ProfessorCravouChatModal extends StatefulWidget {
  final String enunciado;
  final String gabaritoOficial;
  final String comentario;
  final bool acertou;
  final String? assunto;
  final String? banca;

  const ProfessorCravouChatModal({
    super.key,
    required this.enunciado,
    required this.gabaritoOficial,
    required this.comentario,
    required this.acertou,
    this.assunto,
    this.banca,
  });

  static Future<void> show(
    BuildContext context, {
    required String enunciado,
    required String gabaritoOficial,
    required String comentario,
    required bool acertou,
    String? assunto,
    String? banca,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ProfessorCravouChatModal(
        enunciado: enunciado,
        gabaritoOficial: gabaritoOficial,
        comentario: comentario,
        acertou: acertou,
        assunto: assunto,
        banca: banca,
      ),
    );
  }

  @override
  State<ProfessorCravouChatModal> createState() => _ProfessorCravouChatModalState();
}

class _ProfessorCravouChatModalState extends State<ProfessorCravouChatModal> {
  final ProfessorCravouService _service = ProfessorCravouService();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<IAMensagemModel> _mensagens = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _adicionarMensagemBoasVindas();
  }

  void _adicionarMensagemBoasVindas() {
    final saudacao = widget.acertou
        ? 'Fala, futuro Policial! 🦅 Você cravou a alternativa **${widget.gabaritoOficial}** com precisão! Quer que eu monte um mnemônico rápido ou destrinche algum detalhe para fixar de vez na memória?'
        : 'Cabeça erguida, guerreiro! 🦅 Errar no treino é a melhor vacina para fechar a prova real. O gabarito é a letra **${widget.gabaritoOficial}**. O que você quer que eu te explique agora?';

    _mensagens.add(
      IAMensagemModel(
        id: 'msg_welcome',
        texto: saudacao,
        isUser: false,
        timestamp: DateTime.now(),
      ),
    );
  }

  Future<void> _enviarPergunta(String pergunta) async {
    final texto = pergunta.trim();
    if (texto.isEmpty || _isLoading) return;

    _textController.clear();

    setState(() {
      _mensagens.add(
        IAMensagemModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          texto: texto,
          isUser: true,
          timestamp: DateTime.now(),
        ),
      );
      _isLoading = true;
    });

    _rolarParaFim();

    try {
      final resposta = await _service.responderDuvida(
        pergunta: texto,
        enunciado: widget.enunciado,
        gabaritoOficial: widget.gabaritoOficial,
        comentario: widget.comentario,
        assunto: widget.assunto,
        banca: widget.banca,
      );

      if (mounted) {
        setState(() {
          _mensagens.add(resposta);
          _isLoading = false;
        });
        _rolarParaFim();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _mensagens.add(
            IAMensagemModel(
              id: 'err_${DateTime.now().millisecondsSinceEpoch}',
              texto: 'Ops, tive uma oscilação na conexão com o banco de dados tático. Tente enviar sua pergunta novamente!',
              isUser: false,
              timestamp: DateTime.now(),
            ),
          );
          _isLoading = false;
        });
        _rolarParaFim();
      }
    }
  }

  void _rolarParaFim() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final maxHeight = MediaQuery.of(context).size.height * 0.88;

    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Barra de Arrastar superior
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header do Professor CRAVOU AI
          _buildHeader(),

          const Divider(height: 1, color: AppColors.surfaceBorder),

          // Chips de Ação Rápida
          _buildQuickActionChips(),

          // Lista de Mensagens do Chat
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: _mensagens.length + (_isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < _mensagens.length) {
                  return _buildMensagemItem(_mensagens[index]);
                } else {
                  return _buildLoadingBubble();
                }
              },
            ),
          ),

          // Input de Texto e Botão de Envio
          _buildInputBar(bottomInset),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Row(
        children: [
          const ProfessorCravouAvatarWidget(size: 46),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Professor CRAVOU AI',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.brandNavy,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.brandOrange.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: AppColors.brandOrange.withValues(alpha: 0.4),
                          width: 0.8,
                        ),
                      ),
                      child: const Text(
                        'IA MENTOR',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w900,
                          color: AppColors.brandOrange,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  widget.assunto != null
                      ? 'Especialista em ${widget.assunto} • Banca ${widget.banca ?? 'Cebraspe'}'
                      : 'Mentor Pedagógico 24h para Concursos',
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close_rounded, color: AppColors.textSecondary),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionChips() {
    final chips = [
      '💡 Criar Mnemônico Rápido',
      '🔍 Por que os distratores estão errados?',
      '🎯 Pegadinha da Banca',
      '⚖️ Explicação Direta e Simples',
    ];

    return Container(
      height: 42,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: chips.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final chipText = chips[index];
          return ActionChip(
            label: Text(
              chipText,
              style: const TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
                color: AppColors.brandNavy,
              ),
            ),
            backgroundColor: Colors.white,
            side: const BorderSide(color: AppColors.surfaceBorder),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () => _enviarPergunta(chipText),
          );
        },
      ),
    );
  }

  Widget _buildMensagemItem(IAMensagemModel msg) {
    final isUser = msg.isUser;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[
            const ProfessorCravouAvatarWidget(size: 30, showOnlineDot: false),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isUser ? AppColors.brandCobalt : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(14),
                  topRight: const Radius.circular(14),
                  bottomLeft: Radius.circular(isUser ? 14 : 2),
                  bottomRight: Radius.circular(isUser ? 2 : 14),
                ),
                border: Border.all(
                  color: isUser ? AppColors.brandCobalt : AppColors.surfaceBorder,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Text(
                msg.texto,
                style: TextStyle(
                  fontSize: 12.5,
                  height: 1.45,
                  color: isUser ? Colors.white : AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          if (isUser) ...[
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 14,
              backgroundColor: AppColors.brandOrange.withValues(alpha: 0.2),
              child: const Icon(Icons.person, size: 16, color: AppColors.brandOrange),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildLoadingBubble() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ProfessorCravouAvatarWidget(size: 28, showOnlineDot: false),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.surfaceBorder),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.brandOrange),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'Professor CRAVOU analisando a questão...',
                  style: TextStyle(
                    fontSize: 11.5,
                    color: AppColors.textSecondary,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputBar(double bottomInset) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 8, 12, 12 + bottomInset),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.surfaceBorder)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              textInputAction: TextInputAction.send,
              onSubmitted: _enviarPergunta,
              style: const TextStyle(fontSize: 13),
              decoration: InputDecoration(
                hintText: 'Pergunte qualquer dúvida ao Professor CRAVOU...',
                hintStyle: const TextStyle(fontSize: 12, color: AppColors.textMuted),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                filled: true,
                fillColor: AppColors.surfaceElevated,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Material(
            color: AppColors.brandCobalt,
            borderRadius: BorderRadius.circular(22),
            child: InkWell(
              borderRadius: BorderRadius.circular(22),
              onTap: () => _enviarPergunta(_textController.text),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.send_rounded, color: Colors.white, size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
