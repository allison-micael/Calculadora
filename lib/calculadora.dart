import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final String _limpar = 'Limpar';
  String expressao = '';
  String resultado = '';

  void _pressionarBotao(String valor) {
    setState(() {
      if (valor == _limpar) {
        expressao = '';
        resultado = '';
      } else if (valor == '=') {
        _calcularResultado();
        expressao = '';
      } else {
        expressao += valor;
      }
    });
  }

  void _calcularResultado() {
    setState(() {
      resultado = _avaliarExpressao(expressao).toString();
    });
  }

  double _avaliarExpressao(String expressao) {
    expressao = expressao.replaceAll('x', '*');
    expressao = expressao.replaceAll('÷', '/');
    // Avaliar a expressao com a biblioteca expressions
    ExpressionEvaluator avaliador = const ExpressionEvaluator();
    double resultado = avaliador.eval(Expression.parse(expressao), {});
    return resultado;
  }

  Widget botao(String valor) {
    return TextButton(
      child: Text(
        valor,
        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      onPressed: () => _pressionarBotao(valor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Text(
            expressao,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        Expanded(
          child: Text(
            resultado,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        Expanded(
          flex: 3,
          child: GridView.count(
            crossAxisCount: 4,
            childAspectRatio: 2,
            children: [
              botao('7'),
              botao('8'),
              botao('9'),
              botao('÷'),
              botao('4'),
              botao('5'),
              botao('6'),
              botao('x'),
              botao('1'),
              botao('2'),
              botao('3'),
              botao('-'),
              botao('0'),
              botao('.'),
              botao('='),
              botao('+'),
            ],
          ),
        ),
        Expanded(
          child: botao(_limpar),
        )
      ],
    );
  }
}
