import 'package:flutter/material.dart';
import '../models/mock_data.dart';

class AlertCard extends StatelessWidget {
  final AlertItem alert;
  final VoidCallback? onTap;
  const AlertCard({super.key, required this.alert, this.onTap});

  IconData get _icon {
    switch (alert.app) {
      case "Instagram": return Icons.camera_alt_outlined;
      case "WhatsApp": return Icons.chat_bubble_outline;
      case "Telegram": return Icons.send_outlined;
      case "TikTok": return Icons.music_note_outlined;
      case "Discord": return Icons.sports_esports_outlined;
      default: return Icons.apps;
    }
  }

  Color _color(BuildContext context) {
    switch (alert.level) {
      case AlertLevel.perigo: return const Color(0xFFFF5C5C);
      case AlertLevel.atencao: return const Color(0xFFFFC107);
      case AlertLevel.seguro: return const Color(0xFF34C759);
    }
  }

  String get _label {
    switch (alert.level) {
      case AlertLevel.perigo: return "Perigo";
      case AlertLevel.atencao: return "Atenção";
      case AlertLevel.seguro: return "Seguro";
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _color(context);
    final isDanger = alert.level == AlertLevel.perigo;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isDanger ? BorderSide(color: color.withOpacity(0.4), width: 1) : BorderSide.none,
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.15), child: Icon(_icon, size: 18)),
        title: Row(
          children: [
            Expanded(child: Text(alert.app, style: const TextStyle(fontWeight: FontWeight.bold))),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
              child: Text(_label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(alert.description, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}