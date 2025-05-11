import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaimono_list/src/common_widgets/retry_button.dart';

void main() {
  group('RetryButton', () {
    testWidgets('表示内容が正しい', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RetryButton(
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );
      // アイコンとテキストが表示されていること
      expect(find.byIcon(Icons.refresh), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
      // ボタンタップでonPressedが呼ばれること
      await tester.tap(find.byType(RetryButton));
      expect(pressed, isTrue);
    });

    testWidgets('onPressedがnullでもクラッシュしない', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: RetryButton(onPressed: null))),
      );
      // ボタンがdisabled状態で表示されていること
      final button = tester.widget<TextButton>(find.byType(TextButton));
      expect(button.onPressed, isNull);
    });
  });
}
