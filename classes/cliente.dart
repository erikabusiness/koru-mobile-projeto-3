import 'enums.dart';
import 'pessoa.dart';
import 'produto.dart';
import 'revendedor.dart';

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
      revendedor.venderProduto(produto);
      dinheiro -= produto.valor;
      produtosComprados.add(produto);
    } else {
      print(
          '$nome não possui dinheiro suficiente para comprar o produto ${produto.nome}');
    }
  }
  
    void adicionarDinheiro(double? valor) {
    if (valor != null) {
      dinheiro += valor;
      print("$nome adicionou $valor à sua carteira. Agora você tem $dinheiro em dinheiro.");
    } else {
      print("Nenhum valor adicionado à carteira");
    }
  }
}

