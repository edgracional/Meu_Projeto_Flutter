class Doses {
  String id;
  String icone;
  String nome;
  String valor;

  Doses({
    required this.id,
    required this.icone,
    required this.nome,
    required this.valor,
  });

  static fromJson(Map<String, dynamic> json) {
    return Doses(
      id: json['id'],
      icone: json['icone'],
      nome: json['nome'],
      valor: json['valor'],
    );
  }
  // From map
  Doses.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        assert(map['icone'] != null),
        assert(map['nome'] != null),
        assert(map['valor'] != null),
        id = map['id'],
        icone = map['icone'],
        nome = map['nome'],
        valor = map['valor'];
}
