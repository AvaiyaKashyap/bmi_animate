import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> with
    TickerProviderStateMixin{
   late AnimationController _controller;
  late AnimationController _animationController;
  late AnimationController controller;
  late Animation sizeAnimation;
  late Animation secondAnimation;
  late Animation thirdAnimation;
  late Animation textAnimation;
  double _value = 0;
  double _weight = 0;
  double _age = 0;
  @override
  void initState() {
    super.initState();
    controller =AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    _controller =AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    sizeAnimation = Tween(begin: 100.0, end: 150.0).animate(controller);
    secondAnimation = Tween(begin: 150.0, end: 150.0).animate(_controller);
    thirdAnimation = Tween(begin: 50.0, end: 350.0).animate(_controller);
    textAnimation = Tween(begin: 0.0, end: 50.0).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();

    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white60,

      ),
      body: Stack(
        children:[
          Container(
          color: Colors.black26,
        ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: sizeAnimation.value,
                    width: sizeAnimation.value,
                    child: Icon(Icons.male_rounded,size: 80,),
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      border: Border.all(color: Colors.black,width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    height: sizeAnimation.value,
                    width: sizeAnimation.value,
                    child: Icon(Icons.female_rounded,size: 80,),
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      border: Border.all(color: Colors.black,width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
              ),
              Container(
                height: secondAnimation.value,
                width: thirdAnimation.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("${_value.toInt()}m",style: TextStyle(fontSize: 20),),
                    Slider(
                      min: 0,
                        max: 200,
                        thumbColor: Colors.black,
                        activeColor: Colors.black26,
                        inactiveColor: Colors.black12,
                        value: _value,
                        onChanged:  (value){
                          setState(() {
                            _value = value;
                          });
                        }
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white60,
                  border: Border.all(color: Colors.black,width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: sizeAnimation.value,
                    width: sizeAnimation.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("weight",style: TextStyle(fontSize: 20),),
                        Text("${_weight.toInt()}",style: TextStyle(fontSize: 20),),
                        Slider(
                            min: 0,
                            max: 120,
                            thumbColor: Colors.black,
                            activeColor: Colors.black26,
                            inactiveColor: Colors.black12,
                            value: _weight,
                            onChanged:  (value){
                              setState(() {
                                _weight = value;
                              });
                            }
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      border: Border.all(color: Colors.black,width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    height: sizeAnimation.value,
                    width: sizeAnimation.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("age",style: TextStyle(fontSize: 20),),
                        Text("${_age.toInt()}",style: TextStyle(fontSize: 20),),
                        Slider(
                            min: 0,
                            max: 120,
                            thumbColor: Colors.black,
                            activeColor: Colors.black26,
                            inactiveColor: Colors.black12,
                            value: _age,
                            onChanged:  (value){
                              setState(() {
                                _age = value;
                              });
                            }
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      border: Border.all(color: Colors.black,width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
              ),
              Container(
                height: secondAnimation.value,
                width: thirdAnimation.value,
                alignment: Alignment.center,
                child: Text("Calculate",style: TextStyle(
                  fontSize: textAnimation.value,
                  fontWeight: FontWeight.w400
                ),),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  border: Border.all(color: Colors.black,width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),

              ),
            ],
          )
      ],
      ),
    );
  }
}