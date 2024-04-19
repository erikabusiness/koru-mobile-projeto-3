// Importações dos arquivos que serão utilizados
import 'classes/enums.dart';
import 'classes/menu.dart';
import 'classes/produto.dart';
import 'classes/revendedor.dart';

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

  List<Produto> catalogo = [
    Produto(nome: "Colônia Floratta Flores Secretas 75ml", valor: 104.90, qtdEmEstoque: 3),
    Produto(nome: "Colônia Floratta Red 75ml", valor: 75.90, qtdEmEstoque: 10),
  ];

  List<Revendedor> revendedores = [
    Revendedor(nome: 'Ariel', cpf: '12345678910', dataDeNascimento: DateTime(1980, 6, 10), genero: Genero.Outro, matricula: ''),
    Revendedor(nome: 'jhonny', cpf: '123456', dataDeNascimento: DateTime.parse('1991-12-21'), matricula: '123456789', genero: Genero.Masculino),
  ];

  Menu.menuPrincipal(revendedores, catalogo);

}
