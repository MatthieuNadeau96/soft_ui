import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isNightMode = false;
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isNightMode ? Colors.grey[850] : Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: GestureDetector(
                onLongPress: () {
                  setState(() {
                    isPressed = true;
                  });
                },
                onLongPressUp: () {
                  setState(() {
                    isPressed = false;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: 200,
                  height: 200,
                  child: isNightMode
                      ? Icon(
                          Icons.android,
                          size: 80,
                          color: Colors.white,
                        )
                      : Icon(Icons.android, size: 80),
                  decoration: isNightMode
                      ? BoxDecoration(
                          // Night mode shadows
                          color: Colors.grey[850],
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          boxShadow: isPressed == true
                              ? null
                              : [
                                  BoxShadow(
                                    color: Colors.grey[900],
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.grey[800],
                                    offset: Offset(-4.0, -4.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  )
                                ],
                        )
                      : BoxDecoration(
                          // Light mode shadows
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          boxShadow: isPressed == true
                              ? null
                              : [
                                  BoxShadow(
                                    color: Colors.grey[500],
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-4.0, -4.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  )
                                ],
                        ),
                ),
              ),
            ),
            Container(
              child: Switch(
                value: isNightMode,
                onChanged: (bool n) {
                  setState(() {
                    isNightMode = n;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
