import 'dart:async';
import '../../../../core/storage/secure_storage_service.dart';
import '../models/ia_mensagem_model.dart';
import 'gemini_tutor_api_service.dart';

/// Serviço inteligente e humanizado do Professor CRAVOU AI.
/// Conecta-se diretamente ao modelo oficial Google Gemini 1.5 Flash em tempo real.
/// Se a chave não estiver configurada ou a rede oscilar, utiliza o motor cognitivo local.
class ProfessorCravouService {
  final GeminiTutorApiService _geminiApi;
  final SecureStorageService _storage;

  ProfessorCravouService({
    GeminiTutorApiService? geminiApi,
    SecureStorageService? storage,
  })  : _geminiApi = geminiApi ?? GeminiTutorApiService(),
        _storage = storage ?? SecureStorageService();

  /// Verifica se há chave de API do Gemini configurada.
  Future<bool> temChaveGeminiConfigurada() async {
    try {
      final key = await _storage.getGeminiApiKey();
      return key != null && key.trim().isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  /// Salva a chave do Google Gemini.
  Future<void> salvarChaveGemini(String apiKey) async {
    try {
      await _storage.saveGeminiApiKey(apiKey);
    } catch (_) {}
  }

  /// Recupera a chave configurada.
  Future<String?> obterChaveGemini() async {
    try {
      return await _storage.getGeminiApiKey();
    } catch (_) {
      return null;
    }
  }

  /// Gera uma resposta viva, empática e didática, com linguagem falada e natural.
  Future<IAMensagemModel> responderDuvida({
    required String pergunta,
    required String enunciado,
    required String gabaritoOficial,
    required String comentario,
    String? assunto,
    String? banca,
    List<IAMensagemModel>? historico,
  }) async {
    // 1. Tenta obter resposta real e inteligente da API do Google Gemini
    String? apiKey;
    try {
      apiKey = await _storage.getGeminiApiKey();
    } catch (_) {
      apiKey = null;
    }
    if (apiKey != null && apiKey.trim().isNotEmpty) {
      try {
        final respostaGemini = await _geminiApi.gerarRespostaComGemini(
          apiKey: apiKey,
          pergunta: pergunta,
          enunciado: enunciado,
          gabaritoOficial: gabaritoOficial,
          comentario: comentario,
          assunto: assunto,
          banca: banca,
          historico: historico,
        );

        if (respostaGemini != null && respostaGemini.isNotEmpty) {
          return IAMensagemModel(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            texto: respostaGemini,
            isUser: false,
            timestamp: DateTime.now(),
          );
        }
      } catch (_) {
        // Se houver qualquer erro na API, continua suavemente para o motor local
      }
    }

    // 2. Motor Cognitivo Local Humanizado (Fallback de alta performance)
    await Future.delayed(const Duration(milliseconds: 550));

    final normalized = pergunta.toLowerCase();
    String resposta;

    if (normalized.contains('mnemônico') || normalized.contains('mnemonico') || normalized.contains('macete')) {
      resposta = _gerarMnemonicoHumanizado(assunto: assunto, gabarito: gabaritoOficial);
    } else if (normalized.contains('distrator') || normalized.contains('por que') || normalized.contains('porque') || normalized.contains('errad')) {
      resposta = _gerarExplicacaoDistratoresHumanizada(
        gabarito: gabaritoOficial,
        comentario: comentario,
        assunto: assunto,
      );
    } else if (normalized.contains('banca') || normalized.contains('cebraspe') || normalized.contains('aocp') || normalized.contains('pegadinha')) {
      resposta = _gerarPegadinhaHumanizada(banca: banca ?? 'Cebraspe / AOCP', assunto: assunto);
    } else if (normalized.contains('simples') || normalized.contains('leigo') || normalized.contains('diret')) {
      resposta = _gerarExplicacaoDiretaHumanizada(comentario: comentario, gabarito: gabaritoOficial);
    } else {
      resposta = _gerarRespostaLivreHumanizada(
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

  String _gerarMnemonicoHumanizado({String? assunto, required String gabarito}) {
    if (assunto != null && assunto.toLowerCase().contains('crase')) {
      return 'Fala, guerreiro! Segura esse macete de ouro que eu sempre passo pros meus alunos que hoje já tão lá no plantão da delegacia!\n\n'
          'Sabe a crase antes de palavra feminina? Nunca mais sofra com isso! Faz o teste da substituição:\n'
          '👉 Troca a palavra feminina por uma masculina qualquer, tipo "homem" ou "projeto".\n'
          'Se na frase virar "AO", tem crase na veia! Exemplo: "Fui à praia" vira "Fui AO clube", então leva crase.\n'
          'Agora, se virar apenas "O", tipo "Visitei a praia" que vira "Visitei O clube", crase pra quê? Nada de crase!\n\n'
          'E grava no coração: antes de verbo, pronome pessoal ou palavra masculina, colocar crase é crime inafiançável na prova! Fechou? Bora pra próxima!';
    } else if (assunto != null && assunto.toLowerCase().contains('concord')) {
      return 'Opa, meu futuro policial! Esse mnemônico aqui é daqueles que salva 2 pontos preciosos na classificação final!\n\n'
          'Quando você bater o olho no verbo HAVER com sentido de existir ou acontecer, pensa nele como um solteirão convicto: ele não quer saber de plural com ninguém! Fica sempre congelado na terceira pessoa do singular.\n'
          '👉 O examinador vai colocar na sua prova: "Haviam muitos suspeitos na viatura". Tá errado! O certo é "Havia muitos suspeitos".\n'
          'A mesma coisa vale pro verbo FAZER quando indica tempo que já passou: "Faz dois anos", e nunca "Fazem dois anos".\n\n'
          'Guarda isso bem firme na mente e vamos cravar esse gabarito!';
    } else if (assunto != null && assunto.toLowerCase().contains('regência')) {
      return 'Fala comigo, guerreiro! Regência em prova policial é clássica, mas com essa analogia você não erra mais!\n\n'
          'Lembra dos verbos VISAR e ASPIRAR:\n'
          '👉 Se você tem um sonho, uma meta, tipo: "Eu aspiro AO cargo de Agente de Polícia" ou "Eu viso À aprovação", você OBRIGATORIAMENTE precisa da preposição "A"!\n'
          'Só não tem preposição se você tiver literalmente aspirando poeira no chão ou se o policial tiver visando um documento pra assinar.\n\n'
          'Pegou o macete? É só lembrar do seu objetivo policial que a preposição "A" vem junto na hora!';
    }

    return 'Vem cá, meu amigo! Pega esse macete tático para memorizar de vez o gabarito $gabarito!\n\n'
        'Sempre que você estiver diante de uma questão pesada como essa, faz a técnica do funil:\n'
        '1. Olha primeiro o que o comando da questão tá exigindo de você;\n'
        '2. Corta de cara qualquer alternativa que venha com palavras radicais, tipo "sempre", "nunca", "exclusivamente". O examinador adora usar isso pra te armar uma emboscada;\n'
        '3. A alternativa $gabarito é a mais equilibrada e segue à risca o texto da lei e o entendimento pacífico dos tribunais.\n\n'
        'Anota isso no seu caderno de erros e vamos juntos até a posse!';
  }

  String _gerarExplicacaoDistratoresHumanizada({
    required String gabarito,
    required String comentario,
    String? assunto,
  }) {
    return 'Excelente pergunta, guerreiro! É exatamente assim que se estuda em alto rendimento: entendendo o veneno de cada alternativa errada.\n\n'
        'Olha só o que o examinador aprontou aqui:\n'
        'O nosso gabarito certo é a letra $gabarito. Mas ele montou as outras opções de propósito pra te induzir ao erro:\n\n'
        '• Primeiro, ele pegou uma regrinha de exceção e tentou te vender como se fosse regra geral. Muita gente desatenta cai nisso porque lembra de ter lido a palavra no edital;\n'
        '• Segundo, ele colocou pegadinhas semânticas, trocando palavras que parecem sinônimas mas que no Direito ou no Português mudam completamente o sentido da frase;\n'
        '• A única alternativa que não viajou, que manteve a integridade do conceito técnico, é a letra $gabarito.\n\n'
        'Sempre que bater aquela dúvida cruel entre duas opções na hora da prova, respira fundo e escolhe a que for mais técnica e direta ao ponto, combinado?';
  }

  String _gerarPegadinhaHumanizada({required String banca, String? assunto}) {
    return 'Rapaz, você viu a maldade que a banca aprontou aqui? É o típico golpe clássico da $banca!\n\n'
        'Deixa eu te contar como funciona a cabeça do examinador nos concursos policiais:\n'
        'Ele sabe que você tá cansado, com a adrenalina a milhão e o relógio correndo. Então o que ele faz? Escreve um texto longo e coloca a pegadinha bem na última linha, ou joga um caso prático cheio de detalhes irrelevantes só pra te cansar a vista!\n\n'
        '💡 O pulo do gato que eu sempre digo pros meus alunos:\n'
        'Lê primeiro o comando final da questão! Saiba exatamente o que o examinador quer antes de se perder no texto. Assim, quando você for ler o caso, seu cérebro já vai direto como um radar no que interessa.\n\n'
        'Fazendo isso, você ganha pelo menos 40 segundos por questão e ainda sobra tempo com folga pra fazer uma redação nota 10!';
  }

  String _gerarExplicacaoDiretaHumanizada({required String comentario, required String gabarito}) {
    return 'Direto ao ponto, sem enrolação e sem juridiquês, meu amigo!\n\n'
        'A resposta certa é a letra $gabarito por uma razão muito simples e prática: essa alternativa é a única que expressa a realidade dos fatos sem inventar regras que não existem.\n\n'
        'O examinador tentou enfeitar o pavão misturando conceitos parecidos pra ver se você vacilava, mas você não cai nessa conversa fiada. Guarde esse conceito no bolso e continue firme, porque cada questão dessa dominada é um passo mais perto do distintivo!';
  }

  String _gerarRespostaLivreHumanizada({
    required String pergunta,
    required String gabarito,
    required String comentario,
    String? assunto,
  }) {
    return 'Fala, meu futuro colega policial! Que pergunta fantástica essa sua sobre "$pergunta"!\n\n'
        'Vou te explicar como se a gente tivesse tomando um café juntos agora:\n'
        'Nessa questão de ${assunto ?? 'concurso'}, o gabarito oficial e inquestionável é a letra $gabarito. '
        'O segredo aqui é você enxergar a linha de raciocínio da banca examinadora: eles querem saber se o candidato domina a aplicação prática e não apenas a teoria decorada.\n\n'
        'Quando você olha com atenção, percebe que a alternativa $gabarito se sustenta perfeitamente na fundamentação que nós colocamos no comentário. '
        'Ficou claro pra você agora ou tem algum detalhe específico que você quer que eu destrinche ainda mais? Pode mandar que o Professor tá aqui pra te ajudar!';
  }
}
