
class Brinde {

  final int pontosNecessarios;
  final String nome;

  Brinde({
    required this.pontosNecessarios,
    required this.nome
  });

  void consultarPontosNecessarios() {

    print('Para ganhar um(a) $nome você precisa de $pontosNecessarios pontos');
  }
}
