

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Clock Animation",
      home: HomeScreen(),
));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  _currentTime(){
    return "${DateTime.now().hour} : ${DateTime.now().minute}";

  }
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 1));
    animationController.addListener((){
      if(animationController.isCompleted){
        animationController.reverse();
      }else
        if(animationController.isDismissed){
          animationController.forward();
        }
      setState(() {

      });

    });
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation = Tween(begin: -0.5,end: 0.5).animate(animation);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Classic Digital Clock",style: TextStyle(color: Colors.brown.shade900,fontWeight: FontWeight.bold),),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              child: Image.asset('images/back.png'),


            ),
          ),
          Container(
            padding: EdgeInsets.only(top:150.0,left: 15.0),


            child: Center(
              child: Column(
                children: <Widget>[
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(160.0)),
                    elevation: 20.0,
                    child: Container(
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Text(_currentTime(),
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40.0,
                          color: Colors.brown.shade300),

                        ),
                      ),
                    ),
                  ),
                  Transform(
                    alignment: FractionalOffset(0.5, 0.0),
                    transform: Matrix4.rotationZ(animation.value),
                    child: Container(
                      child: Image.asset('images/pendulum.png',width: 100,height: 250,),
                    ),
                  )
                ],
              ),
            ),

          ),
        ],
      )
    );
  }
}


