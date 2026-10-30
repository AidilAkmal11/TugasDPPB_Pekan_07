import 'package:flutter_test/flutter_test.dart';

import 'package:tugas_pekan_07/main.dart';

void main() {
  testWidgets('Halaman profile tampil', (WidgetTester tester) async {
    await tester.pumpWidget(const ProfileApp());

    expect(find.text('Profil Saya'), findsOneWidget);
    expect(find.text('Edit Profil'), findsOneWidget);
  });
}
