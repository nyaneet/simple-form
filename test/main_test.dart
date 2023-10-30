import 'package:flutter_test/flutter_test.dart';

import 'package:simple_form/main.dart';

void main() {
  testWidgets('Render initial page test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that initial page loads successfully.
    expect(find.text('Simple form'), findsOneWidget);
  });
}
