import 'enums.dart';
import 'pessoa.dart';
import 'produto.dart';

class Revendedor extends Pessoa {
  final String matricula;
  final double porcentagemLucro;

  Revendedor({
    required super.nome,
    required super.cpf,
    required super.dataDeNascimento,
    required super.genero,
    required this.matricula,
  }) : porcentagemLucro = 0.2;

  List<Produto> produtosVendidos = <Produto>[];

  //método falar
  @override
  void falar(String fala) {
    switch (genero) {
      case Genero.Feminino:
        print("Revendedora $nome diz: $fala ");
        break;
      case Genero.Masculino:
        print("Revendedor $nome diz: $fala");
        break;
      default:
        print("Pessoa revendedora $nome diz: $fala");
    }
  }

  //método venderProduto
  void venderProduto(Produto produto) {
    produto.realizarVenda();
    produtosVendidos.add(produto);
  }

  //Método calcular total vendido
  double calcularTotalVendido() {
    List<Produto> produtos = this.produtosVendidos;
    if (produtos.isEmpty) {
      return 0.0;
    } else {
      late double valorTotalProduto;
      produtos.forEach((produto) {
        valorTotalProduto += produto.valor;
      });
      return valorTotalProduto;
    }
  }
}
