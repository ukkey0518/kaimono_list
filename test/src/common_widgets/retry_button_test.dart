import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaimono_list/src/common_widgets/retry_button.dart';

void main() {
  group('RetryButton', () {
    testWidgets('アイコンとテキストが正しく表示される', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: RetryButton(onPressed: null))),
      );
      expect(find.byIcon(Icons.refresh), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });

    testWidgets('onPressedが指定されている場合にタップでコールバックが呼ばれる', (tester) async {
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
      await tester.tap(find.byType(RetryButton));
      expect(pressed, isTrue);
    });

    testWidgets('onPressedがnullの場合は無効状態でタップしても何も起きない', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: RetryButton(onPressed: null))),
      );

      // 無効状態のボタンをタップしても何も起きない（例外が発生しない）
      await expectLater(
        () async => tester.tap(find.byType(RetryButton)),
        returnsNormally,
      );
    });
  });
}
