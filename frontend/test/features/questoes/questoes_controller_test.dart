import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/core/network/api_client.dart';
import 'package:operacao_aprovacao_app/features/questoes/data/datasources/questoes_remote_data_source.dart';
import 'package:operacao_aprovacao_app/features/questoes/data/repositories/questoes_repository_impl.dart';
import 'package:operacao_aprovacao_app/features/questoes/presentation/controllers/questoes_controller.dart';

void main() {
  late QuestoesController controller;

  setUp(() {
    final remoteDataSource = QuestoesRemoteDataSource(apiClient: ApiClient());
    final repository = QuestoesRepositoryImpl(remoteDataSource: remoteDataSource);
    controller = QuestoesController(repository);
  });

  group('QuestoesController - Testes Unitarios de Treino e Filtro', () {
    test('Inicializa carregando disciplinas e questoes do catalogo oficial', () async {
      await controller.inicializar();

      expect(controller.disciplinas.isNotEmpty, isTrue);
      expect(controller.questoes.isNotEmpty, isTrue);
      expect(controller.disciplinaAtiva, equals('Todas'));
    });

    test('Filtra questoes por Lingua Portuguesa', () async {
      await controller.inicializar();
      await controller.selecionarDisciplina('Língua Portuguesa');

      expect(controller.disciplinaAtiva, equals('Língua Portuguesa'));
      for (final q in controller.questoes) {
        expect(q.disciplina, equals('Língua Portuguesa'));
      }
    });

    test('Registra acerto do aluno quando resposta bate com gabarito oficial', () async {
      await controller.inicializar();
      final questao = controller.questoes.firstWhere((q) => q.gabaritoOficial == 'ERRADO');

      controller.responder(questao, 'ERRADO');

      expect(controller.respostaDoAluno(questao.id), equals('ERRADO'));
      expect(controller.isGabaritoRevelado(questao.id), isTrue);
      expect(controller.totalAcertos, equals(1));
      expect(controller.totalErros, equals(0));
    });

    test('Registra erro do aluno quando resposta diverge do gabarito oficial', () async {
      await controller.inicializar();
      final questao = controller.questoes.firstWhere((q) => q.gabaritoOficial == 'CERTO');

      controller.responder(questao, 'ERRADO');

      expect(controller.respostaDoAluno(questao.id), equals('ERRADO'));
      expect(controller.isGabaritoRevelado(questao.id), isTrue);
      expect(controller.totalAcertos, equals(0));
      expect(controller.totalErros, equals(1));
    });
  });
}
