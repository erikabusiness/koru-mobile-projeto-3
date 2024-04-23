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
    if (this.dinheiro >= produto.valor) {
      try {
        revendedor.venderProduto(produto);
        this.dinheiro -= produto.valor;
        this.produtosComprados.add(produto);
        this.pontos++;
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
      this.dinheiro += valor;
      print(
          '$nome adicionou ${fixarDuasCasasDecimais(valor)} à sua carteira. Agora você tem ${fixarDuasCasasDecimais(this.dinheiro)} em dinheiro.');
    } else {
      print('Nenhum valor adicionado à carteira');
    }
  }

  double calcularTotalGasto() {
    double totalGasto = 0.0;
    if (this.produtosComprados.isEmpty) {
      print('Cliente $nome não possui produtos comprados');
    } else {
      this.produtosComprados.forEach((produto) {
        totalGasto += produto.valor;
      });
    }
    return totalGasto;
  }

  double calcularMediaValorProdutosComprados() {
    if (this.produtosComprados.isEmpty) {
      return 0;
    } else {
      int numeroDeProdutos = this.produtosComprados.length;
      double valorMedio;

      valorMedio = calcularTotalGasto() / numeroDeProdutos;

      return valorMedio;
    }
  }

  void ordenarProdutosComprados() {
    this.produtosComprados.sort((a, b) => a.nome.compareTo(b.nome));
  }

  void consultarTotalPontos() {
    String _singularOuPlural = this.pontos == 1 ? 'ponto' : 'pontos';
    print('Olá $nome, você possui ${this.pontos} $_singularOuPlural!');
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

  void ordenarBrindes() {
    this.brindes.sort((a, b) => a.nome.compareTo(b.nome));
  }

  void verBrindes() {
    ordenarBrindes();
    if (this.brindes.isEmpty) {
      print('$nome ainda não recebeu nenhum brinde');
    } else {
      print('Brindes recebidos por $nome:');
      this.brindes.forEach((brinde) {
        print('${brinde.nome}');
      });
    }
  }

  void trocarPontosPorBrinde(Brinde brinde) {
    if (this.pontos >= brinde.pontosNecessarios) {
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
