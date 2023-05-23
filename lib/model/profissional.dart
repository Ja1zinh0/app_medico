class Profissional {
  final String nome;
  final String uid;
  final String especializacao;

  Profissional(this.uid, this.nome, this.especializacao);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'nome': nome,
      'espec': especializacao,
    };
  }

  factory Profissional.fromJson(Map<String, dynamic> json) {
    return Profissional(
      json['uid'],
      json['nome'],
      json['espec'],
    );
  }
}
