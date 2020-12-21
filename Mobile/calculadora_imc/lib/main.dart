import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String resultadoIMC = "Informe seus dados";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetaCampos() {
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      resultadoIMC = "Informe seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculaIMC() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);

      if (imc < 18.6) {
        resultadoIMC = "Abaixo do peso: (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        resultadoIMC = "Pesoa ideal: (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        resultadoIMC =
        "Levemente acima do peso: (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        resultadoIMC = "Obesidade Grau I: (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 39.9 && imc < 40.0) {
        resultadoIMC = "Obesidade Grau II: (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 40.0) {
        resultadoIMC = "Obesidade Grau III: (${imc.toStringAsPrecision(4)})";
      } else {
        resultadoIMC = "Valores Incorretos";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetaCampos,
          )
        ],
      ),
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline, size: 120.0, color: Colors.indigo),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (KG)",
                    labelStyle: TextStyle(color: Colors.indigo)),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
                controller: pesoController,
                validator: (value){
                  if(value.isEmpty){
                    return "Insira seu peso!";
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (CM)",
                    labelStyle: TextStyle(color: Colors.indigo)),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
                controller: alturaController,
                validator: (value){
                  if(value.isEmpty){
                    return "Insira sua altura!";
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        _calculaIMC();
                      }
                    },
                    color: Colors.indigoAccent,
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Text(
                resultadoIMC,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, color: Colors.indigo),
              )
            ],
          ),
        ),
      ),
    );
  }
}
