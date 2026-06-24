import 'package:flutter/material.dart';

class FeedbackEntry {
  int rating; String comment; String name;
  FeedbackEntry({required this.rating, required this.comment, required this.name});
}

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});
  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int currentRating = 0;
  final nameCtrl = TextEditingController();
  final commentCtrl = TextEditingController();
  final List<FeedbackEntry> entries = [];

  double get average => entries.isEmpty ? 0 : entries.map((e) => e.rating).reduce((a, b) => a + b) / entries.length;

  void submit() {
    if (currentRating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Selecione uma nota antes de enviar")));
      return;
    }
    setState(() {
      entries.insert(0, FeedbackEntry(
        rating: currentRating,
        comment: commentCtrl.text.isEmpty ? "(sem comentário)" : commentCtrl.text,
        name: nameCtrl.text.isEmpty ? "Anônimo" : nameCtrl.text,
      ));
      currentRating = 0;
      nameCtrl.clear();
      commentCtrl.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Obrigado pelo feedback! ✅")));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text("Avalie o GuardianNet", style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        const Text("Sua opinião ajuda a melhorar o app para outras famílias."),
        const SizedBox(height: 20),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (i) => IconButton(
                    icon: Icon(i < currentRating ? Icons.star : Icons.star_border, color: Colors.amber, size: 32),
                    onPressed: () => setState(() => currentRating = i + 1),
                  )),
                ),
                const SizedBox(height: 8),
                TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "Seu nome (opcional)", border: OutlineInputBorder())),
                const SizedBox(height: 12),
                TextField(controller: commentCtrl, maxLines: 3, decoration: const InputDecoration(labelText: "Comentário / sugestão", border: OutlineInputBorder())),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: theme.primaryColor, foregroundColor: Colors.white),
                    onPressed: submit,
                    child: const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Text("Enviar avaliação")),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        if (entries.isNotEmpty) ...[
          Row(
            children: [
              Text("Nota média: ${average.toStringAsFixed(1)} ", style: const TextStyle(fontWeight: FontWeight.bold)),
              const Icon(Icons.star, color: Colors.amber, size: 18),
              const SizedBox(width: 8),
              Text("(${entries.length} avaliações)"),
            ],
          ),
          const SizedBox(height: 12),
          ...entries.map((e) => Card(
            child: ListTile(
              leading: CircleAvatar(child: Text(e.rating.toString())),
              title: Text(e.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(e.comment),
            ),
          )),
        ],
      ],
    );
  }
}