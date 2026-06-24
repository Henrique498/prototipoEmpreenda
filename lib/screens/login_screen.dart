import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_shell.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen ({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscure = true;
  final emailCtlr = TextEditingController(text: 'Maria.responsavel@gmail.com');
  final passCtlr = TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Container(
                width: 72, height: 72,
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(Icons.shield, color: theme.primaryColor, size: 36),
              ),
              const SizedBox(height: 16),

              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: 'Guardian', style: TextStyle(color: theme.colorScheme.onSurface)),
                    TextSpan(text: 'Net', style: TextStyle(color: theme.primaryColor)),
                  ],
                ),
              ),
              const Text('Proteção digital para sua família'),
              const SizedBox(height: 32),
              Align(alignment: Alignment.centerLeft, child: Text('Bem-vinda de volta', style: theme.textTheme.titleLarge)),
              const SizedBox(height: 4),
              const Align(alignment: Alignment.centerLeft, child: Text('Acesse sua conta para continuar')),
              const SizedBox(height: 20),
              TextField(
                controller: passCtlr,
                obscureText: obscure,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(obscure ? Icons.visibility_off: Icons.visibility),
                    onPressed: () => setState(() => obscure = !obscure),
                  ),
                ),
              ),
              Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: const Text('Esqueci minha senha'))),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)),
                  ),
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeShell()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Entrar na Conta', style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(width: 8), Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Novo por aqui? Criar conta gratuita.'),
            ],
          ),
        ),
      ),
    );
  }
}
