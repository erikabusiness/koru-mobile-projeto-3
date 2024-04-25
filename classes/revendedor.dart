import 'enums.dart';
import 'pessoa.dart';
import 'produto.dart';
import '../utils.dart';

class Revendedor extends Pessoa {
  final String matricula;
  final double porcentagemLucro = 0.2;
  List<Produto> produtosVendidos = <Produto>[];

  Revendedor({
    required super.nome,
    required super.cpf,
    required super.dataDeNascimento,
    required super.genero,
    required this.matricula,
  }); 

  @override
  void falar(String fala) {
    switch (genero) {
      case Genero.Feminino:
        print("Revendedora ${this.nome} diz: $fala ");
        break;
      case Genero.Masculino:
        print("Revendedor ${this.nome} diz: $fala");
        break;
      default:
        print("Pessoa revendedora ${this.nome} diz: $fala");
    }
  }

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

  double _calcularTotalVendido() {
    List<Produto> produtos = this.produtosVendidos;
    if (produtos.isEmpty) {
      return 0.0;
    } else {
      double valorTotalProduto = 0;
      produtos.forEach((produto) {
        valorTotalProduto += produto.valor;
      });
      return valorTotalProduto;
    }
  }

  double _calcularMediaProdutosVendidos() {
    if (this.produtosVendidos.isEmpty) {
      return 0;
    }

    double totalValorProdutos = 0;
    for (Produto produto in produtosVendidos) {
      totalValorProdutos += produto.valor * produto.qtdVendida;
    }

    double media = totalValorProdutos / this.produtosVendidos.length;
    return media;

  }

  double _calcularLucro() {
    double totalVendas = this._calcularTotalVendido();
    double lucro = totalVendas * porcentagemLucro;
    return lucro;
  }

  void verResumo(){
    print('O total vendido por ${this.nome} foi ${fixarDuasCasasDecimais(this._calcularTotalVendido())}.');
    print('A média aritmética de valor dos produtos vendidos é ${fixarDuasCasasDecimais(this._calcularMediaProdutosVendidos())}.');
    print('O lucro recebido foi de ${fixarDuasCasasDecimais(this._calcularLucro())}.');
  }
  
}
