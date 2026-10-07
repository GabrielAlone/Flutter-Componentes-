import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatefulWidget {
  @override
  State<MeuApp> createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {

  bool ligado = false;

  bool aceito = false;

  double valor = 50;

  String opcao = "A";

  void clicarIcone() {

    print("Clicou no coração");
  }

  
  void alterarSwitch(bool novoValor) {

    setState(() {

      ligado = novoValor;

      print(novoValor);

    });
  }

  void alterarCheckbox(bool novoValor) {

    setState(() {
      aceito = novoValor;
      print(novoValor);
    });
  }

  void alterarSlider(double novoValor) {

    setState(() {
      valor = novoValor;
      print(novoValor);
    });
  }

    void alterarOpcao(String novaOpcao) {

    setState(() {
      opcao = novaOpcao;
      print(novaOpcao);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        // ------------------------ APPBAR ------------------------
        // Barra que fica no topo da tela.
        appBar: AppBar(
          title: Text("Galeria de Widgets"),
        ),

        body: Padding(
          padding: EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ------------------------ ICONBUTTON ------------------------
              // Botão com o ícone de coração.
              Text("IconButton"),

              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: clicarIcone,
              ),

              SizedBox(height: 20),

              // ------------------------ SWITCH ------------------------
              // Botão que pode ser ligado ou desligado.
              Text("Switch"),

              Switch(
                value: ligado,

                onChanged: (valor) {
                  alterarSwitch(valor);
                },
              ),  

              SizedBox(height: 20),

              // ------------------------ CHECKBOX ------------------------
              // Caixa que pode ser marcada ou desmarcada.
              Text("Checkbox"),

              Checkbox(
                value: aceito,

                onChanged: (valor) {
                  alterarCheckbox(valor!);
                },
              ),

              SizedBox(height: 20),

              // ------------------------ SLIDER ------------------------
              // Barra que permite escolher um valor entre 0 e 100.
              Text("Slider: ${valor.toInt()}"),

              Slider(
                min: 0,

                max: 100,

                value: valor,

                onChanged: (novoValor) {
                  alterarSlider(novoValor);
                }
              ),

              SizedBox(height: 20),

              // ------------------------ SEGMENTED BUTTON ------------------------
              // Botão dividido em opções A, B e C.
              Text("Segmented Button"),

              SegmentedButton<String>(
                segments: [

                  ButtonSegment(
                    value: "A",
                    label: Text("Opção A")
                  ),

                  ButtonSegment(
                    value: "B",
                    label: Text("Opção B")
                  ),

                  ButtonSegment(
                    value: "C",
                    label: Text("Opção C")
                  ),
                ],

                selected: {opcao},

                onSelectionChanged: (novaSelecao) {
                  alterarOpcao(novaSelecao.first);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
