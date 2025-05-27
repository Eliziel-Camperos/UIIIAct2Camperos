import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart'; // Asegúrate de que el nombre coincida con tu proyecto

void main() {
  testWidgets('ComicApp shows app bar title', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verifica que aparezca el título en la AppBar
    expect(find.text('Chools Your Comic'), findsOneWidget);
  });

  testWidgets('ComicApp displays at least one comic', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Esperamos que al menos uno de los títulos de cómic esté visible
    expect(find.text('Comic One'), findsOneWidget);
  });
}
