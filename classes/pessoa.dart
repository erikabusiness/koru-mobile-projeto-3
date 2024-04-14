import 'enums.dart';

class Pessoa {
  final String nome;
  final String cpf;
  final DateTime dataDeNascimento;
  final Genero genero;
  late int _idade;

  //construtor
  Pessoa(
      {required this.nome,
      required this.cpf,
      required this.dataDeNascimento,
      required this.genero}) {
    _idade = _calcularIdade();
  }
  //inserir metodo calcularIdade (retorno: int)
  int _calcularIdade() {
    return DateTime.now().difference(dataDeNascimento).inDays ~/ 365.toInt();
  }

  void verificarMaioridade() {
    String verificar = (_idade >= 18
        ? ("$nome tem $_idade, portanto é maior de idade!")
        : ("$nome tem $_idade, portanto é menor de idade!"));
    print(verificar);
  }

  //método falar
  void falar(String fala) {
    print('$nome diz: $fala');
  }

  void termometroDoHumor(Humor humor) {
    switch (humor) {
      case Humor.feliz:
        print("Que bom que você está feliz hoje, $nome.");
        break;
      case Humor.alegre:
        print("Que bom que você está alegre hoje, continue assim, $nome.");
        break;
      case Humor.confiante:
        print("Isso ai, graças a sua confiança ninguém pode te parar $nome!");
        break;
      case Humor.triste:
        print("Pare um pouco e respire, $nome.");
        break;
    }
  }
}
