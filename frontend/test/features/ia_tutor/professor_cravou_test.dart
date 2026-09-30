import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:operacao_aprovacao_app/features/ia_tutor/presentation/widgets/professor_cravou_avatar_widget.dart';
import 'package:operacao_aprovacao_app/features/ia_tutor/presentation/widgets/professor_cravou_card_widget.dart';
import 'package:operacao_aprovacao_app/features/ia_tutor/presentation/widgets/professor_cravou_chat_modal.dart';
import 'package:operacao_aprovacao_app/features/ia_tutor/services/audio/professor_cravou_audio_service.dart';
import 'package:operacao_aprovacao_app/features/ia_tutor/services/professor_cravou_service.dart';

void main() {
  group('Professor CRAVOU AI - Testes Unitários e de Widgets', () {
    test('ProfessorCravouService gera respostas humanizadas e acolhedoras', () async {
      final service = ProfessorCravouService();

      final resMnemonico = await service.responderDuvida(
        pergunta: 'Me dê um mnemônico para crase',
        enunciado: 'Questão sobre crase',
        gabaritoOficial: 'A',
        comentario: 'Comentário didático oficial',
        assunto: 'Crase e Regência',
      );

      expect(resMnemonico.texto, contains('Fala, guerreiro!'));
      expect(resMnemonico.texto, contains('crase'));

      final resDistratores = await service.responderDuvida(
        pergunta: 'Por que os outros distratores estão errados?',
        enunciado: 'Questão sobre crase',
        gabaritoOficial: 'C',
        comentario: 'Comentário didático oficial',
        assunto: 'Tipologia Textual',
      );

      expect(resDistratores.texto, contains('Excelente pergunta, guerreiro!'));
      expect(resDistratores.texto, contains('C'));
    });

    test('ProfessorCravouAudioService inicia e para reproducao', () {
      final audio = ProfessorCravouAudioService();
      bool iniciou = false;

      audio.speak('Texto de teste', onStart: () => iniciou = true);
      expect(iniciou, isTrue);

      audio.stop();
      expect(audio.isSpeaking, isFalse);
    });

    testWidgets('ProfessorCravouAvatarWidget renderiza nosso bonequinho mascote da logo', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProfessorCravouAvatarWidget(size: 60, showOnlineDot: true),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ProfessorCravouAvatarWidget), findsOneWidget);
    });

    testWidgets('ProfessorCravouCardWidget renderiza mensagem de acerto com áudio e abre chat modal', (tester) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: ProfessorCravouCardWidget(
                enunciado: 'Acerca da tipologia textual...',
                gabaritoOficial: 'B',
                comentario: 'O trecho é narrativo...',
                acertou: true,
                assunto: 'Tipologia Textual',
                banca: 'AOCP',
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Professor CRAVOU AI'), findsOneWidget);
      expect(find.text('MENTOR COM ÁUDIO'), findsOneWidget);
      expect(find.text('TIRAR DÚVIDA / OUVIR EM ÁUDIO 🔊'), findsOneWidget);

      // Clica para abrir o modal de mentoria
      final btnChat = find.text('TIRAR DÚVIDA / OUVIR EM ÁUDIO 🔊');
      await tester.ensureVisible(btnChat);
      await tester.tap(btnChat);
      await tester.pumpAndSettle();

      // Valida abertura do Modal
      expect(find.byType(ProfessorCravouChatModal), findsOneWidget);
      expect(find.textContaining('Fala, futuro Policial!'), findsOneWidget);
      expect(find.text('💡 Criar Mnemônico Rápido'), findsOneWidget);
      expect(find.text('🔊 Ouvir Explicação do Professor'), findsOneWidget);
    });

    testWidgets('ProfessorCravouCardWidget renderiza mensagem tática de erro com chamada para áudio', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProfessorCravouCardWidget(
              enunciado: 'Acerca da concordância verbal...',
              gabaritoOficial: 'C',
              comentario: 'O verbo haver no sentido de existir...',
              acertou: false,
              assunto: 'Concordância Verbal',
              banca: 'Cebraspe',
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Professor CRAVOU AI'), findsOneWidget);
      expect(find.text('OUVIR EXPLICAÇÃO DO PROFESSOR (ÁUDIO 🔊)'), findsOneWidget);
      expect(find.textContaining('Pegadinha clássica da banca!'), findsOneWidget);
    });
  });
}
