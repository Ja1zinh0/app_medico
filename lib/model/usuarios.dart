class Usuarios {
  final String nome;
  final String uid;
  final String telefone;

  Usuarios(this.uid, this.nome, this.telefone);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'nome': nome,
      'telefone': telefone,
    };
  }

  factory Usuarios.fromJson(Map<String, dynamic> json) {
    return Usuarios(
      json['uid'],
      json['nome'],
      json['telefone'],
    );
  }
}
