import 'dart:convert';

class Vacin {
  final String id;
  final String name;
  final String icone;
  String? nome;
  String? valor;

  Vacin({
    required this.id,
    required this.name,
    required this.icone,
    this.nome,
    this.valor,
  });

  Vacin copyWith({
    String? id,
    String? name,
    String? icone,
    String? nome,
    String? valor,
  }) {
    return Vacin(
      id: id ?? this.id,
      name: name ?? this.name,
      icone: icone ?? this.icone,
      nome: nome ?? this.nome,
      valor: valor ?? this.valor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icone': icone,
      'nome': nome,
      'valor': valor,
    };
  }

  factory Vacin.fromMap(Map<String, dynamic> map) {
    return Vacin(
      id: map['id'],
      name: map['name'] ?? '',
      icone: map['icone'] ?? '',
      nome: map['nome'] ?? '',
      valor: map['valor'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Vacin.fromJson(String source) => Vacin.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Vacin(id: $id, name: $name, icone: $icone, nome: $nome, valor: $valor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Vacin &&
        other.id == id &&
        other.name == name &&
        other.icone == icone &&
        other.nome == nome &&
        other.valor == valor;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        icone.hashCode ^
        nome.hashCode ^
        valor.hashCode;
  }
}
