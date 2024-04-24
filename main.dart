import 'classes/menu.dart';
import 'classes/revendedor.dart';
import 'classes/produto.dart';
import 'classes/enums.dart';
import 'classes/brinde.dart';

void main() {
  List<Revendedor> revendedores = [
    Revendedor(
      nome: 'Maria',
      cpf: '12345678900',
      dataDeNascimento: DateTime(1990, 5, 15),
      genero: Genero.Feminino,
      matricula: '12345',
    ),
    Revendedor(
      nome: 'João',
      cpf: '98765432100',
      dataDeNascimento: DateTime(1985, 10, 25),
      genero: Genero.Masculino,
      matricula: '54321',
    ),
    Revendedor(
      nome: 'Ana',
      cpf: '45678912300',
      dataDeNascimento: DateTime(1995, 8, 20),
      genero: Genero.Feminino,
      matricula: '67890',
    ),
    Revendedor(
      nome: 'Pedro',
      cpf: '65432198700',
      dataDeNascimento: DateTime(1980, 4, 10),
      genero: Genero.Masculino,
      matricula: '09876',
    ),
  ];

  List<Produto> produtosOboticario = [
    Produto(
      nome: 'Colônia Floratta Flores Secretas 75ml',
      valor: 104.90,
      qtdEmEstoque: 3,
    ),
    Produto(
      nome: 'Colônia Floratta Red 75ml',
      valor: 75.90,
      qtdEmEstoque: 5,
    ),
    Produto(
      nome: 'Colônia Malbec Gold 100ml',
      valor: 184.90,
      qtdEmEstoque: 8,
    ),
    Produto(
      nome: 'Creme Hidratante Nativa Spa Ameixa 200ml',
      valor: 39.90,
      qtdEmEstoque: 10,
    ),
    Produto(
      nome: 'Perfume Quasar Surf 125ml',
      valor: 109.90,
      qtdEmEstoque: 6,
    ),
    Produto(
      nome: 'Loção Desodorante Corporal Cuide-se Bem Leite e Mel 400ml',
      valor: 34.90,
      qtdEmEstoque: 12,
    ),
  ];

  List<Brinde> brindesOboticario = [
    Brinde(
      nome: 'Amostra de Perfume Egeo Choc 1,2ml',
      pontosNecessarios: 50,
      qtdEmEstoque: 20,
    ),
    Brinde(
      nome: 'Miniatura de Creme Hidratante Cuide-se Bem Deleite 25g',
      pontosNecessarios: 100,
      qtdEmEstoque: 15,
    ),
    Brinde(
      nome: 'Nécessaire Vinil Preto e Branco',
      pontosNecessarios: 150,
      qtdEmEstoque: 10,
    ),
  ];

  Menu.menuPrincipal(revendedores, produtosOboticario, brindesOboticario);
}
