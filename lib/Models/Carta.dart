import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Carta {

  int id;
  String title;
  AssetImage image;
  double posicion;
  double elevation;
  String audio;

  Carta(
    this.id,
    this.title,
    this.posicion,
    this.image,
    this.elevation,
    this.audio
  );  


}