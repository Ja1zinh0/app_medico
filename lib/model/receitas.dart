class Receitas {
  final String nomeReceita;
  final String uid;
  final String descricao;
  final String data;

  Receitas(this.uid, this.nomeReceita, this.descricao, this.data);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'nomeReceita': nomeReceita,
      'descricao': descricao,
      'data': data,
    };
  }

  factory Receitas.fromJson(Map<String, dynamic> json) {
    return Receitas(
      json['uid'],
      json['nomeReceita'],
      json['descricao'],
      json['data']
    );
  }
}
