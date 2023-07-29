import 'package:flutter_test/flutter_test.dart';
import 'package:todo_bloc/app/app.dart';
import 'package:todo_bloc/modules/landing_loading/view/landing_loading_view.dart';

void main() {
  group('App', () {
    testWidgets('renders LandingLoadingView', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(LandingLoadingView), findsOneWidget);
    });
  });
}
