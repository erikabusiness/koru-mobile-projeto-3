import 'enums.dart';

class Pessoa {
  final String nome;
  final String cpf;
  final DateTime dataDeNascimento;
  final Genero genero;

  Pessoa(
      {required this.nome,
      required this.cpf,
      required this.dataDeNascimento,
      required this.genero});

  int get idade {
    return DateTime.now().difference(dataDeNascimento).inDays ~/ 365.toInt();
  }

  void verificarMaioridade() {
    String verificar = (idade >= 18
        ? ('${this.nome} tem ${this.idade} anos, portanto é maior de idade!')
        : ('${this.nome} tem ${this.idade} anos, portanto é menor de idade!'));
    print(verificar);
  }

  void falar(String fala) {
    print('${this.nome} diz: $fala');
  }

  void termometroDoHumor(Humor humor) {
    switch (humor) {
      case Humor.feliz:
        print('Que bom que você está feliz hoje, ${this.nome}.');
        break;
      case Humor.alegre:
        print(
            'Que bom que você está alegre hoje, continue assim, ${this.nome}.');
        break;
      case Humor.confiante:
        print(
            'Isso ai, graças a sua confiança ninguém pode te parar ${this.nome}!');
        break;
      case Humor.triste:
        print('Pare um pouco e respire, ${this.nome}.');
        break;
    }
  }
}
