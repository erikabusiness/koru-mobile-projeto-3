class Brinde {
  final String nome;
  final int pontosNecessarios;
  int qtdEmEstoque;
  
  Brinde({
    required this.pontosNecessarios,
    required this.nome,
    required this.qtdEmEstoque
  });

  void consultarPontosNecessarios() {
    print('Para ganhar um(a) ${this.nome} você precisa de ${this.pontosNecessarios} pontos.');
  }

  void realizarTroca() {
    if (qtdEmEstoque > 0) {
      qtdEmEstoque--;
      print('Troca realizada! Você ganhou um(a) ${this.nome}.');
    } else {
      throw Exception('No momento não possuímos o produto ${this.nome} em estoque.');
    }
  }
}
