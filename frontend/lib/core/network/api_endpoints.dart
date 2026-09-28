/// Central de rotas e URLs da API Backend da Operacao Aprovacao.
abstract class ApiEndpoints {
  // Base URL padrao (pode ser sobrescrita em runtime ou flavor)
  static const String defaultBaseUrl = 'http://localhost:8080';

  // --- Rotas de Autenticacao & Seguranca ---
  static const String login = '/api/v1/auth/login';
  static const String register = '/api/v1/auth/register';
  static const String me = '/api/v1/auth/me';

  // --- Rotas de Monitoramento e Saude ---
  static const String health = '/api/v1/health';

  // --- Rotas de Dominio e Simulados ---
  static const String editais = '/api/v1/editais';
  static const String questoes = '/api/v1/questoes';
  static const String simulados = '/api/v1/simulados';
}
