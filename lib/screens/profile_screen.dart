import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prototipo/theme/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return SwitchListTile(
      title: const Text('Tema escuro'),
      subtitle: const Text('Ativar/desativar modo escuro'),
      value: themeProvider.isDark,
      onChanged: (val) => context.read<ThemeProvider>().toggleTheme(val),
    );
  }
}