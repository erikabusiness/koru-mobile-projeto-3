class Brinde {
  int qtdEmEstoque;

  Brinde({required this.qtdEmEstoque});

  final int pontosNecessarios;
  final String nome;

  Brinde({
    required this.pontosNecessarios,
    required this.nome,
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

  static void ordenarBrindes(List<Brinde> brindes) {
    brindes.sort((a, b) => a.nome.compareTo(b.nome));
  }
}
