import 'package:flutter_test/flutter_test.dart';
import 'package:your_app_name/main.dart';

void main() {
  testWidgets('Override method test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the override method is called
    expect(find.byType(MyHomePage), findsOneWidget);
  });

  test('Override method unit test', () {
    final widget = MyHomePage();
    expect(widget.createState(), isNotNull);
  });
}
