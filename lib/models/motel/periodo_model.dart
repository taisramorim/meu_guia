class Periodo {
  final String tempoFormatado;
  final double valor;
  final double valorTotal;
  final bool temCortesia;

  Periodo({
    required this.tempoFormatado,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
  });

  factory Periodo.fromJson(Map<String, dynamic> json) {
    return Periodo(
      tempoFormatado: json['tempoFormatado'],
      valor: (json['valor'] as num).toDouble(),
      valorTotal: (json['valorTotal'] as num).toDouble(),
      temCortesia: json['temCortesia'],
    );
  }
}
