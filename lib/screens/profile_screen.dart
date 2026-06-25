import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool pushAlerts = true;
  bool weeklyEmail = true;
  bool smsCritical = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = context.watch<ThemeProvider>();

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
      children: [
        const Text("Meu Perfil", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: theme.primaryColor.withOpacity(0.08), borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              CircleAvatar(radius: 26, backgroundColor: theme.primaryColor.withOpacity(0.2), child: Text("MC", style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.bold))),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Maria Costa", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text("maria.costa@email.com"),
                    Text("+55 (11) 98765-4321"),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Card(
          child: ListTile(
            leading: const Icon(Icons.star, color: Colors.amber),
            title: const Text("Plano Premium Ativo"),
            subtitle: const Text("Renova em 15 jan 2026 · R\$49,90/mês"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
        const SizedBox(height: 20),
        _SectionTitle("NOTIFICAÇÕES"),
        Card(
          child: Column(
            children: [
              SwitchListTile(
                secondary: const Icon(Icons.notifications_active_outlined),
                title: const Text("Alertas no app"),
                subtitle: const Text("Notificações push em tempo real"),
                value: pushAlerts,
                onChanged: (v) => setState(() => pushAlerts = v),
              ),
              const Divider(height: 1),
              SwitchListTile(
                secondary: const Icon(Icons.public),
                title: const Text("E-mail semanal"),
                subtitle: const Text("Relatório de atividades"),
                value: weeklyEmail,
                onChanged: (v) => setState(() => weeklyEmail = v),
              ),
              const Divider(height: 1),
              SwitchListTile(
                secondary: const Icon(Icons.sms_outlined),
                title: const Text("SMS — alertas críticos"),
                subtitle: const Text("Apenas nível Perigo"),
                value: smsCritical,
                onChanged: (v) => setState(() => smsCritical = v),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _SectionTitle("APARÊNCIA"),
        Card(
          child: SwitchListTile(
            secondary: const Icon(Icons.dark_mode_outlined),
            title: const Text("Tema escuro"),
            subtitle: Text(themeProvider.isDark ? "Ativado" : "Desativado"),
            value: themeProvider.isDark,
            onChanged: (v) => themeProvider.toggleTheme(v),
          ),
        ),
        const SizedBox(height: 20),
        _SectionTitle("CONTA"),
        Card(
          child: Column(
            children: [
              ListTile(leading: const Icon(Icons.credit_card), title: const Text("Gerenciar Assinatura"), subtitle: const Text("Premium · Anual"), trailing: const Icon(Icons.chevron_right), onTap: () {}),
              const Divider(height: 1),
              ListTile(leading: const Icon(Icons.lock_outline), title: const Text("Senha e Segurança"), subtitle: const Text("Autenticação de dois fatores"), trailing: const Icon(Icons.chevron_right), onTap: () {}),
              const Divider(height: 1),
              ListTile(leading: const Icon(Icons.phone_iphone), title: const Text("Dispositivos Vinculados"), subtitle: const Text("2 dispositivos ativos"), trailing: const Icon(Icons.chevron_right), onTap: () {}),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _SectionTitle("LEGAL E CONFORMIDADE"),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.balance, color: Colors.amber),
                title: const Text("Lei 15.211/2025"),
                subtitle: const Text("Marco Legal IA — conformidade"),
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: Colors.green.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                  child: const Text("Conforme", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              ),
              const Divider(height: 1),
              ListTile(leading: const Icon(Icons.description_outlined), title: const Text("Privacidade LGPD"), subtitle: const Text("Política de dados pessoais"), trailing: const Icon(Icons.chevron_right), onTap: () {}),
              const Divider(height: 1),
              ListTile(leading: const Icon(Icons.shield_outlined), title: const Text("Política de Segurança"), subtitle: const Text("Como protegemos os dados"), trailing: const Icon(Icons.chevron_right), onTap: () {}),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _SectionTitle("SUPORTE"),
        Card(
          child: Column(
            children: [
              ListTile(leading: const Icon(Icons.help_outline), title: const Text("Central de Ajuda"), subtitle: const Text("Tutoriais e documentação"), trailing: const Icon(Icons.chevron_right), onTap: () {}),
              const Divider(height: 1),
              ListTile(leading: const Icon(Icons.info_outline), title: const Text("Sobre o GuardianNet"), trailing: const Icon(Icons.chevron_right), onTap: () {}),
            ],
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
            onPressed: () {},
            child: const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Text("Sair da Conta")),
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 0.5, color: Colors.grey)),
    );
  }
}