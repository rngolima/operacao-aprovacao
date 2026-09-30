import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../models/ia_mensagem_model.dart';
import '../../services/audio/professor_cravou_audio_service.dart';
import '../../services/professor_cravou_service.dart';
import 'professor_cravou_avatar_widget.dart';

/// Modal interativo de Tira-Dúvidas e Mentoria com o Professor CRAVOU AI.
/// Inclui suporte a explicação em áudio falada por voz humana em Português do Brasil!
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
  final ProfessorCravouAudioService _audioService = ProfessorCravouAudioService();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<IAMensagemModel> _mensagens = [];
  bool _isLoading = false;
  String? _tocandoMensagemId;
  bool _temGeminiAtivo = false;

  @override
  void initState() {
    super.initState();
    _adicionarMensagemBoasVindas();
    _verificarChaveGemini();
  }

  Future<void> _verificarChaveGemini() async {
    final ativa = await _service.temChaveGeminiConfigurada();
    if (mounted) {
      setState(() {
        _temGeminiAtivo = ativa;
      });
    }
  }

  void _adicionarMensagemBoasVindas() {
    final saudacao = widget.acertou
        ? 'Fala, futuro Policial! 🦅 Você cravou a alternativa **${widget.gabaritoOficial}** com precisão cirúrgica!\n\nSe preferir, pode até tocar no botão de áudio abaixo de qualquer mensagem minha para **me ouvir explicar em voz alta**, como numa mentoria presencial! Quer que eu te passe um mnemônico rápido ou analise alguma pegadinha?'
        : 'Cabeça erguida, meu amigo! 🦅 Errar no treino é a melhor coisa para você chegar afiado e cravar no dia da prova da PC-PE. O gabarito é a letra **${widget.gabaritoOficial}**.\n\nToque no botão de áudio abaixo para me ouvir destrinchar ou me pergunte qualquer dúvida que tiver!';

    _mensagens.add(
      IAMensagemModel(
        id: 'msg_welcome',
        texto: saudacao,
        isUser: false,
        timestamp: DateTime.now(),
      ),
    );
  }

  void _toggleAudio(IAMensagemModel msg) {
    if (_tocandoMensagemId == msg.id) {
      _audioService.stop();
      setState(() {
        _tocandoMensagemId = null;
      });
    } else {
      _audioService.stop();
      setState(() {
        _tocandoMensagemId = msg.id;
      });
      _audioService.speak(
        msg.texto,
        onStart: () {
          if (mounted) {
            setState(() {
              _tocandoMensagemId = msg.id;
            });
          }
        },
        onDone: () {
          if (mounted) {
            setState(() {
              _tocandoMensagemId = null;
            });
          }
        },
      );
    }
  }

  Future<void> _enviarPergunta(String pergunta) async {
    final texto = pergunta.trim();
    if (texto.isEmpty || _isLoading) return;

    _audioService.stop();
    setState(() {
      _tocandoMensagemId = null;
    });

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
              texto: 'Ops, tive uma leve oscilação na conexão com a central tática. Tente enviar sua pergunta novamente!',
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
    _audioService.stop();
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

          // Header do Professor CRAVOU AI com nosso bonequinho mascote
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
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    const Text(
                      'Professor CRAVOU AI',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.brandNavy,
                      ),
                    ),
                    InkWell(
                      onTap: _abrirConfiguracaoGemini,
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: _temGeminiAtivo
                              ? const Color(0xFFDCFCE7)
                              : AppColors.brandOrange.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: _temGeminiAtivo
                                ? const Color(0xFF16A34A)
                                : AppColors.brandOrange.withValues(alpha: 0.4),
                            width: 0.8,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(_temGeminiAtivo ? '🟢' : '⚡', style: const TextStyle(fontSize: 8)),
                            const SizedBox(width: 3),
                            Text(
                              _temGeminiAtivo ? 'GEMINI 1.5 FLASH' : 'CONECTAR GEMINI',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w900,
                                color: _temGeminiAtivo ? const Color(0xFF15803D) : AppColors.brandOrange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  _temGeminiAtivo
                      ? '🟢 IA Conectada • Raciocínio Gemini 1.5 em Tempo Real'
                      : (widget.assunto != null
                          ? 'Mentor em ${widget.assunto} • Explicação em Áudio'
                          : 'Mentor Pedagógico 24h • Explicação em Áudio'),
                  style: TextStyle(
                    fontSize: 11,
                    color: _temGeminiAtivo ? const Color(0xFF15803D) : AppColors.textSecondary,
                    fontWeight: _temGeminiAtivo ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.vpn_key_rounded,
              color: _temGeminiAtivo ? const Color(0xFF16A34A) : AppColors.brandOrange,
              size: 20,
            ),
            tooltip: 'Configurar Chave Google Gemini',
            onPressed: _abrirConfiguracaoGemini,
          ),
          IconButton(
            icon: const Icon(Icons.close_rounded, color: AppColors.textSecondary),
            onPressed: () {
              _audioService.stop();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _abrirConfiguracaoGemini() async {
    final chaveAtual = await _service.obterChaveGemini() ?? '';
    final controller = TextEditingController(text: chaveAtual);

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: const [
            Icon(Icons.smart_toy_rounded, color: AppColors.brandCobalt, size: 24),
            SizedBox(width: 8),
            Text(
              'Google Gemini 1.5 Flash',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Conecte sua chave gratuita do Google AI Studio para conversar com o modelo oficial do Gemini em tempo real, com raciocínio ilimitado e capacidade de tirar qualquer dúvida complexa!',
              style: TextStyle(fontSize: 12.5, color: AppColors.textSecondary, height: 1.4),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Chave de API do Gemini (AI Studio)',
                hintText: 'Cole sua chave AIzaSy...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.vpn_key_rounded, size: 18),
              ),
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 8),
            const Text(
              '💡 Obtenha sua chave grátis em https://aistudio.google.com/',
              style: TextStyle(fontSize: 11, color: AppColors.brandCobalt, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              await _service.salvarChaveGemini(controller.text);
              await _verificarChaveGemini();
              if (ctx.mounted) Navigator.of(ctx).pop();
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      controller.text.trim().isEmpty
                          ? 'Chave removida. Usando motor cognitivo local.'
                          : '🚀 Google Gemini 1.5 Flash ativado com sucesso!',
                    ),
                    backgroundColor: const Color(0xFF16A34A),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.brandCobalt,
              foregroundColor: Colors.white,
            ),
            child: const Text('Salvar e Ativar'),
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
    final isPlaying = _tocandoMensagemId == msg.id;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[
            const ProfessorCravouAvatarWidget(size: 32, showOnlineDot: false),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
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
                      height: 1.48,
                      color: isUser ? Colors.white : AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // Botão de Áudio com a Voz do Professor CRAVOU
                if (!isUser) ...[
                  const SizedBox(height: 6),
                  InkWell(
                    onTap: () => _toggleAudio(msg),
                    borderRadius: BorderRadius.circular(16),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: isPlaying ? const Color(0xFFFEF3C7) : const Color(0xFFEFF6FF),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isPlaying ? AppColors.brandOrange : AppColors.brandCobalt.withValues(alpha: 0.25),
                          width: 1.2,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isPlaying ? Icons.pause_circle_filled_rounded : Icons.volume_up_rounded,
                            size: 15,
                            color: isPlaying ? AppColors.brandOrange : AppColors.brandCobalt,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            isPlaying ? 'Pausar Áudio do Professor' : '🔊 Ouvir Explicação do Professor',
                            style: TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.bold,
                              color: isPlaying ? const Color(0xFF92400E) : AppColors.brandNavy,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
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
                  'Professor CRAVOU preparando sua explicação...',
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
