import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello/maps/pokelab.dart';
import 'package:hello/maps/LittleRoot.dart';
import 'package:hello/characters/boy.dart';
import 'button.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  /*Variables 
*/
  double mapX = -1.875;
  double mapY = -7.1;

  //pokelab
  double labMapX = 0; //1.125
  double labMapY = 0;  //0.65

  //boy character
  int boySpriteCount = 0;
  String boyDirection = 'Down';

  String currentLocation = 'LittleRoot';
  double step = 0.25;
  static double stepLab = 0.25;
  //no mans land for pokelab
  List<List<double>> noMansLandLab = [

    //teleport

    [1.25, -0.75],
    [1.5, -0.75],
    [1.75, -0.75],

    //left

    [2.75, 1.5],
    [2.75, 1.25],    
    [2.75, 1.0],
    [2.75, 0.75],
    [2.75, 0.5],
    [2.75, 0.0],
    [2.75, 0.25],
    [2.75, -0.25],
    [2.75, -0.5],
    [2.75, -0.75],
    [2.75, -1.0],
    [2.75, -1.25],
    [2.75, -1.5],
    [2.5, -1.5],
    [2.25, -1.5],
    [2.0, -1.5],
    [1.75, -1.5],
    [1.5, -1.5],
    [1.5, -2.0],
    [1.25, -1.75],
    [1.0, -2.0],
    [0.75, -2.0],

    //top

    [2.5, 1.75],
    [2.25, 1.75],
    [2.0, 1.75],
    [1.75, 1.75],
    [1.75, 2.0],
    [1.5, 2.0],
    [1.25, 2.0],
    [1.0, 2.0],
    [0.75, 1.75],
    [0.75, 1.5],
    [0.5, 1.5],
    [0.25, 1.5],
    [0.0, 1.75],
    [-0.25, 1.75],
    [-0.5, 1.75],
    [-0.75, 1.75],
    [-1.0, 2.0],
    [-1.25, 2.0],
    [-1.5, 2.0],
    [-1.75, 2.0],
    [-2.0, 2.0],
    [-2.25, 2.0],
    [-2.5, 2.0],
    [-2.75, 2.0],
    [-2.75, 1.75],

    //right

    [-3.0, 1.5],
    [-3.0, 1.25],
    [-3.0, 1.0],
    [-3.0, 0.75],
    [-3.0, 0.5],
    [-3.0, 0.25],
    [-3.0, 0.0],
    [-3.0, -0.25],
    [-3.0, -0.5],
    [-2.75, -0.75],
    [-2.5, -1.0],
    [-2.25, -1.0],
    [-2.0, -1.0],
    [-1.75, -1.0],
    [-1.75, -0.75],
    [-2.5, -1.25],
    [-2.5, -1.5],
    [-2.25, -1.75],
    [-2.0, -2.0],
    [-1.75, -2.0],
    [-1.5, -2.0],  

    //bottom

    [-1.25, -2.0], 
    [-1.0, -1.75],
    [-1.0, -1.5],
    [-0.75, -1.5],
    [-0.5, -1.5],
    [-0.25, -1.5],
    [0.0, -1.5],
    [0.25, -1.5],
    [0.5, -1.75],
    
    //body

    [2.5, 0.0],
    [2.25, 0.0],
    [2.0, 0.0],
    [1.75, 0.0],
    [1.0, 0.0],
    [0.75, 0.0],
    [0.5, 0.0],
    [0.25, 0.0],
    [0.0, 0.0],
    [2.0, 0.75], 
    [1.75, 0.75],
    [1.5, 0.75],
    [-2.0, 1.5],
    [-1.75, 1.5],
    [-0.5, -0.75],
    [-0.5, 0.75],
    [-2.0, 0.0],
    [-2.0, 0.25],
    [-2.0, 0.5],
    [-2.0, 0.75],
    [-1.75, 1.0],
    [-1.5, 1.0],
    [-1.25, 1.0],
    [-1.0, 1.0],
    [-0.75, 0.75],
    [-0.25, 0.75],
    [0.0, 0.75],
    [0.25, 0.75],
    [0.5, 0.75],
    [-1.75, 0.25],
    [-1.5, 0.25],
    [-1.25, 0.25],
    [-1.0, 0.25],
    [-0.75, 0.0],
    [-0.75, -0.25],
    [-0.75, -0.5],
    [-0.75, -0.75],
    [-0.75, -1.0],
    [-0.5, -1.0],
    [-0.25, -0.75],
    [0.0, -0.75],



    
  ];

  //no mans land for littleroot
  List<List<double>> noMansLandLittleRoot = [

    //left

    [2.375, 7.9],
    [2.375, 7.65],
    [2.375, 7.4],
    [2.375, 7.15],
    [2.375, 6.9],
    [2.375, 6.65],
    [2.375, 6.4],
    [2.375, 6.15],
    [2.375, 5.9],
    [2.375, 5.4],
    [2.375, 5.15],
    [2.375, 5.65],
    [2.375, 4.9],
    [2.375, 4.65],
    [2.375, 4.4],
    [2.375, 4.15],
    [2.375, 3.90],
    [2.375, 3.65],
    [2.375, 3.40],
    [2.375, 3.15],
    [2.375, 2.90],
    [2.375, 2.65],
    [2.375, 2.40],
    [2.375, 2.15],
    [2.375, 1.90],
    [2.375, 1.65],
    [2.375, 1.40],
    [2.375, 1.15],
    [2.375, 0.90],
    [2.375, 0.65],
    [2.375, 0.34],
    [2.375, 0.40],
    [2.375, 0.15],
    [2.375, -0.9],
    [2.375, -0.3],
    [2.375, -0.34],
    [2.375, -0.35],
    [2.375, -0.5],
    [2.375, -0.8],
    [2.375, -0.1],
    [2.375, -0.3],
    [2.375, -0.6],
    [2.375, -0.8],
    [2.375, -0.84],
    [2.375, -0.85],
    [2.375, -1.1],
    [2.375, -1.35],
    [2.375, -1.6],
    [2.375, -1.85],
    [2.375, -2.1],
    [2.375, -2.35],
    [2.375, -2.6],
    [2.375, -2.85],
    [2.375, -3.1],
    [2.375, -3.35],
    [2.375, -3.6],
    [2.375, -3.85], 
    [2.375, -1.0],
    [2.375, -1.34],
    [2.375, -1.59],
    [2.375, -1.84],
    [2.375, -2.0],
    [2.375, -2.34],
    [2.375, -2.59],
    [2.375, -2.84],
    [2.375, -3.0],
    [2.375, -3.34],
    [2.375, -3.59],
    [2.375, -3.8],
    [2.375, -4.1],
    [2.375, -4.35],
    [2.375, -4.6],
    [2.375, -4.85],
    [2.375, -5.35],
    [2.375, -5.6],
    [2.375, -5.1],
    [2.375, -5.85],
    [2.375, -6.1],
    [2.375, -6.35],
    [2.375, -6.6],
    [2.375, -6.85],
    [2.375, -7.1],
    [2.375, -7.35],

    //Down

    [2.125, -7.35],
    [1.875, -7.35],
    [1.625, -7.35],
    [1.375, -7.35],
    [1.125, -7.35],
    [1.125, -7.35],
    [0.875, -7.35],
    [0.625, -7.35],
    [0.375, -7.35],
    [0.125, -7.35],
    [-0.125, -7.35],
    [-0.375, -7.35],
    [-0.625, -7.35],
    [-0.875, -7.35],
    [-1.125, -7.35],
    [-1.375, -7.35],
    [-1.625, -7.35],
    [-1.875, -7.35],
    [-2.125, -7.35],
    [-2.375, -7.35],

    //right
    [-2.375, 7.9],
    [-2.375, 7.1],
    [-2.375, 7.65],
    [-2.375, 7.4],
    [-2.375, 7.15],
    [-2.375, 6.9],
    [-2.375, 6.65],
    [-2.375, 6.4],
    [-2.375, 6.15],
    [-2.375, 5.9],
    [-2.375, 5.4],
    [-2.375, 5.15],
    [-2.375, 5.65],
    [-2.375, 4.9],
    [-2.375, 4.65],
    [-2.375, 4.4],
    [-2.375, 4.15],
    [-2.375, 3.90],
    [-2.375, 3.65],
    [-2.375, 3.40],
    [-2.375, 3.15],
    [-2.375, 2.90],
    [-2.375, 2.65],
    [-2.375, 2.40],
    [-2.375, 2.15],
    [-2.375, 1.90],
    [-2.375, 1.65],
    [-2.375, 1.40],
    [-2.375, 1.15],
    [-2.375, 0.90],
    [-2.375, 0.65],
    [-2.375, 0.34],
    [-2.375, 0.40],
    [-2.375, 0.15],
    [-2.375, -0.9],
    [-2.375, -0.3],
    [-2.375, -0.34],
    [-2.375, -0.35],
    [-2.375, -0.5],
    [-2.375, -0.8],
    [-2.375, -0.1],
    [-2.375, -0.3],
    [-2.375, -0.6],
    [-2.375, -0.8],
    [-2.375, -0.84],
    [-2.375, -0.85],
    [-2.375, -1.1],
    [-2.375, -1.35],
    [-2.375, -1.6],
    [-2.375, -1.85],
    [-2.375, -2.1],
    [-2.375, -2.35],
    [-2.375, -2.6],
    [-2.375, -2.85],
    [-2.375, -3.1],
    [-2.375, -3.35],
    [-2.375, -3.6],
    [-2.375, -3.85], 
    [-2.375, -1.0],
    [-2.375, -1.34],
    [-2.375, -1.59],
    [-2.375, -1.84],
    [-2.375, -2.0],
    [-2.375, -2.34],
    [-2.375, -2.59],
    [-2.375, -2.84],
    [-2.375, -3.0],
    [-2.375, -3.34],
    [-2.375, -3.59],
    [-2.375, -3.8],
    [-2.375, -4.1],
    [-2.375, -4.35],
    [-2.375, -4.6],
    [-2.375, -4.85],
    [-2.375, -5.35],
    [-2.375, -5.6],
    [-2.375, -5.1],
    [-2.375, -5.85],
    [-2.375, -6.1],
    [-2.375, -6.35],
    [-2.375, -6.6],
    [-2.375, -6.85],
    [-2.375, -7.1],
    [-2.375, -7.35],

    //up

    [2.125, 8.15],
    [1.875, 8.15],
    [1.625, 8.15],
    [1.375, 8.15],
    [1.125, 8.15],
    [1.125, 8.15],
    [0.875, 8.15],
    [0.625, 8.15],
    [0.375, 8.15],
    [0.125, 8.15],
    [-0.125, 8.15],
    [-0.375, 8.15],
    [-0.625, 8.15],
    [-0.875, 8.15],
    [-1.125, 8.15],
    [-1.375, 8.15],
    [-1.625, 8.15],
    [-1.875, 8.15],
    [-2.125, 8.15],
    [-2.375, 8.15],
  ];

  


  void moveUp() {
    boyDirection = "Up";
    if (currentLocation == 'LittleRoot') {
      if (canMoveTo(boyDirection, noMansLandLittleRoot, mapX, mapY,))   {
        setState(() {
          mapY += step;   
        });
      }

      //enter pokelab

      if (double.parse((mapX).toStringAsFixed(4)) == -1.875 &&
          double.parse((mapY).toStringAsFixed(4)) == 7.9) {
        setState(() {
          currentLocation = 'pokelab';
          labMapX = 1.0;
          labMapY = -1.75;  //-2.73
        });
        
      }
      animateWalk();
    }
    if (currentLocation == 'pokelab') {
      if (canMoveTo(boyDirection, noMansLandLab, labMapX, labMapY)) {
        setState(() {
          labMapY += step;
        });
      }
      animateWalk();
    }
  }

  void moveDown() {
    boyDirection = "Down";
    if (currentLocation == 'LittleRoot') {
      if (canMoveTo(boyDirection, noMansLandLittleRoot, mapX, mapY)) {
        setState(() {
          mapY -= step;
          
        });
      }
      animateWalk();
    }
    if (currentLocation == 'pokelab') {
      if (canMoveTo(boyDirection, noMansLandLab, labMapX, labMapY)) {
        setState(() {
          labMapY -= step;
        });
      }
      //enter pokelab

      if (double.parse((labMapX).toStringAsFixed(4)) == 1.25 &&
          double.parse((labMapY).toStringAsFixed(4)) == -0.5) {
        setState(() {
          currentLocation = 'LittleRoot';
          labMapX = 0;
          labMapY = 0;  //-2.73
        });
        
      }
      animateWalk();
    }
  }

  void moveLeft() {
    boyDirection = "Left";
    if (currentLocation == "LittleRoot") {
      if (canMoveTo(boyDirection, noMansLandLittleRoot, mapX, mapY)) {
        setState(() {
          mapX += step;
        });
      } 
      animateWalk();
    }
    if (currentLocation == 'pokelab') {
      if (canMoveTo(boyDirection, noMansLandLab, labMapX, labMapY)) {
        setState(() {
          labMapX += step;
        });
      }
      animateWalk();
    }
  }

  void moveRight() {
    boyDirection = "Right";
    if (currentLocation == "LittleRoot") {
      if (canMoveTo(boyDirection, noMansLandLittleRoot, mapX, mapY)) {
        setState(() {
          mapX -= step;
          
        });
      }
      animateWalk();
    }
    
    if (currentLocation == 'pokelab') {
      if (canMoveTo(boyDirection, noMansLandLab, labMapX, labMapY)) {
        setState(() {
          labMapX -= step;
        });
      }
      animateWalk();
    }

  }

  void pressedA() {}
  void pressedB() {}

  void animateWalk() {
    print('X:' + mapX.toString() + ',Y' + mapY.toString());
    print('labMapX:' + labMapX.toString() + ', labMapY' + labMapY.toString());


    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        boySpriteCount++;
      });
      if (boySpriteCount == 3) {
        boySpriteCount = 0;
        timer.cancel();
      }
    });
  }

  double clearNum(double num) {
    return double.parse(num.toStringAsFixed(4));
  }

  bool canMoveTo(String direction, var noMansLand, double x, double y) {
    double stepX = 0;
    double stepY = 0;

    if (direction == 'Left') {
      stepX = step;
      stepY = 0;
    } else if (direction == 'Right') {
      stepX = -step;
      stepY = 0;
    } else if (direction == 'Up') {
      stepX = 0;
      stepY = step;
    } else if (direction == 'Down') {
      stepX = 0;
      stepY = -step;
    }
    for (int i = 0; i < noMansLand.length; i++) {
      if ((clearNum(noMansLand[i][0]) == clearNum(x + stepX)) &&
          (clearNum(noMansLand[i][1]) == clearNum(y + stepY))) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (currentLocation == 'LittleRoot') {
      step = 0.25;
    } else if (currentLocation == 'pokelab') {
      step = 0.25;
    }
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
                color: Colors.grey,
                child: Stack(
                  children: [
                    //Root
                    LittleRoot(
                      x: mapX,
                      y: mapY,
                      currentMap: currentLocation,
                    ),

                    MyPokeLab(
                      x: labMapX,
                      y: labMapY,
                      currentMap: currentLocation,
                    ),
                    Container(
                      alignment: Alignment(0, 0),
                      child: MyBoy(
                        location: currentLocation,
                        boySpriteCount: boySpriteCount,
                        direction: boyDirection,
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'G A M E B O Y',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          '👾',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  
                                  Container(
                                    height: 10,
                                    width: 10,
                                  ),
                                  MyButton(
                                    text: 'X',
                                    function: moveLeft,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                  ),
                                  MyButton(
                                    text: 'Y',
                                    function: moveUp,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                  ),
                                  MyButton(
                                    text: 'Z',
                                    function: moveDown,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                  ),
                                  MyButton(
                                    text: 'C',
                                    function: moveRight,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                  ),
                                ],
                              ), 
                            ],
                          ),
                          
                          MyButton(
                            text: 'a',
                            function: pressedA,
                          ),
                          MyButton(
                            text: 'b',
                            function: pressedB,
                          )
                                
                        ],
                      ),
                      
                    Text(
                      'CREATED BY BATUHAN',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
