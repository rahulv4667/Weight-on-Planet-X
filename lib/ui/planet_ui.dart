import 'package:flutter/material.dart';

class Planet extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PlanetState();
  }

}

/*
*
    Mercury: 0.38
    Venus: 0.91
    Earth: 1.00
    Mars: 0.38
    Jupiter: 2.34
    Saturn: 1.06
    Uranus: 0.92
    Neptune: 1.19
    Pluto: 0.06

* */

class PlanetState extends State<Planet>{

  int radioValue;

  String printValue="Hello there";

  final TextEditingController _weightController=new TextEditingController();

  void radioButtonChanged(int value){
    setState(() {
      radioValue=value;
      if(_weightController.text.isNotEmpty){
        num i=num.parse(_weightController.text);

        if(radioValue==0){
          printValue="Your weight on Pluto is "+(i*0.06).toString();
        }
        else if(radioValue==1){
          printValue="Your weight on Venus is "+(i*0.91).toString();
        }
        else if(radioValue==2){
          printValue="Your weight on Mars is "+(i*0.38).toString();
        }
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: new Text("Planet X", style: new TextStyle(color: Colors.white),),
        backgroundColor: Colors.black26,
        centerTitle: true,
      ),

      body:
        new Container(
          alignment: Alignment.topCenter,
          child: new ListView(

            children: <Widget>[
              new Image.asset('images/planet.png',
                //color: Colors.blue,
                width: 90.0,
                height: 90.0,),

              new Container(
                padding: const EdgeInsets.all(20.0),

                child: new TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    icon: new Icon(Icons.accessibility),
                    hintText: "Enter your weight",
                    hintStyle: new TextStyle(color: Colors.white),
                    labelText: "Type in kgs only",
                    labelStyle: new TextStyle(color: Colors.cyan),
                    helperText: "Type in kgs only",
                    helperStyle: new TextStyle(color: Colors.blue)
                  ),

                ),
              ),

              new Container(
                margin: const EdgeInsets.only(left: 20.0),
                padding: const EdgeInsets.all(20.0),
                child:new Center(
                  child:new Row(
                    children: <Widget>[
                      new Radio<int>(value: 0,
                        activeColor: Colors.orange,
                        groupValue: radioValue,
                        onChanged: radioButtonChanged,
                      ),
                      new Text("Pluto",style: new TextStyle(color: Colors.black),),
                      new Radio<int>(value: 1,
                        activeColor: Colors.deepOrange,
                        groupValue: radioValue,
                        onChanged: radioButtonChanged,
                      ),
                      new Text("Venus",style: new TextStyle(color: Colors.black),),
                      new Radio<int>(value: 2,
                        activeColor: Colors.red,
                        groupValue: radioValue,
                        onChanged: radioButtonChanged,
                      ),
                      new Text("Mars",style: new TextStyle(color: Colors.black),),
                    ],
                  ),
                ),

              ),



              new Container(
                padding: const EdgeInsets.all(20.0),
                child:new Center(
                    child:new Text(printValue,
                      style: new TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0
                      ),
                    ),
                ),


              ),



            ],
          ),
        ),


    );

  }


}


