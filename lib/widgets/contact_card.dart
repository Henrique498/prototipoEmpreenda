import 'package:flutter/material.dart';
import '../models/mock_data.dart';

class ContactCard extends StatelessWidget {
  final TrustedContact contact;
  final VoidCallback onDelete;
  const ContactCard({super.key, required this.contact, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme.primaryColor.withOpacity(0.1),
          child: Icon(Icons.people_alt_outlined, color: theme.primaryColor, size: 20),
        ),
        title: Row(
          children: [
            Text(contact.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 6),
            const Icon(Icons.check_circle, color: Colors.green, size: 16),
          ],
        ),
        subtitle: Text(contact.phone),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
          onPressed: onDelete,
        ),
      ),
    );
  }
}