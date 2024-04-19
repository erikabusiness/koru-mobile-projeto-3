class Produto {
  final String nome;
  double valor;
  int qtdEmEstoque = 0;
  int qtdVendida = 0;

  //construtor
  Produto(
      {required this.nome, required this.valor, required this.qtdEmEstoque});

  void realizarVenda({int quantidade = 1}) {
    if (quantidade <= 0) {
      throw Exception("Quantidade de venda deve ser positiva.");
    }

    if (qtdEmEstoque >= quantidade) {
      qtdVendida += quantidade;
      qtdEmEstoque -= quantidade;
      print("Compra de $quantidade unidade(s) de $nome realizada com sucesso!");

      print("Venda registrada: $quantidade unidade(s) de $nome vendidas.");

      if (qtdEmEstoque <= 3) {
        print(
            "Atenção: Estoque baixo para o produto $nome. Restam apenas $qtdEmEstoque unidades em estoque.");
      }
    } else {
      throw Exception(
          "No momento não possuímos quantidade suficiente do produto $nome em estoque. Estoque disponível: $qtdEmEstoque.");
    }
  }

  double verReceitaGerada() {
    return valor * qtdVendida;
  }
}
