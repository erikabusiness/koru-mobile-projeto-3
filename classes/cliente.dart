import 'pessoa.dart';
import 'produto.dart';
import 'revendedor.dart';
import '../utils.dart';

class Cliente extends Pessoa {
  double dinheiro;

  List<Produto> produtosComprados = [];

  Cliente({
    required super.nome,
    required super.cpf,
    required super.dataDeNascimento,
    required super.genero,
    this.dinheiro = 0.0,
  });

  //método falar
  @override
  void falar(String fala) {
    print("Cliente $nome diz: $fala");
  }

  //metodo comprarProduto (retorno: void)
  void comprarProduto(Produto produto, Revendedor revendedor) {
    if (dinheiro >= produto.valor) {
      try {
        revendedor.venderProduto(produto);
        dinheiro -= produto.valor;
        produtosComprados.add(produto);
      } catch (e) {
        print(e.toString());
      }
    } else {
      print(
          '$nome não possui dinheiro suficiente para comprar o produto ${produto.nome}');
    }
  }

  void adicionarDinheiro(double? valor) {
    if (valor != null) {
      dinheiro += valor;
      print(
          "$nome adicionou $valor à sua carteira. Agora você tem $dinheiro em dinheiro.");
    } else {
      print("Nenhum valor adicionado à carteira");
    }
  }

  double calcularTotalGasto() {
    double totalGasto = 0.0;
    if (produtosComprados.isEmpty) {
      print("Cliente $nome não possui produtos comprados");
    } else {
      produtosComprados.forEach((produto) {
        totalGasto += produto.valor;
      });
    }
    return totalGasto;
  }

  void calcularMediaValorProdutosComprados() {
    if (produtosComprados.isEmpty) {
      print("Cliente $nome não possui produtos comprados");
    } else {
      List<Produto> produtosComprados = this.produtosComprados;
      int numeroDeProdutos = produtosComprados.length;
      double valorMedio;

      valorMedio = calcularTotalGasto() / numeroDeProdutos;

      print(
          "O valor médio gasto em produtos pelo cliente $nome, é de R\$ $valorMedio");
    }
  }

  void ordenarProdutosComprados() {
    produtosComprados.sort((a, b) => a.nome.compareTo(b.nome));
  }
}

void verResumo(double valorTotalGasto, double valorMedioGasto) {
  print(
      "O total gasto por ${nome} foi ${fixarDuasCasasDecimais(calcularTotalGasto())} reais e a média de valor dos produtos comprados é ${fixarDuasCasasDecimais(calcularMediaProdutosComprados())} reais.");
}

void verBrindes() {
  ordenarBrindes();
  print('Brindes recebidos por $nome:');
  brindes.forEach((brinde) {
    print('$brinde');
  });
}
