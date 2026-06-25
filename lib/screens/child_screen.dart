import 'package:flutter/material.dart';

class ChildScreen extends StatelessWidget {
  const ChildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: theme.primaryColor.withOpacity(0.08), borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              CircleAvatar(radius: 26, backgroundColor: theme.primaryColor.withOpacity(0.2), child: const Icon(Icons.family_restroom)),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Quem cuida de você?", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Maria (Mãe) e Roberto (Pai)", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                    Text("São eles que te protegem online!"),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(children: [Icon(Icons.menu_book_outlined), SizedBox(width: 8), Text("O que o GuardianNet faz?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))]),
                const SizedBox(height: 16),
                _FeatureRow(icon: Icons.chat_bubble_outline, title: "Conversas", desc: "Suas mensagens são lidas por IA para proteger você de estranhos."),
                _FeatureRow(icon: Icons.link, title: "Links e Sites", desc: "Links suspeitos são bloqueados antes de você acessar."),
                _FeatureRow(icon: Icons.photo_camera_outlined, title: "Fotos e Vídeos", desc: "Conteúdos impróprios para sua idade não chegam até você."),
                _FeatureRow(icon: Icons.person_outline, title: "Contatos", desc: "Apenas contatos confiáveis aprovados por seus responsáveis."),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: theme.primaryColor.withOpacity(0.06), borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(children: [Text("😊", style: TextStyle(fontSize: 18)), SizedBox(width: 8), Text("Seus direitos", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))]),
              const SizedBox(height: 12),
              _RightItem(number: 1, text: "Você tem o direito de saber que está sendo protegido"),
              _RightItem(number: 2, text: "Seus responsáveis se preocupam com você"),
              _RightItem(number: 3, text: "Em caso de dúvida, converse com eles"),
              _RightItem(number: 4, text: "Nenhum dado seu é compartilhado com terceiros"),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.phone), SizedBox(width: 8), Text("Falar com Mamãe ou Papai")]),
            ),
          ),
        ),
      ],
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final IconData icon; final String title, desc;
  const _FeatureRow({required this.icon, required this.title, required this.desc});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(desc, style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RightItem extends StatelessWidget {
  final int number; final String text;
  const _RightItem({required this.number, required this.text});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 11, backgroundColor: theme.primaryColor, child: Text("$number", style: const TextStyle(color: Colors.white, fontSize: 11))),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 13))),
        ],
      ),
    );
  }
}