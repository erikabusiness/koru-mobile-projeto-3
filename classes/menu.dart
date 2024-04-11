import 'dart:io';

import 'cliente.dart';
import 'enums.dart';
import 'produto.dart';
import 'revendedor.dart';

main() {

  List<Produto> catalogo = [
    Produto(
        nome: "Colônia Floratta Flores Secretas 75ml",
        valor: 104.90,
        qtdEmEstoque: 3
    ),
    Produto(nome: "Colônia Floratta Red 75ml", valor: 75.90, qtdEmEstoque: 10),
  ];

  List <Revendedor> revendedores = [
    Revendedor(
      nome: 'Ariel',
      cpf: '12345678910',
      dataDeNascimento: DateTime(1980, 6, 10),
      genero: Genero.Outro,
      matricula: '',
    ),
    Revendedor(
        nome: 'jhonny',
        cpf: '123456',
        dataDeNascimento: DateTime.parse('1991-12-21'),
        matricula: '123456789',
        genero: Genero.Masculino),
  ];

  menuPrincipal(revendedores, catalogo);
}

Cliente menuCriacaoNovoCliente() {
  String? nomeNovoCliente = "";
  String? cpfNovoCliente = "";
  DateTime dataNascimentoNovoCliente = DateTime.now();
  Genero generoNovoCliente = Genero.Outro;

  bool nomeConfirmado = false;
  bool cpfConfirmado = false;
  bool dataNascimentoConfirmada = false;
  bool generoConfirmado = false;

  while (!nomeConfirmado) {
    stdout.write("Olá, por favor digite seu nome: ");
    String? entradaNome = stdin.readLineSync();

    stdout.write(
        "O nome $entradaNome está correto ? \nDigite:\n[1] - Sim\n[2] - Não\n");
    String? resposta = stdin.readLineSync();
    switch (resposta) {
      case "1":
        nomeNovoCliente = entradaNome;
        nomeConfirmado = true;
    }
  }

  while (!cpfConfirmado) {
    stdout.write("$nomeNovoCliente, digite seu CPF: ");
    String? entradaCpf = stdin.readLineSync();

    stdout.write(
        "O CPF $entradaCpf está correto ? \nDigite: \n[1] - Sim \n[2] - Não \n");
    String? resposta = stdin.readLineSync();
    switch (resposta) {
      case "1":
        cpfNovoCliente = entradaCpf;
        cpfConfirmado = true;
    }
  }

  while (!dataNascimentoConfirmada) {
    stdout.write("$nomeNovoCliente, digite seu dia de nascimento: ");
    String? diaNascimento = stdin.readLineSync();
    stdout.write("$nomeNovoCliente, agora digite seu mês de nascimento: ");
    String? mesNascimento = stdin.readLineSync();
    stdout.write("$nomeNovoCliente, por ultimo digite seu ano de nascimento: ");
    String? anoNascimento = stdin.readLineSync();

    stdout.write(
        "Sua data de nascimento $diaNascimento/$mesNascimento/$anoNascimento está correto ? \nDigite: \n[1] - Sim \n[2] - Não \n");
    String? resposta = stdin.readLineSync();
    switch (resposta) {
      case "1":
        dataNascimentoNovoCliente =
            DateTime.parse("$anoNascimento-$mesNascimento-$diaNascimento");
        dataNascimentoConfirmada = true;
    }
  }

  while (!generoConfirmado) {
    stdout.write(
        "$nomeNovoCliente, Com qual genero você se identifica: \nDigite: \n[1] - Masculino \n[2] - Feminino \n[3] - Outro \n");
    String? entradaGenero = stdin.readLineSync();

    switch (entradaGenero) {
      case "1":
        generoNovoCliente = Genero.Masculino;
        break;
      case "2":
        generoNovoCliente = Genero.Feminino;
        break;
      case "3":
        generoNovoCliente = Genero.Outro;
        break;
      default:
        continue;
    }

    stdout.write(
        "Seu genero ${generoNovoCliente.name} está correto ? \nDigite: \n[1] - Sim \n[2] - Não \n");
    String? resposta = stdin.readLineSync();
    switch (resposta) {
      case "1":
        generoConfirmado = true;
    }
  }
  Cliente novoCliente = Cliente(
      nome: nomeNovoCliente!,
      cpf: cpfNovoCliente!,
      dataDeNascimento: dataNascimentoNovoCliente,
      genero: generoNovoCliente
  );

  return novoCliente;
}

void menuPrincipal(List<Revendedor> revendedores, List<Produto> produtos) {
  Cliente cliente = menuCriacaoNovoCliente();
  late Revendedor revendedorSelecionado;

  bool revendedorConfirmado = false;

  stdout.write(
      "Seja bem-vindo(a) ${cliente.nome}, escolha um(a) de nossos(as) revendedores(as) para lhe atender: \n");

  revendedores.asMap().forEach((index, revendedor) {
    stdout.write("[${index + 1}] - ${revendedor.nome}\n");
  });

  stdout.write("Selecione o revendedor para lhe atender");
  String? entrada = stdin.readLineSync();

  while(!revendedorConfirmado) {



  }


}
