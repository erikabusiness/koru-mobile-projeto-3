class Brinde {
  int qtdEmEstoque;
  final int pontosNecessarios;
  final String nome;

  Brinde({
    required this.pontosNecessarios,
    required this.nome,
    required this.qtdEmEstoque
  });

  void consultarPontosNecessarios() {
    print('Para ganhar um(a) $nome você precisa de $pontosNecessarios pontos');
  }

  void realizarTroca() {
    if (qtdEmEstoque > 0) {
      qtdEmEstoque--;
      print('Troca realizada! Você ganhou um(a) $nome.');
    } else {
      throw Exception('No momento não possuímos o produto $nome em estoque.');
    }
  }

}
