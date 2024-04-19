import 'dart:io';

import '../utils.dart';
import 'cliente.dart';
import 'enums.dart';
import 'produto.dart';
import 'revendedor.dart';

class Menu {
  static String prompt(String promptText) {
    stdout.write(promptText);
    return stdin.readLineSync()!;
  }

  static bool confirmar(String mensagem) {
    String resposta = prompt(mensagem + " (S/N): ");
    pularLinha();
    return resposta.toLowerCase() == 's';
  }

  static Cliente criarNovoCliente() {
    late String nomeNovoCliente;
    late String cpfNovoCliente;
    late DateTime dataNascimentoNovoCliente;
    late Genero generoNovoCliente;

    do {
      nomeNovoCliente = prompt("Olá, por favor digite seu nome: ");
    } while (!confirmar("Seu nome [$nomeNovoCliente] está correto?"));

    do {
      cpfNovoCliente = prompt("$nomeNovoCliente, Digite seu CPF: ");
    } while (!confirmar("Seu CPF [$cpfNovoCliente] está correto?"));

    do {
      int dia = int.parse(prompt("$nomeNovoCliente, digite seu dia de nascimento: "));
      int mes = int.parse(prompt("$nomeNovoCliente, agora digite seu mês de nascimento: "));
      int ano = int.parse(prompt("$nomeNovoCliente, por último digite seu ano de nascimento: "));
      dataNascimentoNovoCliente = DateTime(ano, mes, dia);
    } while (!confirmar("Sua data de nascimento [${formatarData(dataNascimentoNovoCliente)}] está correta?"));

    bool generoConfirmado = false;
    do {
      String entradaGenero = prompt("$nomeNovoCliente, com qual gênero você se identifica? (M - Masculino / F - Feminino / O - Outro): ");
      switch (entradaGenero.toLowerCase()) {
        case 'm':
          generoNovoCliente = Genero.Masculino;
          break;
        case 'f':
          generoNovoCliente = Genero.Feminino;
          break;
        case 'o':
          generoNovoCliente = Genero.Outro;
          break;
        default:
          stdout.write("Opção inválida. Por favor, selecione novamente.\n");
          continue;
      }
      if (confirmar("Seu gênero é ${generoNovoCliente.name}?")) {
        generoConfirmado = true;
      }
    } while (!generoConfirmado);

    return Cliente(
      nome: nomeNovoCliente,
      cpf: cpfNovoCliente,
      dataDeNascimento: dataNascimentoNovoCliente,
      genero: generoNovoCliente,
    );
  }

  static void menuVenda(List<Revendedor> revendedores, List<Produto> produtos, Cliente cliente) {
    pularLinha();
    stdout.write("Olá ${cliente.nome}, bem-vindo(a) à central de compras. Abaixo estão nossos revendedores disponíveis para lhe atender no momento: \n");

    revendedores.asMap().forEach((index, revendedor) {
      stdout.write("[${index + 1}] - ${revendedor.nome}\n");
    });

    int? indiceSelecionado;
    do {
      int? entrada = int.tryParse(prompt("Selecione o número do revendedor para lhe atender: "));
      if (entrada != null && entrada >= 1 && entrada <= revendedores.length) {
        indiceSelecionado = entrada - 1;
      } else {
        stdout.write("Opção inválida. Por favor, selecione novamente.\n");
      }
    } while (indiceSelecionado == null);

    Revendedor revendedorSelecionado = revendedores[indiceSelecionado];
    stdout.write("Você selecionou ${revendedorSelecionado.nome} como seu revendedor.\nNosso catálogo de produtos disponíveis será exibido abaixo: \n");

    produtos.asMap().forEach((index, produto) {
      stdout.write("[${index + 1}] - ${produto.nome} - R\$${produto.valor}\n");
    });

    int? indiceProdutoSelecionado;
    do {
      int? entrada = int.tryParse(prompt("Selecione o número do produto que deseja comprar: "));
      if (entrada != null && entrada >= 1 && entrada <= produtos.length) {
        indiceProdutoSelecionado = entrada - 1;
      } else {
        stdout.write("Opção inválida. Por favor, selecione novamente.\n");
      }
    } while (indiceProdutoSelecionado == null);

    Produto produtoSelecionado = produtos[indiceProdutoSelecionado];
    stdout.write("Você selecionou o produto: ${produtoSelecionado.nome} - R\$${produtoSelecionado.valor}\n");

    bool confirmacaoProduto = confirmar("Deseja confirmar a compra deste produto?");
    if (confirmacaoProduto) {
      cliente.comprarProduto(produtoSelecionado, revendedorSelecionado);
    } else {
      stdout.write("Compra cancelada.\n");
    }
  }

  static void menuSaldo(Cliente cliente) {
    pularLinha();

    double? recarga;
    bool confirmado = false;

    do {
      recarga = double.tryParse(prompt("Bem-vindo ao menu de recargas. Por favor, informe o valor que deseja adicionar à sua conta ou digite [0] para sair: "));

      if (recarga == null || recarga < 0) {
        stdout.write("Valor de recarga inválido. Por favor, insira um valor válido.\n");
      } else if (recarga == 0) {
        stdout.write("Saindo do menu de recargas.\n");
        return;
      } else {
        stdout.write("Você está adicionando R\$$recarga à sua conta.\n");
        confirmado = confirmar("Confirma o valor de recarga?");
      }
    } while (!confirmado);

    cliente.adicionarDinheiro(recarga);
    stdout.write("Saldo adicionado com sucesso! Novo saldo: R\$${fixarDuasCasasDecimais(cliente.dinheiro)}\n");
  }

  static void menuPrincipal(List<Revendedor> revendedores, List<Produto> produtos) {
    Cliente cliente = criarNovoCliente();
    bool sair = false;

    do {
      int? entrada = int.tryParse(prompt("[1] - Comprar Produtos\n[2] - Adicionar Saldo\n[3] - Consultar Saldo\n[4] - Troca de Pontos\n[5] - Consultar Pontos\n[0] - Sair\n\n"
          "Seja bem-vindo(a) ${cliente.nome}, ao nosso sistema de atendimento, escolha uma de nossas opções de atendimento: "));

      switch(entrada) {
        case 1:
          menuVenda(revendedores, produtos, cliente);
          break;
        case 2:
          menuSaldo(cliente);
          break;
        case 3:
        stdout.write("O Seu saldo atual é de: ${fixarDuasCasasDecimais(cliente.dinheiro)}\n");
          break;
        case 4:
        //Chamar Menu de pontos
          break;
        case 5:
        //Chamar variavel de pontos de cliente
          break;
        case 0:
          sair = true;
          break;
        default:
          stdout.write("Opção [$entrada] invalida!");
          continue;
      }
    } while (!sair);
  }
}

