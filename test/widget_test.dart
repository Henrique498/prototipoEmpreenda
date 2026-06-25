import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:prototipo/main.dart';
import 'package:prototipo/theme/theme_provider.dart';

void main() {
  testWidgets('GuardianNet carrega a tela de login', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const GuardianNetApp(),
      ),
    );


    expect(find.text('Bem-vinda de volta 👋'), findsOneWidget);
  });
}