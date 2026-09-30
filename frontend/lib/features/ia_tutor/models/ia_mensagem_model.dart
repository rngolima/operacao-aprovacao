class IAMensagemModel {
  final String id;
  final String texto;
  final bool isUser;
  final DateTime timestamp;
  final String? tipoAcao;

  const IAMensagemModel({
    required this.id,
    required this.texto,
    required this.isUser,
    required this.timestamp,
    this.tipoAcao,
  });
}
