// Importações dos arquivos que serão utilizados
import 'classes/enums.dart';
import 'classes/pessoa.dart';
import 'classes/produto.dart';
import 'classes/revendedor.dart';
import 'classes/cliente.dart';
import 'utils.dart';

/**
 * RECOMENDAÇÕES DA TUTORA
 * 
 * Arquivo de testes e execução do sistema criado.
 * Os testes para o sistema se darão todos através de prints no console.
 * 
 * Abaixo você encontrará o método main, que é o método principal que será executado.
 * 
 * Para executar esse arquivo, digite o seguinte comando no terminal: dart run main.dart
 * Outra alternativa é instalar a extensão Dart no seu VS Code.
 * Isso fará aparecer um botão tipo "play" no canto direito superior. Basta clicar para executar o projeto.
 * 
 * Dentro do método main, vocês encontrarão indicações para criar objetos das classes criadas e executar os métodos criados.
 * Recomenda-se que essas declarações e execuções sejam feitas a medida que vocês forem criando as classes e métodos pedidos,
 * pois isso servirá para testar se o que você fez está funcionando.
 * 
 * Não se prendam apenas aos comentários e recomendações. Façam todos os testes que quiserem fazer.
 * 
 * Existe um método "pularLinha" que foi criado dentro do arquivo utils.
 * Caso queiram, utilizem-no para pular linha entre um bloco de testes e outro,
 * apenas por questões de organização e melhor visualização das saídas.
 * Para executá-lo, basta chamá-lo em qualquer ponto do método main, dessa maneira:
 * pularLinha();
 */

main() {
  /* Declaração de objetos Produto */

  // Declare aqui alguns objetos do tipo Produto...
  // Exemplo: Produto produtoA = Produto("Colônia Floratta Flores Secretas 75ml", 104.90, 3);

  Produto produtoA = Produto(
      nome: "Colônia Floratta Flores Secretas 75ml",
      valor: 104.90,
      qtdEmEstoque: 3);

  Produto produtoB =
      Produto(nome: "Colônia Floratta Red 75ml", valor: 75.90, qtdEmEstoque: 0);

  /* Testes da classe Produto */

  // Teste o método realizarVenda algumas vezes...
  // Exemplo: produtoA.realizarVenda();
  // Saída esperada 1: Compra de um produto Colônia Floratta Flores Secretas 75ml realizada com sucesso!
  // Saída esperada 2: No momento não possuímos o produto Colônia Floratta Flores Secretas 75ml em estoque.

  try {
    produtoA.realizarVenda(quantidade: 3);
  } catch (e) {
    print(e.toString());
  }

  try {
    produtoB.realizarVenda(quantidade: 0);
  } catch (e) {
    print(e.toString());
  }

  // Teste o método verReceitaGerada algumas vezes...
  // Exemplo: print(produtoA.verReceitaGerada());
  // Exemplo: print(produtoA.verReceitaGerada());
  print(fixarDuasCasasDecimais(produtoA.verReceitaGerada()));
  print(fixarDuasCasasDecimais(produtoB.verReceitaGerada()));
  pularLinha();

  /* ------------------------------------------ */

  /* Declaração de objetos Pessoa */
  // Declare aqui alguns objetos do tipo Pessoa...
  // Exemplo: Pessoa pessoaA = Pessoa('Maria', '12345678900', 1994);
  // Exemplo: Pessoa pessoaA = Pessoa('Maria', '12345678900', 1994);
  // Exemplo: Pessoa pessoaA = Pessoa('Maria', '12345678900', 1994);

  Pessoa pessoaA = Pessoa(
      nome: 'Maria',
      cpf: '012345678900',
      dataDeNascimento: DateTime.parse('1989-10-03'),
      genero: Genero.Feminino);

  print('Nome: ${pessoaA.nome}');
  print('CPF: ${pessoaA.cpf}');
  print('Genero: ${Genero.Feminino.name}');

  /* Testes da classe Pessoa */

  // Teste o método falar algumas vezes...
  // Exemplo: pessoaA.falar('Oi, tudo bem?');
  // Saída esperada: Maria diz: Oi, tudo bem?
  pessoaA.falar('Oi, tudo bem?');

  Pessoa pessoaC = Pessoa(
      nome: "Maria",
      cpf: '17435284538',
      dataDeNascimento: DateTime.parse('1994-01-06'), //30 anos
      genero: Genero.Feminino);

  Pessoa pessoaB = Pessoa(
      nome: "João",
      cpf: '63528394802',
      dataDeNascimento: DateTime.parse('1994-11-12'), //29 anos
      genero: Genero.Masculino);

  pularLinha();

  // Teste o método maioridade algumas vezes...
  // Exemplo: pessoaA.maioridade();
  // Saída esperada 1: Maria tem 30 anos, portanto é maior de idade.
  // Saída esperada 2: João tem 14 anos, portanto é menor de idade.

  pessoaC.verificarMaioridade();
  pessoaB.verificarMaioridade();

  // pularLinha();
  /* Testes da classe Revendedor */
  Revendedor revendedorA = Revendedor(
      nome: 'jhonny',
      cpf: '123456',
      dataDeNascimento: DateTime.parse('1991-12-21'),
      matricula: '123456789',
      genero: Genero.Masculino);

  print('Matrícula do revendedor: ${revendedorA.matricula}');
  print(
      'Porcentagem de lucro: ${(revendedorA.porcentagemLucro * 100).toStringAsFixed(0)}%');

  Revendedor revendedorB = Revendedor(
    nome: 'Ariel',
    cpf: '12345678910',
    dataDeNascimento: DateTime(1980, 6, 10),
    genero: Genero.Outro,
    matricula: '',
  );

  Revendedor revendedorC = Revendedor(
    nome: 'Maria',
    cpf: '12345678920',
    dataDeNascimento: DateTime(1980, 4, 20),
    genero: Genero.Feminino,
    matricula: '',
  );

  revendedorA.falar("Temos promoções!");
  revendedorB.falar("Temos promoções!");
  revendedorC.falar("Temos promoções!");
  pularLinha();

  //teste método cliente falar
  Cliente clienteA = Cliente(
    nome: 'João',
    cpf: '12345678900',
    dataDeNascimento: DateTime(1980, 5, 15),
    genero: Genero.Masculino,
  );

  clienteA.falar("Quero comprar um produto.");
  /* ------------------------------------------ */

  /* ------------------------------------------ */
  /* Testes da classe Cliente */

  Cliente clienteComDinheiro = Cliente(
      nome: 'Fran',
      cpf: '01234567890',
      dataDeNascimento: DateTime.parse('1999-10-01'),
      dinheiro: 10,
      genero: Genero.Feminino);

  clienteComDinheiro.adicionarDinheiro(22.0);
  clienteComDinheiro.adicionarDinheiro(null);

  Cliente clienteSemDinheiro = Cliente(
      nome: 'Kamila',
      cpf: '1234578900',
      dataDeNascimento: DateTime.parse('1997-11-15'),
      genero: Genero.Feminino);

  clienteSemDinheiro.adicionarDinheiro(10.0);

  //Teste do método comprarProduto
  //cliente com dinheiro
  Cliente clienteX = Cliente(
      nome: 'Ana',
      cpf: '20202929',
      dataDeNascimento: DateTime.parse('1996-18-06'),
      dinheiro: 330.70,
      genero: Genero.Feminino);

  clienteX.comprarProduto(produtoA, revendedorA);
  clienteX.comprarProduto(produtoB, revendedorC);
  clienteX.calcularMediaValorProdutosComprados();

//cliente sem dinheiro
  Cliente clienteY = Cliente(
      nome: 'João',
      cpf: '20202929',
      dataDeNascimento: DateTime.parse('2005-10-03'),
      dinheiro: 2.50,
      genero: Genero.Masculino);

  clienteY.comprarProduto(produtoB, revendedorA);
}
