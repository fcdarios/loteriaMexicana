import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState(); // La ventana de inicio
}

class _DashboardState extends State<Dashboard>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Color(0XFF3D90B7),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 30,
              left: 10,
              child: IconButton(
                icon: new Icon(Icons.menu, color: Colors.grey[50], size: 25,),
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
              )
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 80),
                child: Text(
                  'Loteria\nMexicana',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFFEBF15E),
                    fontSize: MediaQuery.of(context).size.width * 0.2,
                    fontFamily: 'OdibeeSans'
                  ),
                ),
              )
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset('assets/logo.png')
              ),
            ),
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: RaisedButton(
                padding: EdgeInsets.all(0),
                color: Color(0XFFEBF15E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.15,
                  alignment: Alignment.center,
                  child: Text(
                    'Jugar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0XFF3D90B7),
                      fontSize: MediaQuery.of(context).size.width * 0.15,
                      fontFamily: 'OdibeeSans'
                    ),
                  ),
                ),
                onPressed: () => {
                  Navigator.pushNamed(context, '/baraja')
                }
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0XFF3D90B7),
          child: Stack(
            children: <Widget>[
               Positioned(
                top: 30,
                left: 10,
                child: IconButton(
                  icon: new Icon(Icons.arrow_back, color: Colors.grey[50], size: 25,),
                  onPressed: () => Navigator.pop(context),
                )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Dario Olivares', // Mi nombre jeje
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0XFFEBF15E),
                      fontSize: 30,
                      fontFamily: 'OdibeeSans'
                    ),
                  ),
                )
              ),
            ],
          ),
        )
      ),
    );
  }


}

