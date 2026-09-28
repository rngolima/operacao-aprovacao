import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/features/auth/data/models/login_request.dart';
import 'package:operacao_aprovacao_app/features/auth/data/models/login_response.dart';
import 'package:operacao_aprovacao_app/features/auth/data/models/register_request.dart';

void main() {
  group('Modelos de Autenticacao - Serializacao e Deserializacao', () {
    test('LoginRequest serializa corretamente para JSON', () {
      const request = LoginRequest(
        email: 'agente@policiacivil.pe.gov.br',
        password: 'senhaOperacional123',
      );

      final json = request.toJson();

      expect(json['email'], equals('agente@policiacivil.pe.gov.br'));
      expect(json['password'], equals('senhaOperacional123'));
    });

    test('RegisterRequest serializa com campos exigidos pelo backend Spring Boot', () {
      const request = RegisterRequest(
        name: 'Rudson Americo',
        email: 'rudson@operacaoaprovacao.com',
        password: 'senhaForte123',
        targetCargo: 'Agente de Polícia',
      );

      final json = request.toJson();

      expect(json['nome'], equals('Rudson Americo'));
      expect(json['email'], equals('rudson@operacaoaprovacao.com'));
      expect(json['password'], equals('senhaForte123'));
    });

    test('LoginResponse deserializa JSON direto do AuthResponse do backend', () {
      final json = {
        'token': 'eyJhbGciOiJIUzI1NiJ9.testToken',
        'tipo': 'Bearer',
        'id': 1,
        'nome': 'Rudson Americo',
        'email': 'rudson@operacaoaprovacao.com',
        'role': 'ROLE_STUDENT',
      };

      final response = LoginResponse.fromJson(json);

      expect(response.token, equals('eyJhbGciOiJIUzI1NiJ9.testToken'));
      expect(response.tipo, equals('Bearer'));
      expect(response.id, equals(1));
      expect(response.nome, equals('Rudson Americo'));
      expect(response.role, equals('ROLE_STUDENT'));
    });

    test('LoginResponse deserializa quando envolvido no envelope ApiResponse', () {
      final envelopeJson = {
        'sucesso': true,
        'mensagem': 'Login realizado com sucesso.',
        'data': {
          'token': 'jwt.token.valido',
          'tipo': 'Bearer',
          'id': 2,
          'nome': 'Candidato PC-PE',
          'email': 'candidato@pe.gov.br',
          'role': 'ROLE_ADMIN',
        },
      };

      final response = LoginResponse.fromJson(envelopeJson);

      expect(response.token, equals('jwt.token.valido'));
      expect(response.nome, equals('Candidato PC-PE'));
      expect(response.role, equals('ROLE_ADMIN'));
    });
  });
}
