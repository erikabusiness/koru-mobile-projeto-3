class Brinde {
  int qtdEmEstoque;

  Brinde({required this.qtdEmEstoque});

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
