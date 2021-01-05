

import 'package:flutter/material.dart';
import 'package:loteria_mexicana/Models/Carta.dart';

class Cartas {
  static double posicion = 80;
  static double elevation = 5;

  Carta carta1 = new Carta(0, 'Corre y se va con', posicion, AssetImage('assets/cartas/b0.jpg'), elevation, 'assets/Sounds/b0.mp3');

  List<Carta> cartas = [    
    new Carta(1, 'El Gallo', posicion, AssetImage('assets/cartas/b1.jpg'), elevation, 'Sounds/b1.mp3'),
    new Carta(2, 'El Diablito', posicion, AssetImage('assets/cartas/b2.jpg'), elevation, 'Sounds/b2.mp3'),
    new Carta(3, 'La Dama', posicion, AssetImage('assets/cartas/b3.jpg'), elevation, 'Sounds/b3.mp3'),
    new Carta(4, 'El Catrin', posicion, AssetImage('assets/cartas/b4.jpg'), elevation, 'Sounds/b4.mp3'),
    new Carta(5, 'El Paraguas', posicion, AssetImage('assets/cartas/b5.jpg'), elevation, 'Sounds/b5.mp3'),
    new Carta(6, 'La Sirena', posicion, AssetImage('assets/cartas/b6.jpg'), elevation, 'Sounds/b6.mp3'),
    new Carta(7, 'La Escalera', posicion, AssetImage('assets/cartas/b7.jpg'), elevation, 'Sounds/b7.mp3'),
    new Carta(8, 'La Botella', posicion, AssetImage('assets/cartas/b8.jpg'), elevation, 'Sounds/b8.mp3'),
    new Carta(9, 'El Barril', posicion, AssetImage('assets/cartas/b9.jpg'), elevation, 'Sounds/b9.mp3'),
    new Carta(10, 'El Arbol', posicion, AssetImage('assets/cartas/b10.jpg'), elevation, 'Sounds/b10.mp3'),
    new Carta(11, 'El Melon', posicion, AssetImage('assets/cartas/b11.jpg'), elevation, 'Sounds/b11.mp3'),
    new Carta(12, 'El Valiente', posicion, AssetImage('assets/cartas/b12.jpg'), elevation, 'Sounds/b12.mp3'),
    new Carta(13, 'El Gorrito', posicion, AssetImage('assets/cartas/b13.jpg'), elevation, 'Sounds/b13.mp3'),
    new Carta(14, 'La Muerte', posicion, AssetImage('assets/cartas/b14.jpg'), elevation, 'Sounds/b14.mp3'),
    new Carta(15, 'La Pera', posicion, AssetImage('assets/cartas/b15.jpg'), elevation, 'Sounds/b15.mp3'),
    new Carta(16, 'La Bandera', posicion, AssetImage('assets/cartas/b16.jpg'), elevation, 'Sounds/b16.mp3'),
    new Carta(17, 'El Bandolon', posicion, AssetImage('assets/cartas/b17.jpg'), elevation, 'Sounds/b17.mp3'),
    new Carta(18, 'El Violoncello', posicion, AssetImage('assets/cartas/b18.jpg'), elevation, 'Sounds/b18.mp3'),
    new Carta(19, 'La Garza', posicion, AssetImage('assets/cartas/b19.jpg'), elevation, 'Sounds/b19.mp3'),
    new Carta(20, 'El Pajaro', posicion, AssetImage('assets/cartas/b20.jpg'), elevation, 'Sounds/b20.mp3'),
    new Carta(21, 'La Mano', posicion, AssetImage('assets/cartas/b21.jpg'), elevation, 'Sounds/b21.mp3'),
    new Carta(22, 'La Bota', posicion, AssetImage('assets/cartas/b22.jpg'), elevation, 'Sounds/b22.mp3'),
    new Carta(23, 'La Luna', posicion, AssetImage('assets/cartas/b23.jpg'), elevation, 'Sounds/b23.mp3'),
    new Carta(24, 'El Cotorro', posicion, AssetImage('assets/cartas/b24.jpg'), elevation, 'Sounds/b24.mp3'),
    new Carta(25, 'El Borracho', posicion, AssetImage('assets/cartas/b25.jpg'), elevation, 'Sounds/b25.mp3'),
    new Carta(26, 'El Negrito', posicion, AssetImage('assets/cartas/b26.jpg'), elevation, 'Sounds/b26.mp3'),
    new Carta(27, 'El Corazon', posicion, AssetImage('assets/cartas/b27.jpg'), elevation, 'Sounds/b27.mp3'),
    new Carta(28, 'La Sandia', posicion, AssetImage('assets/cartas/b28.jpg'), elevation, 'Sounds/b28.mp3'),
    new Carta(29, 'El Tambor', posicion, AssetImage('assets/cartas/b29.jpg'), elevation, 'Sounds/b29.mp3'),
    new Carta(30, 'El Camaron', posicion, AssetImage('assets/cartas/b30.jpg'), elevation, 'Sounds/b30.mp3'),
    new Carta(31, 'Las Jaras', posicion, AssetImage('assets/cartas/b31.jpg'), elevation, 'Sounds/b31.mp3'),
    new Carta(32, 'El Musico', posicion, AssetImage('assets/cartas/b32.jpg'), elevation, 'Sounds/b32.mp3'),
    new Carta(33, 'La Araña', posicion, AssetImage('assets/cartas/b33.jpg'), elevation, 'Sounds/b33.mp3'),
    new Carta(34, 'El Soldado', posicion, AssetImage('assets/cartas/b34.jpg'), elevation, 'Sounds/b34.mp3'),
    new Carta(35, 'La Estrella', posicion, AssetImage('assets/cartas/b35.jpg'), elevation, 'Sounds/b35.mp3'),
    new Carta(36, 'El Caso', posicion, AssetImage('assets/cartas/b36.jpg'), elevation, 'Sounds/b36.mp3'),
    new Carta(37, 'El Mundo', posicion, AssetImage('assets/cartas/b37.jpg'), elevation, 'Sounds/b37.mp3'),
    new Carta(38, 'El Apache', posicion, AssetImage('assets/cartas/b38.jpg'), elevation, 'Sounds/b38.mp3'),
    new Carta(39, 'El Nopal', posicion, AssetImage('assets/cartas/b39.jpg'), elevation, 'Sounds/b39.mp3'),
    new Carta(40, 'El Alacran', posicion, AssetImage('assets/cartas/b40.jpg'), elevation, 'Sounds/b40.mp3'),
    new Carta(41, 'La Rosa', posicion, AssetImage('assets/cartas/b41.jpg'), elevation, 'Sounds/b41.mp3'),
    new Carta(42, 'La Calavera', posicion, AssetImage('assets/cartas/b42.jpg'), elevation, 'Sounds/b42.mp3'),
    new Carta(43, 'La Campana', posicion, AssetImage('assets/cartas/b43.jpg'), elevation, 'Sounds/b43.mp3'),
    new Carta(44, 'El Cantarito', posicion, AssetImage('assets/cartas/b44.jpg'), elevation, 'Sounds/b44.mp3'),
    new Carta(45, 'El Venado', posicion, AssetImage('assets/cartas/b45.jpg'), elevation, 'Sounds/b45.mp3'),
    new Carta(46, 'El Sol', posicion, AssetImage('assets/cartas/b46.jpg'), elevation, 'Sounds/b46.mp3'),
    new Carta(47, 'La Corona', posicion, AssetImage('assets/cartas/b47.jpg'), elevation, 'Sounds/b47.mp3'),
    new Carta(48, 'La Chalupa', posicion, AssetImage('assets/cartas/b48.jpg'), elevation, 'Sounds/b48.mp3'),
    new Carta(49, 'El Pino', posicion, AssetImage('assets/cartas/b49.jpg'), elevation, 'Sounds/b49.mp3'),
    new Carta(50, 'El Pescado', posicion, AssetImage('assets/cartas/b50.jpg'), elevation, 'Sounds/b50.mp3'),
    new Carta(51, 'La Palma', posicion, AssetImage('assets/cartas/b51.jpg'), elevation, 'Sounds/b51.mp3'),
    new Carta(52, 'La Maceta', posicion, AssetImage('assets/cartas/b52.jpg'), elevation, 'Sounds/b52.mp3'),
    new Carta(53, 'El Arpa', posicion, AssetImage('assets/cartas/b53.jpg'), elevation, 'Sounds/b53.mp3'),
    new Carta(54, 'La Rana', posicion, AssetImage('assets/cartas/b54.jpg'), elevation, 'Sounds/b54.mp3'),
  ];


  
  
}