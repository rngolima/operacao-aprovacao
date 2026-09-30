import 'dart:async';
import '../models/ia_mensagem_model.dart';

/// Serviço inteligente do Professor CRAVOU AI.
/// Gera orientações pedagógicas, mnemônicos, desconstrução de pegadinhas
/// e responde dúvidas pontuais dos alunos com foco no estilo da banca organizadora.
class ProfessorCravouService {
  /// Gera uma resposta didática e contextualizada com base no contexto da questão.
  Future<IAMensagemModel> responderDuvida({
    required String pergunta,
    required String enunciado,
    required String gabaritoOficial,
    required String comentario,
    String? assunto,
    String? banca,
  }) async {
    // Simula tempo de processamento cognitivo (sensação realista de resposta de IA)
    await Future.delayed(const Duration(milliseconds: 600));

    final normalized = pergunta.toLowerCase();
    String resposta;

    if (normalized.contains('mnemônico') || normalized.contains('mnemonico') || normalized.contains('macete')) {
      resposta = _gerarMnemonico(assunto: assunto, gabarito: gabaritoOficial);
    } else if (normalized.contains('por que') || normalized.contains('porque') || normalized.contains('distrator') || normalized.contains('errad')) {
      resposta = _gerarExplicacaoDistratores(
        gabarito: gabaritoOficial,
        comentario: comentario,
        assunto: assunto,
      );
    } else if (normalized.contains('banca') || normalized.contains('cebraspe') || normalized.contains('aocp') || normalized.contains('prova')) {
      resposta = _gerarDicaBanca(banca: banca ?? 'Cebraspe / AOCP', assunto: assunto);
    } else if (normalized.contains('simples') || normalized.contains('leigo') || normalized.contains('resumo')) {
      resposta = _gerarExplicacaoSimples(comentario: comentario, gabarito: gabaritoOficial);
    } else {
      resposta = _gerarRespostaLivre(
        pergunta: pergunta,
        gabarito: gabaritoOficial,
        comentario: comentario,
        assunto: assunto,
      );
    }

    return IAMensagemModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      texto: resposta,
      isUser: false,
      timestamp: DateTime.now(),
    );
  }

  String _gerarMnemonico({String? assunto, required String gabarito}) {
    if (assunto != null && assunto.toLowerCase().contains('crase')) {
      return '🦉 **Dica de Ouro do Professor CRAVOU:**\n\n'
          'Para Cravar o uso da Crase diante de palavras femininas:\n'
          '👉 **"Troca a feminina por masculina:** se der **AO**, crase haverá! Se der apenas **O**, crase pra quê?"\n'
          '👉 Diante de verbos, pronomes pessoais e palavras masculinas: **CRASE É CRIME!** (Cuidado com a pegadinha clássica da banca!).';
    } else if (assunto != null && assunto.toLowerCase().contains('concord')) {
      return '🦉 **Mnemônico Tático do Professor CRAVOU:**\n\n'
          '👉 **Verbo HAVER no sentido de existir:** é "solteirão convicto", nunca vai pro plural! Permanece sempre na 3ª pessoa do singular (ex: *Havia muitos candidatos*, nunca *Haviam*).\n'
          '👉 **Verbo FAZER indicando tempo:** também é impessoal! (*Faz dois anos*, nunca *Fazem dois anos*). Guarde isso e Crave na prova!';
    } else if (assunto != null && assunto.toLowerCase().contains('regência')) {
      return '🦉 **Mnemônico Tático do Professor CRAVOU:**\n\n'
          '👉 **VISAR e ASPIRAR:** no sentido de desejar / pretender, exigem preposição **A** (*Aspiro AO cargo de Agente*, *Viso À aprovação*).\n'
          '👉 **ASSISTIR:** no sentido de presenciar/ver, exige **A** (*Assisti AO treino*). No sentido de prestar socorro, não exige (*O médico assistiu o ferido*).';
    }

    return '🦉 **Mnemônico Tático do Professor CRAVOU:**\n\n'
        'Para fixar o gabarito **$gabarito** e não cair nas armadilhas da banca:\n'
        '👉 Identifique primeiro o **núcleo do comando da questão**;\n'
        '👉 Descarte as alternativas com termos absolutistas (*"sempre"*, *"nunca"*, *"exclusivamente"*);\n'
        '👉 A alternativa **$gabarito** traz a regra literal e a jurisprudência pacífica. Anote essa regra no seu caderno de erros!';
  }

  String _gerarExplicacaoDistratores({
    required String gabarito,
    required String comentario,
    String? assunto,
  }) {
    return '🦉 **Análise Cirúrgica do Professor CRAVOU:**\n\n'
        'O gabarito oficial é a alternativa **$gabarito**. Veja por que os outros itens são distratores perigosos:\n\n'
        '1. **Generalização Indevida:** A banca colocou termos que fecham totalmente a interpretação do texto de lei ou do enunciado;\n'
        '2. **Inversão de Conceitos:** Em questões de $assunto, as bancas adoram trocar a regra pela exceção;\n'
        '3. **A Alternativa $gabarito:** É a única que respeita integralmente a previsão legal e a gramática normativa sem extrapolações.\n\n'
        '💡 *Dica do Mentor:* Quando bater dúvida entre duas opções, escolha a que for mais técnica e direta!';
  }

  String _gerarDicaBanca({required String banca, String? assunto}) {
    return '🦉 **Padrão Comportamental da Banca ($banca):**\n\n'
        'Nos concursos policiais, o examinador costuma priorizar em **${assunto ?? 'essa disciplina'}**:\n'
        '• Casos práticos simulando situações de delegacia ou abordagem policial;\n'
        '• Substituição de conectivos e termos com mudança sutil de sentido;\n'
        '• Interpretação de enunciados longos onde a resposta está na leitura atenta dos detalhes.\n\n'
        'Mantenha o ritmo de resolução em até 2 minutos por item para sobrar tempo pro TAF intelectual (a redação discursiva)!';
  }

  String _gerarExplicacaoSimples({required String comentario, required String gabarito}) {
    return '🦉 **Direto ao Ponto com o Professor CRAVOU:**\n\n'
        'Em resumo simples para você gabaritar:\n'
        'A resposta certa é a letra **$gabarito**. A banca tentou te confundir misturando conceitos semelhantes, mas a regra central aqui é pontual: memorize a definição exata e aplique sem complicar. Você está no caminho certo!';
  }

  String _gerarRespostaLivre({
    required String pergunta,
    required String gabarito,
    required String comentario,
    String? assunto,
  }) {
    return '🦉 **Professor CRAVOU AI analisando sua dúvida:**\n\n'
        'Entendi perfeitamente sua pergunta sobre *"$pergunta"*.\n\n'
        'Nesta questão (${assunto ?? 'Tópico do Edital'}), o gabarito definitivo é a letra **$gabarito**.\n'
        'O fundamento chave que sustenta essa resposta é a aplicação rigorosa da regra expressa na fundamentação pedagógica. '
        'Fique muito atento para não confundir o sentido literal com interpretações extensivas que a banca não autorizou no enunciado.\n\n'
        'Tem mais alguma nuance ou alternativa que você gostaria que eu destrinchasse? Pode perguntar!';
  }
}
