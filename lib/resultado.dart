import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciar;

  const Resultado(this.pontuacao, this.quandoReiniciar, {super.key});

  String get fraseResultado {
    if (pontuacao <= 12) {
      return 'parabens';
    } else if (pontuacao < 20) {
      return 'bom';
    } else if (pontuacao < 28) {
      return 'extraordinario';
    } else {
      return 'jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
          onPressed: quandoReiniciar,
          child: const Text(
            'Reiniciar',
            style: TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }
}
