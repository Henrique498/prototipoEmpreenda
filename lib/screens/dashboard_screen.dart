import 'package:flutter/material.dart';
import '../models/mock_data.dart';
import '../widgets/contact_card.dart';
import '../widgets/alert_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen> {
  String selectedCategory = 'Família';
  late List<TrustedContact> contacts;

  @override
  void initState() {
    super.initState();
    contacts = MockData.contacts;
  }

  void addContact(String name, String phone, String relation) {
    setState(() {
      contacts.add(TrustedContact(name: name,
          phone: phone,
          relation: relation,
          category: selectedCategory));
    });
  }

  void showAddDialog() {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final relationCtrl = TextEditingController();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (ctx) =>
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery
                  .of(ctx)
                  .viewInsets
                  .bottom, left: 20, right: 20, top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Container(width: 40,
                      height: 4,
                      decoration: BoxDecoration(color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10)))),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Novo Contato - $selectedCategory',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      IconButton(icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(ctx)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextField(controller: nameCtrl,
                      decoration: const InputDecoration(
                          labelText: "Nome completo",
                          border: OutlineInputBorder())),
                  const SizedBox(height: 12),
                  TextField(controller: phoneCtrl,
                      decoration: const InputDecoration(
                          labelText: "Telefone (WhatsApp)",
                          border: OutlineInputBorder())),
                  const SizedBox(height: 12),
                  TextField(controller: relationCtrl,
                      decoration: const InputDecoration(
                          labelText: "Relação (ex: Mãe, Amigo)",
                          border: OutlineInputBorder())),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme
                            .of(context)
                            .primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () {
                        if (nameCtrl.text.isEmpty || phoneCtrl.text.isEmpty)
                          return;
                        addContact(
                            nameCtrl.text, phoneCtrl.text, relationCtrl.text);
                        Navigator.pop(ctx);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check_circle_outline),
                              SizedBox(width: 8),
                              Text('Adicionar à Whitelist'),
                            ]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filtered = contacts
        .where((c) => c.category == selectedCategory)
        .toList();
    final dangerCount = MockData.alerts
        .where((a) => a.level == AlertLevel.perigo)
        .length;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.primaryColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              _StatItem(value: "847", label: "Análises"),
              _StatItem(value: "$dangerCount", label: "Alertas hoje"),
              _StatItem(value: "${contacts.length}", label: "Contatos"),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      foregroundColor: Colors.white),
                  child: const Row(children: [
                    Text("Gerenciar"),
                    Icon(Icons.chevron_right, size: 18)
                  ]),
              )
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('CONTATOS CONFIÁVEIS', style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 0.5)),
            TextButton.icon(onPressed: showAddDialog,
                icon: const Icon(Icons.add, size: 18),
                label: const Text("Adicionar")),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: ["Família", "Escola", "Amigos"].map((cat) {
            final selected = cat == selectedCategory;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: Text(cat),
                selected: selected,
                onSelected: (_) => setState(() => selectedCategory = cat),
                selectedColor: theme.primaryColor.withOpacity(0.15),
                labelStyle: TextStyle(color: selected ? theme.primaryColor : null, fontWeight: selected ? FontWeight.bold : null),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        if (filtered.isEmpty)
          const Padding(padding: EdgeInsets.symmetric(vertical: 20), child: Text('Nenhum contato nessa categoria ainda.'))
        else
          ...filtered.map((c) => ContactCard(contact: c, onDelete: () => setState(() => contacts.remove(c)))),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("HISTÓRICO DE ALERTAS", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 0.5)),
            TextButton(onPressed: () {}, child: const Text("Ver todos")),
          ],
        ),
        const SizedBox(height: 8),
        ...MockData.alerts.take(3).map((a) => AlertCard(alert: a)),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value, label;
  const _StatItem({required this.value, required this.label});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Text(label, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}