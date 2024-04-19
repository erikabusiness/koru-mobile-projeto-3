void pularLinha() {
  print('\n');
}

String fixarDuasCasasDecimais(double valor) {
  return valor.toStringAsFixed(2);
}

String formatarData(DateTime data) {
  String dia = data.day.toString().padLeft(2, '0');
  String mes = data.month.toString().padLeft(2, '0');
  String ano = data.year.toString();
  return '$dia/$mes/$ano';
}
