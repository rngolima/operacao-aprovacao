import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/features/questoes/data/models/disciplina_model.dart';
import 'package:operacao_aprovacao_app/features/questoes/data/models/filtro_questoes.dart';
import 'package:operacao_aprovacao_app/features/questoes/data/models/questao_model.dart';

void main() {
  group('Questoes & Disciplinas - Testes Unitarios de Modelos', () {
    test('QuestaoModel serializa e deserializa com campos completos', () {
      final json = {
        'id': 1,
        'banca': 'Cebraspe',
        'orgao': 'PC-PE',
        'cargo': 'Agente de Polícia',
        'ano': 2024,
        'disciplina': 'Língua Portuguesa',
        'assunto': 'Crase',
        'enunciado': 'O policial civil obedeceu a ordens...',
        'gabaritoOficial': 'ERRADO',
        'comentarioDidatico': 'CRAVOU NO ERRO!',
        'anulada': false,
      };

      final model = QuestaoModel.fromJson(json);

      expect(model.id, equals(1));
      expect(model.banca, equals('Cebraspe'));
      expect(model.disciplina, equals('Língua Portuguesa'));
      expect(model.gabaritoOficial, equals('ERRADO'));
      expect(model.comentarioDidatico, contains('CRAVOU'));
    });

    test('DisciplinaModel mapeia icone e total de questoes', () {
      final json = {
        'id': 1,
        'nome': 'Direito Penal',
        'icone': '⚖️',
        'totalQuestoes': 12,
      };

      final model = DisciplinaModel.fromJson(json);

      expect(model.nome, equals('Direito Penal'));
      expect(model.icone, equals('⚖️'));
      expect(model.totalQuestoes, equals(12));
    });

    test('FiltroQuestoes gera query parameters compativeis com o Pageable do Spring Boot', () {
      const filtro = FiltroQuestoes(
        disciplina: 'Língua Portuguesa',
        assunto: 'Regência',
        termoBusca: 'aspiro',
        page: 2,
        size: 15,
      );

      final params = filtro.toQueryParams();

      expect(params['page'], equals(2));
      expect(params['size'], equals(15));
      expect(params['disciplina'], equals('Língua Portuguesa'));
      expect(params['assunto'], equals('Regência'));
      expect(params['q'], equals('aspiro'));
    });
  });
}
