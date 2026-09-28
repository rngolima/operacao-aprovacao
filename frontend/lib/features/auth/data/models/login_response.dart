/// DTO de resposta de autenticacao com token JWT e dados do aluno.
class LoginResponse {
  final String token;
  final String tipo;
  final int? id;
  final String nome;
  final String email;
  final String role;

  const LoginResponse({
    required this.token,
    this.tipo = 'Bearer',
    this.id,
    required this.nome,
    required this.email,
    required this.role,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    // Se o backend enviar envolvido no envelope ApiResponse: { "sucesso": true, "data": { ... } }
    final data = json.containsKey('data') && json['data'] is Map<String, dynamic>
        ? json['data'] as Map<String, dynamic>
        : json;

    return LoginResponse(
      token: data['token'] as String? ?? '',
      tipo: data['tipo'] as String? ?? 'Bearer',
      id: data['id'] as int?,
      nome: data['nome'] as String? ?? '',
      email: data['email'] as String? ?? '',
      role: data['role'] as String? ?? 'ROLE_STUDENT',
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'tipo': tipo,
        'id': id,
        'nome': nome,
        'email': email,
        'role': role,
      };
}
