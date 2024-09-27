import 'dart:math';
import 'package:flutter/material.dart';

  class Jogo extends StatefulWidget {
  const Jogo({super.key});
  final String title = "Jokenpo";

  @override
  State<Jogo> createState() => _JogoState();
  }

  class _JogoState extends State<Jogo> {

    var _imagemApp = AssetImage("images/padrao.png");
    var _mensagem = "Escolha uma opção abaixo";

    void _opcaoSelecionada(String escolhaUsuario){
      var opcoes = ["pedra", "papel", "tesoura"];
      var numero = Random().nextInt(opcoes.length);
      var escolhaApp = opcoes[numero];

      switch(escolhaApp){
        case "pedra":
          setState(() {
            this._imagemApp = AssetImage("images/pedra.png");
          });
          break;
        case "papel":
          setState(() {
            this._imagemApp = AssetImage("images/papel.png");
          });
          break;
        case "tesoura":
          setState(() {
            this._imagemApp = AssetImage("images/tesoura.png");
          });
          break;
      }

      if(
        (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")
      ){
        setState(() {
          this._mensagem = "Você ganhou!";
        });
      }else if (
        (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel")
      ){
        setState(() {
          this._mensagem = "Você perdeu!";
        });
      } else {
        setState(() {
          this._mensagem = "Empatamos";
        });
      }

      if(escolhaApp == "pedra" && escolhaUsuario == "tesoura"){
        this._mensagem = "Você perdeu!";
      } else if (escolhaApp == "papel" && escolhaUsuario == "pedra"){
        this._mensagem = "Você perdeu!";
      } else if (escolhaApp == "tesoura" && escolhaUsuario == "papel"){
        this._mensagem = "Você perdeu!";
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do app",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: this._imagemApp,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("images/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.png", height: 100),
              ),
            ],
          ),
        ],
      ),
    );
  }
  }