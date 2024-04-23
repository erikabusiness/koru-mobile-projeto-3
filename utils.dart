void pularLinha() {
  print('\n');
}

String fixarDuasCasasDecimais(double valor) {
  return 'R\$ ${valor.toStringAsFixed(2)} reais';
}

String formatarData(DateTime data) {
  String dia = data.day.toString().padLeft(2, '0');
  String mes = data.month.toString().padLeft(2, '0');
  String ano = data.year.toString();
  return '$dia/$mes/$ano';
}
