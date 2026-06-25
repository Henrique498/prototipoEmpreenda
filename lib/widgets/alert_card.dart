import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/mock_data.dart';

class AlertCard extends StatelessWidget {
  final AlertItem alert;
  final VoidCallback? onTap;
  const AlertCard({super.key, required this.alert, this.onTap});

  FaIconData get _icon {
    switch (alert.app) {
      case "Instagram": return FontAwesomeIcons.instagram;
      case "WhatsApp": return FontAwesomeIcons.whatsapp;
      case "Telegram": return FontAwesomeIcons.telegram;
      case "TikTok": return FontAwesomeIcons.tiktok;
      case "Discord": return FontAwesomeIcons.discord;
      default: return FontAwesomeIcons.globe;
    }
  }

  Color get _brandColor {
    switch (alert.app) {
      case "Instagram": return const Color(0xFFE1306C);
      case "WhatsApp": return const Color(0xFF25D366);
      case "Telegram": return const Color(0xFF229ED9);
      case "TikTok": return Colors.black;
      case "Discord": return const Color(0xFF5865F2);
      default: return Colors.grey;
    }
  }

  Color _statusColor() {
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
    final statusColor = _statusColor();
    final isDanger = alert.level == AlertLevel.perigo;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isDanger ? BorderSide(color: statusColor.withOpacity(0.4), width: 1) : BorderSide.none,
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: _brandColor.withOpacity(0.12),
          child: FaIcon(_icon, size: 16, color: _brandColor),
        ),
        title: Row(
          children: [
            Expanded(child: Text(alert.app, style: const TextStyle(fontWeight: FontWeight.bold))),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: statusColor.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
              child: Text(_label, style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.bold)),
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