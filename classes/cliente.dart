import 'pessoa.dart';
import 'produto.dart';
import 'revendedor.dart';
import '../utils.dart';
import 'brinde.dart';

class Cliente extends Pessoa {
  double dinheiro;
  int pontos = 0;
  List<Produto> produtosComprados = [];
  List<Brinde> brindes = [];

  Cliente({
    required super.nome,
    required super.cpf,
    required super.dataDeNascimento,
    required super.genero,
    this.dinheiro = 0.0,
  });

  @override
  void falar(String fala) {
    print('Cliente $nome diz: $fala');
  } 

  void comprarProduto(Produto produto, Revendedor revendedor) {
    if (dinheiro >= produto.valor) {
      try {
        revendedor.venderProduto(produto);
        dinheiro -= produto.valor;
        produtosComprados.add(produto);
        pontos++;
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
          '$nome adicionou $valor à sua carteira. Agora você tem $dinheiro em dinheiro.');
    } else {
      print('Nenhum valor adicionado à carteira');
    }
  } 

  double calcularTotalGasto() {
    double totalGasto = 0.0;
    if (produtosComprados.isEmpty) {
      print('Cliente $nome não possui produtos comprados');
    } else {
      produtosComprados.forEach((produto) {
        totalGasto += produto.valor;
      });
    }
    return totalGasto;
  } 

  double calcularMediaValorProdutosComprados() {
    if (produtosComprados.isEmpty) {
      return 0;
    } else {
      List<Produto> produtosComprados = this.produtosComprados;
      int numeroDeProdutos = produtosComprados.length;
      double valorMedio;

      valorMedio = calcularTotalGasto() / numeroDeProdutos;

      return valorMedio;
    }
  }

  void ordenarProdutosComprados() {
    produtosComprados.sort((a, b) => a.nome.compareTo(b.nome));
  }

  void consultarTotalPontos() {
    String _singularOuPlural = pontos == 1 ? 'ponto' : 'pontos';
    print('Olá $nome, você possui $pontos $_singularOuPlural!');
  }

  void verProdutosComprados() {
    if (produtosComprados.isEmpty) {
      print('Cliente $nome não possui produtos comprados');
    } else {
    ordenarProdutosComprados();
    this.produtosComprados.forEach((produto) {
        print('${produto.nome}');
      });
    }
  }

  static void ordenarBrindes(List<Brinde> brindes) {
    brindes.sort((a, b) => a.nome.compareTo(b.nome));
  }

  void verBrindes() {
    ordenarBrindes(brindes);
    if (brindes.isEmpty) {
      print('$nome ainda não recebeu nenhum brinde');
    } else {
      print('Brindes recebidos por $nome:');
      brindes.forEach((brinde) {
        print('${brinde.nome}');
      });
    }
  }

  void trocarPontosPorBrinde(Brinde brinde) {
    if (pontos >= brinde.pontosNecessarios) {
      try {
        brinde.realizarTroca();
        this.pontos -= brinde.pontosNecessarios;
        this.brindes.add(brinde);
      } catch (e) {
        print(e.toString());
      }
    } else {
      print(
          '$nome não possui pontos suficientes para trocar pelo brinde ${brinde.nome}.');
    }
  }

  void verResumo() {
    print(
        'O total gasto por ${nome} foi ${fixarDuasCasasDecimais(this.calcularTotalGasto())} reais e a média de valor dos produtos comprados é ${fixarDuasCasasDecimais(this.calcularMediaValorProdutosComprados())} reais.');
  }
}
