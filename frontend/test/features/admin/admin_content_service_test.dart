import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/core/network/api_client.dart';
import 'package:operacao_aprovacao_app/core/state/plano_estudo_state.dart';
import 'package:operacao_aprovacao_app/features/admin/data/services/admin_content_service.dart';
import 'package:operacao_aprovacao_app/features/questoes/data/datasources/questoes_remote_data_source.dart';
import 'package:operacao_aprovacao_app/features/questoes/data/models/filtro_questoes.dart';
import 'package:operacao_aprovacao_app/features/questoes/data/models/questao_model.dart';

void main() {
  group('AdminContentService - Testes Unitários de Alimentação de Conteúdo (Produção)', () {
    late AdminContentService service;

    setUp(() {
      service = AdminContentService.instance;
    });

    test('Inicializa com editais oficiais de referência pré-carregados', () {
      expect(service.editais.isNotEmpty, isTrue);
      expect(service.editais.any((e) => e.concurso.contains('PM-PE')), isTrue);
      expect(service.totalEditais, greaterThanOrEqualTo(2));
    });

    test('Publica novo Edital Oficial extraído de PDF e atualiza PlanoEstudoState', () {
      service.publicarEdital(
        concurso: 'PM-PE (Polícia Militar de Pernambuco)',
        cargo: 'Soldado da Polícia Militar',
        banca: 'Instituto AOCP',
        vagas: '1.250 Vagas',
        remuneracao: 'R\$ 5.617,92',
        dataProva: '21/02/2027',
        nomeArquivo: 'Edital_Oficial_PMPE_AOCP_2026.pdf',
        tamanhoArquivo: '3.8 MB',
        questoesProva: 60,
        disciplinas: [
          'Língua Portuguesa',
          'História de Pernambuco',
          'Raciocínio Lógico Matemático',
        ],
        semanasAteProva: 21,
      );

      final editalPublicado = service.editais.firstWhere(
        (e) => e.nomeArquivo == 'Edital_Oficial_PMPE_AOCP_2026.pdf',
      );
      expect(editalPublicado.status, equals('PUBLICADO'));
      expect(editalPublicado.banca, equals('Instituto AOCP'));

      // Verifica sincronização com o estado global do aluno
      expect(PlanoEstudoState.instance.nomeArquivoEdital, equals('Edital_Oficial_PMPE_AOCP_2026.pdf'));
      expect(PlanoEstudoState.instance.semanasAteProva, equals(21));
    });

    test('Cadastra Aula / Resumo Didático e disponibiliza para o Guia de Estudos', () {
      final totalMateriaisAntes = service.totalMateriais;

      service.cadastrarAulaDidatica(
        disciplina: 'História de Pernambuco',
        titulo: 'Guerra dos Mascates (1710) - Recife vs Olinda',
        tempoLeitura: '12 min',
        conteudoTeorico: 'A rivalidade entre os mascates recifenses e os senhores de engenho de Olinda.',
        destaque: true,
      );

      expect(service.totalMateriais, equals(totalMateriaisAntes + 1));

      final aulasHistoria = service.obterAulasPorDisciplina('História de Pernambuco');
      expect(aulasHistoria.any((a) => a.titulo.contains('Guerra dos Mascates')), isTrue);
      expect(aulasHistoria.firstWhere((a) => a.titulo.contains('Guerra dos Mascates')).destaque, isTrue);
    });

    test('Cadastra Material em PDF e registra no repositório administrativo', () {
      service.cadastrarMaterialPdf(
        disciplina: 'Direito Constitucional',
        titulo: 'Vade Mecum Constitucional Atualizado',
        nomeArquivo: 'vade_mecum_const_2026.pdf',
        tamanhoArquivo: '5.1 MB',
      );

      final pdfMaterial = service.materiais.firstWhere(
        (m) => m.titulo.contains('Vade Mecum Constitucional Atualizado'),
      );
      expect(pdfMaterial.tipo, equals('LEGISLACAO'));
      expect(pdfMaterial.disciplina, equals('Direito Constitucional'));
    });

    test('Cadastra Questão Inédita/Oficial com alternativas (A-E) e sincroniza no QuestoesRemoteDataSource', () async {
      const novaQuestao = QuestaoModel(
        id: 9999,
        banca: 'Instituto AOCP',
        orgao: 'PM-PE',
        cargo: 'Soldado',
        ano: 2026,
        disciplina: 'Língua Portuguesa',
        assunto: 'Crase & Pronome Demonstrativo',
        enunciado: 'Assinale a alternativa em que o uso do acento grave é facultativo.',
        gabaritoOficial: 'C',
        comentarioDidatico: 'CRAVOU! Diante de pronome possessivo feminino singular a crase é facultativa.',
        alternativas: {
          'A': 'Dirigi-me a pé até a praia.',
          'B': 'Entreguei o documento a sua senhoria.',
          'C': 'Fiz referência a minha cidade.',
          'D': 'Ele assistiu a aula sem reclamar.',
          'E': 'Chegamos a noite cansados.',
        },
      );

      service.cadastrarQuestao(novaQuestao);

      expect(service.questoesCustomizadas.any((q) => q.id == 9999), isTrue);

      // Sincronizado com o data source remoto / offline
      final dataSource = QuestoesRemoteDataSource(apiClient: ApiClient(dio: Dio()));
      final resultado = await dataSource.getQuestoes(
        const FiltroQuestoes(disciplina: 'Língua Portuguesa'),
      );

      expect(resultado.any((q) => q.id == 9999), isTrue);
      final questaoBuscada = resultado.firstWhere((q) => q.id == 9999);
      expect(questaoBuscada.alternativas?['C'], equals('Fiz referência a minha cidade.'));
      expect(questaoBuscada.gabaritoOficial, equals('C'));
    });
  });
}
