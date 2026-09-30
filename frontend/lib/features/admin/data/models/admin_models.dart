/// Modelos de Dados do Painel de Controle do Administrador (QG CRAVOU).
library;

class AdminEstatisticas {
  final int totalUsuarios;
  final int usuariosAtivosHoje;
  final int usuariosPro;
  final double taxaConversaoPro;
  final double mrrMensal;
  final double faturamentoTotal;
  final int totalQuestoes;
  final int totalEditais;
  final int editaisAtivos;

  const AdminEstatisticas({
    required this.totalUsuarios,
    required this.usuariosAtivosHoje,
    required this.usuariosPro,
    required this.taxaConversaoPro,
    required this.mrrMensal,
    required this.faturamentoTotal,
    required this.totalQuestoes,
    required this.totalEditais,
    required this.editaisAtivos,
  });
}

class UsuarioAdminModel {
  final int id;
  final String nome;
  final String email;
  final String concursoAlvo;
  final String cargoAlvo;
  final String statusInscricao; // 'HOMOLOGADO', 'PENDENTE_EMAIL', 'BLOQUEADO'
  final bool isPro;
  final String dataCadastro;
  final int questoesRespondidas;
  final double taxaAcerto;

  const UsuarioAdminModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.concursoAlvo,
    required this.cargoAlvo,
    required this.statusInscricao,
    required this.isPro,
    required this.dataCadastro,
    required this.questoesRespondidas,
    required this.taxaAcerto,
  });
}

class EditalAdminModel {
  final String id;
  final String concurso;
  final String cargo;
  final String banca;
  final String vagas;
  final String remuneracao;
  final String dataPublicacao;
  final String dataProva;
  final String nomeArquivo;
  final String tamanhoArquivo;
  final String status; // 'PUBLICADO', 'PROCESSANDO', 'RASCUNHO'
  final int questoesProva;
  final List<String> disciplinas;

  const EditalAdminModel({
    required this.id,
    required this.concurso,
    required this.cargo,
    required this.banca,
    required this.vagas,
    required this.remuneracao,
    required this.dataPublicacao,
    required this.dataProva,
    required this.nomeArquivo,
    required this.tamanhoArquivo,
    required this.status,
    required this.questoesProva,
    required this.disciplinas,
  });
}

class MaterialDidaticoModel {
  final String id;
  final String disciplina;
  final String titulo;
  final String tipo; // 'AULA_RESUMO', 'BANCO_QUESTOES', 'SIMULADO', 'LEGISLACAO'
  final String dataUpload;
  final String autor;
  final int visualizacoes;

  const MaterialDidaticoModel({
    required this.id,
    required this.disciplina,
    required this.titulo,
    required this.tipo,
    required this.dataUpload,
    required this.autor,
    required this.visualizacoes,
  });
}
