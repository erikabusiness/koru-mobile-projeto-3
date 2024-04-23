import 'dart:io';

import '../utils.dart';
import 'brinde.dart';
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
    String nomeNovoCliente;
    String cpfNovoCliente;
    DateTime dataNascimentoNovoCliente;
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

  static int obterOpcaoMenuPrincipal() {
    int? entrada;
    do {
      entrada = int.tryParse(prompt(
          "[1] - Comprar Produtos\n[2] - Consultar produtos comprados\n[3] - Resumo de compras\n[4] - Adicionar Saldo\n[5] - Consultar Saldo\n[6] - Troca de Pontos\n[7] - Consultar Pontos\n[8] - Consultar brindes recebidos\n[0] - Sair\n\n"
              "Seja bem-vindo(a) ao nosso sistema de atendimento, escolha uma opção: "));
      if (entrada == null || entrada < 0 || entrada > 8) {
        stdout.write("Opção inválida. Por favor, selecione novamente.\n");
      }
    } while (entrada == null || entrada < 0 || entrada > 8);
    return entrada;
  }

  static int obterIndiceValido(List<dynamic> lista, String tipo) {
    int? entrada;
    do {
      entrada = int.tryParse(prompt("\nSelecione o número do $tipo: "));
      if (entrada == null || entrada < 0 || entrada > lista.length) {
        stdout.write("\nOpção inválida. Por favor, selecione novamente.\n");
      }
    } while (entrada == null || entrada < 0 || entrada > lista.length);
    return entrada;
  }

  static void menuVenda(List<Revendedor> revendedores, List<Produto> produtos, Cliente cliente) {
    pularLinha();
    stdout.write("Olá ${cliente.nome}, bem-vindo(a) à central de compras. Abaixo estão nossos revendedores disponíveis para lhe atender no momento: \n");

    revendedores.asMap().forEach((index, revendedor) {
      stdout.write("[${index + 1}] - ${revendedor.nome}\n");
    });

    int indiceSelecionado = obterIndiceValido(revendedores, "revendedor") - 1;

    Revendedor revendedorSelecionado = revendedores[indiceSelecionado];
    stdout.write("\nVocê selecionou ${revendedorSelecionado.nome} como seu revendedor.\nNosso catálogo de produtos disponíveis será exibido abaixo: \n");

    produtos.asMap().forEach((index, produto) {
      stdout.write("[${index + 1}] - ${produto.nome} - R\$${produto.valor}\n");
    });

    int indiceProdutoSelecionado = obterIndiceValido(produtos, "produto") - 1;

    Produto produtoSelecionado = produtos[indiceProdutoSelecionado];
    stdout.write("\nVocê selecionou o produto: ${produtoSelecionado.nome} - R\$${produtoSelecionado.valor}\n");

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
  }

  static void menuBrindes(List<Brinde> brindes, Cliente cliente) {
    pularLinha();

    brindes.asMap().forEach((index, brinde) {
      stdout.write("[${index + 1}] - ${brinde.nome} - Pontos necessários - ${brinde.pontosNecessarios}\n");
    });

    int indiceBrindeSelecionado = obterIndiceValido(brindes, "brinde") - 1;

    Brinde brindeSelecionado = brindes[indiceBrindeSelecionado];
    stdout.write("Você selecionou o produto: ${brindeSelecionado.nome} - Pontos Necessários: ${brindeSelecionado.pontosNecessarios}\n");

    bool confirmacaoBrinde = confirmar("Deseja confirmar a troca por este brinde?");
    if (confirmacaoBrinde) {
      if (brindeSelecionado.qtdEmEstoque > 0) {
        cliente.trocarPontosPorBrinde(brindeSelecionado);
      } else {
        stdout.write("Desculpe, o brinde selecionado está fora de estoque.\n");
      }
    } else {
      stdout.write("Troca cancelada.\n");
    }
  }

  static void menuPrincipal(List<Revendedor> revendedores, List<Produto> produtos, List<Brinde> brindes) {
    pularLinha();

    Cliente cliente = criarNovoCliente();
    bool sair = false;

    do {
      switch (obterOpcaoMenuPrincipal()) {
        case 1:
          menuVenda(revendedores, produtos, cliente);
          break;
        case 2:
          stdout.write("Você já comprou os seguintes produtos:\n");
          cliente.verProdutosComprados();
          break;
        case 3:
          cliente.verResumo();
          break;
        case 4:
          menuSaldo(cliente);
          break;
        case 5:
          stdout.write("O Seu saldo atual é de: ${fixarDuasCasasDecimais(cliente.dinheiro)}\n");
          break;
        case 6:
          menuBrindes(brindes, cliente);
          break;
        case 7:
          stdout.write("Você possui ${cliente.pontos} pontos para serem resgatados!\n");
          break;
        case 8:
          stdout.write("Você já recebeu os seguintes brindes:\n");
          cliente.verBrindes();
          break;
        case 0:
          sair = true;
          break;
      }
    } while (!sair);
  }
}
