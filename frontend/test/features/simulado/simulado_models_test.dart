import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/features/simulado/data/models/item_resposta_simulado.dart';
import 'package:operacao_aprovacao_app/features/simulado/data/models/resultado_simulado_model.dart';
import 'package:operacao_aprovacao_app/features/simulado/data/models/simulado_model.dart';

void main() {
  group('Simulado Models & Motor Cebraspe Tests', () {
    test('SimuladoModel e ItemSimuladoModel devem serializar e deserializar corretamente', () {
      final item = ItemSimuladoModel(
        id: 1,
        numeroQuestao: 1,
        questaoId: 101,
        enunciado: 'Enunciado Cebraspe de Teste',
        disciplinaNome: 'DIREITO PENAL',
        assuntoNome: 'CRIMES CONTRA A VIDA',
        gabaritoOficial: 'C',
        explicacaoDidatica: 'Explicacao didatica CRAVOU!',
      );

      final jsonItem = item.toJson();
      expect(jsonItem['numeroQuestao'], equals(1));
      expect(jsonItem['disciplinaNome'], equals('DIREITO PENAL'));

      final itemRecriado = ItemSimuladoModel.fromJson(jsonItem);
      expect(itemRecriado.questaoId, equals(101));
      expect(itemRecriado.gabaritoOficial, equals('C'));

      final simulado = SimuladoModel(
        id: 42,
        titulo: 'Simulado PC-PE Oficial',
        descricao: 'Caderno de teste',
        concursoOrgao: 'PC-PE',
        tempoLimiteMinutos: 270,
        totalQuestoes: 1,
        itens: [item],
      );

      expect(simulado.duracaoSegundos, equals(16200)); // 270 * 60 = 4h30min
      final jsonSimulado = simulado.toJson();
      expect(jsonSimulado['id'], equals(42));
      expect(jsonSimulado['itens'], isList);

      final simuladoRecriado = SimuladoModel.fromJson(jsonSimulado);
      expect(simuladoRecriado.itens.length, equals(1));
      expect(simuladoRecriado.itens.first.assuntoNome, equals('CRIMES CONTRA A VIDA'));
    });

    test('ItemRespostaSimulado deve permitir alteração via copyWith e toJson', () {
      final resposta = ItemRespostaSimulado(
        numeroQuestao: 5,
        questaoId: 505,
        respostaMarcada: 'E',
        marcadaParaRevisao: false,
        tempoGastoSegundos: 45,
      );

      final alterada = resposta.copyWith(
        respostaMarcada: 'C',
        marcadaParaRevisao: true,
        tempoGastoSegundos: 60,
      );

      expect(alterada.respostaMarcada, equals('C'));
      expect(alterada.marcadaParaRevisao, isTrue);
      expect(alterada.tempoGastoSegundos, equals(60));

      final json = alterada.toJson();
      expect(json['questaoId'], equals(505));
      expect(json['respostaMarcada'], equals('C'));
    });

    test('ResultadoSimuladoModel deve computar métricas oficiais Cebraspe (C - E)', () {
      final resultado = ResultadoSimuladoModel(
        tentativaId: 10,
        simuladoId: 1,
        simuladoTitulo: 'Simulado PC-PE Agente',
        tempoTotalSegundos: 12645, // 03h 30m 45s
        pontuacaoLiquida: 38.0, // 42 acertos - 4 erros
        totalAcertos: 42,
        totalErros: 4,
        totalEmBranco: 14,
        totalQuestoes: 60,
        aprovado: true,
        desempenhoPorDisciplina: {
          'LÍNGUA PORTUGUESA': DesempenhoDisciplinaSimulado(
            disciplina: 'LÍNGUA PORTUGUESA',
            totalItens: 10,
            acertos: 8,
            erros: 1,
            emBranco: 1,
          ),
        },
      );

      expect(resultado.tempoFormatado, equals('03:30:45'));
      expect(resultado.percentualBruto, closeTo(70.0, 0.01)); // (42/60)*100 = 70%
      expect(resultado.aproveitamentoLiquido, closeTo(63.33, 0.01)); // (38/60)*100 = 63.33%
      expect(resultado.aprovado, isTrue);

      final discPort = resultado.desempenhoPorDisciplina['LÍNGUA PORTUGUESA']!;
      expect(discPort.saldoLiquido, equals(7)); // 8 acertos - 1 erro = +7 pontos
    });
  });
}
