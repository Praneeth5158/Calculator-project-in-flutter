import 'package:flutter/material.dart';

class Calculatorscreen extends StatefulWidget {
  const Calculatorscreen({super.key});

  @override
  State<Calculatorscreen> createState() => _CalculatorscreenState();
}

class _CalculatorscreenState extends State<Calculatorscreen> {
  String output = "";
  String num1 = "";
  String num2 = "";
  String operator = "";

  void buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        output = "";
        num1 = "";
        num2 = "";
        operator = "";
      } 
      else if (value == "+" || value == "-" || value == "×" || value == "÷") {
        num1 = output;
        operator = value;
        output = "";
      } 
      else if (value == "=") {
        num2 = output;

        double n1 = double.parse(num1);
        double n2 = double.parse(num2);
        double result = 0;

        if (operator == "+") result = n1 + n2;
        if (operator == "-") result = n1 - n2;
        if (operator == "×") result = n1 * n2;
        if (operator == "÷") result = n1 / n2;

        output = result.toString();
      } 
      else {
        output += value;
      }
    });
  }

  Widget buildButton(String text) {
    return Expanded(
      child: GestureDetector(
        onTap: () => buttonPressed(text),
        child: Container(
          margin: EdgeInsets.all(8),
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Display
          Container(
            height: 150,
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(20),
            child: Text(
              output,
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
          ),

          // Buttons
          Expanded(
            child: Column(
              children: [
                // TOP ROW (C on top like real calculator)
                Row(
                  children: [
                    buildButton("C"),
                    buildButton("÷"),
                    buildButton("×"),
                    buildButton("-"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("+"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("="),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("0"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
