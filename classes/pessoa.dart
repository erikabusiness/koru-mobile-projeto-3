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
}
