import 'package:flutter/material.dart';
import 'package:loteria_mexicana/Models/Settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WSettings extends StatefulWidget {

  final double initSegundos;
  final bool initSound;

  const WSettings({Key key, this.initSegundos, this.initSound}) : super(key: key);

  @override
  _WSettingsState createState() => _WSettingsState();
}

class _WSettingsState extends State<WSettings> {
  double _segundos;
  String _txtSegundos;
  bool _sound;

  @override
  void initState() {
    super.initState();
    _segundos = widget.initSegundos - 1;
    _sound = widget.initSound;

    if (_segundos == 0) {
      _txtSegundos = (_segundos + 1).toInt().toString()+ ' segundo';
    } else {
      _txtSegundos = (_segundos + 1).toInt().toString()+ ' segundos';
    }
  }

  void _onChange (bool value){
    setState(() {
      _sound = value;
    });
  }

  _setPreferencias() async{
    
    SharedPreferences preferences = await SharedPreferences.getInstance();
    double sec = _segundos + 1;
    preferences.remove('segundos');
    preferences.setDouble('segundos', sec);

    preferences.remove('sound');
    preferences.setBool('sound', _sound);

    Settings settings = new Settings(sec, _sound);
  
    print("Preferencias guardadas");
    Navigator.pop(context, settings);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal : 20, vertical : MediaQuery.of(context).size.height * 0.3),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Color(0XFFFBFF7D),
        child: Container(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,                
                 child: Container(
                   margin: EdgeInsets.only(top: 20),
                   child: Text(
                    'Configuración',
                      style: TextStyle(
                      color: Color(0XFF403F3A),
                      fontSize: 35,
                      fontFamily: 'OdibeeSans'
                    ),
                ),
                 ),
              ),
              Align(
                alignment: Alignment.center,
                 child: Container(
                   width: MediaQuery.of(context).size.longestSide,
                   height: MediaQuery.of(context).size.height * 0.2,
                   child: Column(
                     children: <Widget>[
                        Slider(
                          activeColor: Color(0XFF3D90B7),
                          inactiveColor: Color(0XFFD4D955),
                          value : _segundos, 
                          onChanged: (value) {
                            setState(() {
                              _segundos = value;
                              if (_segundos == 0) {
                                _txtSegundos = (_segundos + 1).toInt().toString()+ ' segundo';
                              } else {
                                _txtSegundos = (_segundos + 1).toInt().toString()+ ' segundos';
                              }
                            });
                          },
                          min: 0,
                          max: 9,
                          divisions: 9,   
                          label: _txtSegundos,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 25),
                          child: Text(
                            'Sacar carta cada $_txtSegundos',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                            ),  
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Sonido',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              Switch(
                                activeColor: Color(0XFF3D90B7),
                                inactiveThumbColor: Color(0XFFD4D955),
                                value: _sound, 
                                onChanged: _onChange
                              )
                            ],
                          )
                        ),
                     ],
                   ),
                 )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        }, 
                        child: Text("Cancelar",
                          style: TextStyle(
                            color: Color(0XFF403F3A),
                            fontSize: 30,
                            fontFamily: 'OdibeeSans'
                          ),
                        )
                      ),
                      FlatButton(
                        onPressed:_setPreferencias, 
                        child: Text("Aceptar",
                          style: TextStyle(
                            color: Color(0XFF403F3A),
                            fontSize: 30,
                            fontFamily: 'OdibeeSans'
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}