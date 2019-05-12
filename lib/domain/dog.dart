
class Dog {
  final String nome;
  final String foto;

  Dog(this.nome, this.foto);


  Dog.fromJson(Map<String,dynamic> json) :
      nome = json["nome"],
      foto = json["foto"];

  @override
  String toString() {
    return nome;
  }
}