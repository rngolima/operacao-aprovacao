import '../../../../../core/theme/app_colors.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import 'portugues_aula_01.dart';
import 'portugues_aula_02.dart';
import 'portugues_aula_03.dart';
import 'portugues_aula_04.dart';
import 'portugues_aula_05.dart';
import 'portugues_aula_06.dart';
import 'portugues_aula_07.dart';
import 'portugues_aula_08.dart';

/// Acervo Oficial de Língua Portuguesa do CRAVOU para os Editais PM-PE / PC-PE.
/// Contém as 8 aulas do conteúdo programático completo, cada uma com:
/// 1. Resumo Teórico Didático Enriquecido (Método CRAVOU autoral, sem violação de direitos autorais);
/// 2. Mapa Mental Tático Estruturado (Conceito Central + Regra de Ouro + 4 Ramos);
/// 3. Mínimo de 15 Questões direcionadas por assunto com gabarito e comentário pedagógico.
/// Total: 8 Aulas • 120 Questões Comentadas.
class PortuguesConteudoOficial {
  PortuguesConteudoOficial._();

  /// As 8 Aulas Oficiais de Português
  static final List<AulaGuiaItem> aulas = [
    portuguesAula01,
    portuguesAula02,
    portuguesAula03,
    portuguesAula04,
    portuguesAula05,
    portuguesAula06,
    portuguesAula07,
    portuguesAula08,
  ];

  /// Coleção completa de todas as 120 questões de Língua Portuguesa
  static List<QuestaoModel> get todasAsQuestoes {
    final List<QuestaoModel> lista = [];
    for (final aula in aulas) {
      if (aula.questoes != null) {
        lista.addAll(aula.questoes!);
      }
    }
    return lista;
  }

  /// Módulo estruturado de Língua Portuguesa para exibição no Guia de Estudos
  static ModuloGuiaEstudo get moduloGuiaEstudo {
    return ModuloGuiaEstudo(
      id: 'portugues',
      nome: 'Língua Portuguesa (Instituto AOCP)',
      icone: '✍️',
      corBadge: AppColors.brandCobalt,
      totalAulas: aulas.length,
      totalQuestoes: todasAsQuestoes.length,
      aulas: aulas,
    );
  }
}
