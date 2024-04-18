import 'enums.dart';
import 'pessoa.dart';
import 'produto.dart';
import '../utils.dart';

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
  void venderProduto(Produto produto, {int quantidade = 1}) {
    try {
      // Tenta realizar a venda do produto com a quantidade especificada.
      produto.realizarVenda(quantidade: quantidade);
      // Se a venda for bem-sucedida, adiciona o produto à lista de produtos vendidos.
      produtosVendidos.add(produto);
    } catch (e) {
      // Verifica o tipo de exceção para responder de forma adequada.
      if (e is Exception) {
        String mensagemErro = e.toString();

        if (mensagemErro.contains("Quantidade de venda deve ser positiva")) {
          // Trata o caso da quantidade de venda inválida.
          throw Exception("Erro ao vender produto: $mensagemErro");
        } else if (mensagemErro.contains(
            "No momento não possuímos quantidade suficiente do produto")) {
          // Trata o caso de estoque insuficiente.
          throw Exception("Erro de estoque: $mensagemErro");
        } else {
          // Para qualquer outra exceção desconhecida, relança a exceção original.
          throw e;
        }
      }
    }
  }

  double calcularLucro() {
    double totalVendas = 85.80;
    produtosVendidos.forEach((produto) {
      totalVendas += produto.valor * produto.qtdVendida;
    });

    double lucro = totalVendas * porcentagemLucro;

    return lucro;
  }

  double calcularMediaProdutosVendidos() {
    if (produtosVendidos.isEmpty) {
      return 0;
    }

    double totalValorProdutos = 0;
    for (var produto in produtosVendidos) {
      totalValorProdutos += produto.valor * produto.qtdVendida;
    }
    double media = totalValorProdutos / produtosVendidos.length;
    return media;

    //método verResumo
    void verResumo() {
      print(
          "O total vendido por ${nome} foi ${fixarDuasCasasDecimais(calcularTotalVendido())} reais e a média aritmética de valor dos produtos vendidos é ${fixarDuasCasasDecimais(calcularMediaProdutosVendidos())} reais. O lucro recebido foi de ${fixarDuasCasasDecimais(calcularLucro())} reais.");
    }
  }
}
