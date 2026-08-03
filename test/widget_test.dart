import 'package:flutter_test/flutter_test.dart';

import 'package:week03_ui_lab/main.dart';

void main() {
  testWidgets('Green Market home screen shows product list', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Green Market Dev By Chayanggoon'), findsOneWidget);
    expect(find.text('ผักสลัดออร์แกนิก'), findsOneWidget);
    expect(find.text('สตรอว์เบอร์รีสด'), findsOneWidget);
    expect(find.text('เพิ่มสินค้า'), findsOneWidget);
  });
}
