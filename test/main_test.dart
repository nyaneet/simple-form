import 'package:flutter_test/flutter_test.dart';

import 'package:simple_form/app.dart';

void main() {
  testWidgets('Render initial page test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that home page loads successfully.
    expect(find.text('Simple form'), findsOneWidget);
  });
}
