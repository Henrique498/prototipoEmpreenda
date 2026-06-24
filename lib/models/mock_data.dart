enum AlertLevel { perigo, atencao, seguro}


class TrustedContact {
  String name, phone, relation, category;

  TrustedContact({required this.name, required this.phone, required this.relation, required this.category});

}

class AlertItem {
  String app, description, time;
  AlertLevel level;
  AlertItem({required this.app, required this.description, required this.time, required this.level});
}

class MockData {
  static List<TrustedContact> contacts = [
    TrustedContact(name: "Maria (Mãe)", phone: "+55 11 98765-0001", relation: "Mãe", category: "Família"),
    TrustedContact(name: "Roberto (Pai)", phone: "+55 11 98765-0002", relation: "Pai", category: "Família"),
    TrustedContact(name: "Avó Joana", phone: "+55 11 97654-0003", relation: "Avó", category: "Família"),
    TrustedContact(name: "Prof. Carlos Silva", phone: "+55 11 96543-0004", relation: "Professor", category: "Escola"),
    TrustedContact(name: "Coord. Ana Lima", phone: "+55 11 95432-0005", relation: "Coordenadora", category: "Escola"),
    TrustedContact(name: "João Pedro", phone: "+55 11 94321-0006", relation: "Amigo", category: "Amigos"),
    TrustedContact(name: "Sofia Mendes", phone: "+55 11 93210-0007", relation: "Amiga", category: "Amigos"),
  ];


  static List<AlertItem> alerts = [
    AlertItem(app: "Instagram", description: "DM de @usuario_desconhecido23 — solicitação suspeita", time: "há 5min", level: AlertLevel.perigo),
    AlertItem(app: "WhatsApp", description: "Conversa com João Pedro sobre fim de semana", time: "há 32min", level: AlertLevel.seguro),
    AlertItem(app: "Telegram", description: "Grupo 'Estudo Turma 7B' — conteúdo adequado", time: "há 2h", level: AlertLevel.seguro),
    AlertItem(app: "TikTok", description: "DM de @conteudo_adulto_br", time: "22:30 (ontem)", level: AlertLevel.perigo),
    AlertItem(app: "WhatsApp", description: "Grupo 'Turma Legal' — linguagem", time: "18:10 (ontem)", level: AlertLevel.atencao),
    AlertItem(app: "Discord", description: "Servidor 'Gaming Zone' — chat", time: "15:55 (ontem)", level: AlertLevel.seguro),
  ];
}