import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:loteria_mexicana/Models/Carta.dart';

class WCarta extends StatefulWidget {
  final Carta carta;

  WCarta({Key key, this.carta}) : super(key: key);

  @override
  _WCartaState createState() => _WCartaState();
}

class _WCartaState extends State<WCarta> {
  Carta carta;

  @override
  void initState() { 
    super.initState();
    carta = widget.carta;
  }
  
  @override
  Widget build(BuildContext context) {
    return FadeInLeftBig(
      duration: Duration(milliseconds: 1000),
      child: Card(
        margin: EdgeInsets.all(10),
        color: Colors.white,
        elevation: carta.elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.73,
          height: MediaQuery.of(context).size.height * 0.53,
          padding: EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: carta.image, fit: BoxFit.cover),
             borderRadius: BorderRadius.circular(8),
            ),
          )
        )
      ),
    );
  }
}