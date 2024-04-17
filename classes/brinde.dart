class Brinde {
  late String nome;
  late int pontosNecessarios;

  void consultarPontosNecessarios() {
    print('Para ganhar um(a) $nome você precisa de $pontosNecessarios pontos');
  }

  static void ordenarBrindes(List<Brinde> brindes) {
    brindes.sort((a, b) => a.nome.compareTo(b.nome));
    print("Brindes ordenados:");
    for (var brinde in brindes) {
      print("${brinde.nome} - ${brinde.pontosNecessarios} pontos");
    }
  }
}
