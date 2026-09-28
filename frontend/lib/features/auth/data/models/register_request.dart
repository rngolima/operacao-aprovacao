/// DTO de requisicao de Cadastro de novo Aluno Operacional.
class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final String targetCargo;

  const RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    this.targetCargo = 'Agente de Polícia',
  });

  Map<String, dynamic> toJson() => {
        'nome': name.trim(),
        'email': email.trim(),
        'password': password,
      };
}
