import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:loteria_mexicana/Models/Carta.dart';
import 'package:loteria_mexicana/Models/Cartas.dart';
import 'package:loteria_mexicana/Models/Settings.dart';
import 'package:loteria_mexicana/Widgets/WCarta.dart';
import 'package:loteria_mexicana/Widgets/WSettings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
class Baraja extends StatefulWidget { // Esta es el codigo de la pantalla donde salen las cartas
  @override
  _BarajaState createState() => _BarajaState();
}

class _BarajaState extends State<Baraja>{
  static Cartas _cartasC = new Cartas();
  List<Carta> _baraja = _cartasC.cartas;
  List<Carta> _cartas = [];
  List<Carta> _cartasAbajo = [];
  List<int> numerosCartas;
  int _contador = 0;

  String _btnPlay = 'Iniciar';
  String _title = 'Loteria Mexicana';
  bool _play = false;
  bool _isButtonDisabled = false;
  double _segundos;
  bool _sound;
  bool _isCharge = true;

  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  _getPreferencias() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();

    double sec = preferences.getDouble('segundos');
    bool sound = preferences.getBool('sound');
    setState(() {
      if (sec != null && sound != null) {
        _segundos = sec;
        _sound = sound;
        print('Con configuracion');
      } else {
        _segundos = 3;
        _sound = true;
        print('Sin configuracion');
      }
      _isCharge = false;
    });
  }
  
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPreferencias();
    initPlayer();
    
    _cartas.add(_cartasC.carta1);
    _cartasAbajo.add(_cartasC.carta1);
    numerosCartas = _randomNumeros();
  }

   void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
  }

  List<int> _randomNumeros(){ // Para barajear las cartas
    List<int> numeros = [];
    int limite = _baraja.length;
    var rng = new Random();
    int numero; 
    bool repetir;

    for (var i = 0; i < limite; i++) {
      if (i == 0) {
        numeros.add(rng.nextInt(limite));
      }else{
        do {
          numero = rng.nextInt(limite);
          repetir = false;
          for (var j = 0; j < numeros.length; j++) {
            if (numero == numeros.elementAt(j))
              repetir = true;
          }
          if (!repetir) {
            numeros.add(numero);
          }
        } while (repetir);
      }
    }
    return numeros;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0XFF3D90B7),
        child: _isCharge ? null : Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 30,
                    left: 5,
                    child: IconButton(
                      icon: new Icon(Icons.arrow_back, color: Colors.grey[50], size: 25,),
                      onPressed: () => Navigator.pop(context)
                    )
                  ),
                  Positioned(
                    top: 30,
                    right: 5,
                    child: IconButton( // El boton de ajustes
                      icon: new Icon(Icons.settings, color: Colors.grey[50], size: 25,),
                      onPressed: _showDialog,
                    )
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      child: Text(
                        _title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0XFFEBF15E),
                          fontSize: MediaQuery.of(context).size.width * 0.12,
                          fontFamily: 'OdibeeSans'
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.53,
              child: Stack(
                children: _cartas.map((carta) {
                  return WCarta(carta: carta); // Las cartas grandes
                }).toList(),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              margin: EdgeInsets.symmetric(vertical : 0, horizontal: 10),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6.0))
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _cartasAbajo.length,
                itemBuilder: (BuildContext context, int i){
                  final carta = _cartasAbajo[i];
                  return Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.only(right: 2),
                    decoration: new BoxDecoration( // Las cartas pequenas
                      color: Colors.white, // El color de fondo de las cartas
                      borderRadius: BorderRadius.all(Radius.circular(6.0))
                    ),
                    child: Image(image: carta.image)
                  );
                }
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                RaisedButton(
                  padding: EdgeInsets.all(0),
                  color: Color(0XFFEBF15E), // El color de los botones verdes
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.1,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.replay,
                        color: Color(0XFF3D90B7),
                        size: MediaQuery.of(context).size.width * 0.1,
                      )
                  ),
                  onPressed: () => _clickReplay() // Esto es cuando se presiona
                ),
                RaisedButton( // <- boton
                  padding: EdgeInsets.all(0),
                  color: Color(0XFFEBF15E),
                  disabledColor: Color(0XFF7BADC3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container( // El otro boton para empezar el juego
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.6,
                    alignment: Alignment.center,
                    child: Text(
                      _btnPlay,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _isButtonDisabled ? Colors.white54 : Color(0XFF3D90B7),
                        fontSize: MediaQuery.of(context).size.width * 0.1,
                        fontFamily: 'OdibeeSans'
                      ),
                    ),
                  ),
                  onPressed: _isButtonDisabled ? null : () =>   _clickPlay()
                ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }

  void _showDialog() async { // Todo esto hace que se muestre el recuadro de ajustes
  
    final Settings settings = await showDialog<Settings>(
      context: context,
      builder: (context) => WSettings(initSegundos: _segundos, initSound: _sound),
    );
    if (settings != null) {
      setState(() {
        _segundos = settings.segundos; // Se seleccionan los segundos a esperar cuando sale cada carta
        _sound = settings.sound; // Y si tiene sonido
      });
    }
  }

  void _clickPlay(){
    if (_play) {
      setState(() {
        _play = false;
        _btnPlay = 'Iniciar'; // Si el juego esta en pausa se muestra 'iniciar' en el boton
      });
    } else {
      setState(() {
        _play = true;
        _btnPlay = 'Pausar'; // En caso contrario muestra el de Pausar
      });
      _juego();
    }
  }

  void _clickReplay(){ // Cuando se presiona el boton de replay, todo vuelve a como se inicio la aplicacion
    setState(() {
      _cartasAbajo.clear(); // Se vacian las cartas
      _cartas.clear(); // 
      _cartasAbajo.add(_cartasC.carta1); // Y agrego la carta roja de inicio
      _cartas.add(_cartasC.carta1);
      numerosCartas.clear();
      numerosCartas = _randomNumeros(); // y Aqui las barajeo
      _play = false;
      _btnPlay = 'Iniciar';
      _contador = 0;
      _isButtonDisabled = false;    
      _title = 'Loteria Mexicana'; // El titulo se vuelve a poner como ' Loteria Mexicana ' 
    });
  }

  
  void _juego() async{
    
    if (_sound) 
      if (_cartas.length == 1) 
        audioCache.play('Sounds/b0.mp3');
    
    
    while (_play && _contador < _baraja.length) { // Si el juego esta en play y aun hay cartas que falten por salir se sacan las cartas
      await Future.delayed(Duration(milliseconds: _segundos.toInt() * 1000)); // Este es el tiempo que se espera para sacar una carta
      if (_play) {
        setState(() {
          advancedPlayer.setPlaybackRate(playbackRate: 0.1);
          Carta carta = _baraja.elementAt(numerosCartas.elementAt(_contador));
          if (_sound) {
            audioCache.play(carta.audio);  // Se reproduce la voz de la carta
          }
          _cartas.add(carta);
          _cartasAbajo.insert(0, _baraja.elementAt(numerosCartas.elementAt(_contador)));
          if (_contador > 1) {
            _cartas.elementAt(_contador - 2).elevation = 0;
          }
          _title = _cartas.elementAt(_cartas.length - 1).title;
          _contador++;
        });
      }
    }
    if(_contador >= _baraja.length) // Si se hecharon todas las cartas se pausa el juego
      setState(() {
        _isButtonDisabled = true;    
        _play = false;
        _btnPlay = 'Reiniciar';
        _title = 'Loteria Mexicana';
      });
  }
    
}

