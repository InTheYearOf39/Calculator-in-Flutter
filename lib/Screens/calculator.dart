import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {




  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  // declaring operators
  String Output = "0";
  String _out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  PressedButton(String val){
    print(val);
    //algebraic conditions
    if(val =="C"){
      _out = "0";
      num1 = 0;
      num2 = 0;
      operand ="";
    }else if(val == "+" || val == "-" || val == "*" || val == "/" ){
      num1 = double.parse(Output);
      operand = val;
      _out = "0";
      Output = Output + val ;
    }else if (val == "."){
      if(_out.contains(".")){
        return;
      }else{
        _out = _out + val;
      }
    }else if(val == "="){
      num2 = double.parse(Output);
      if(operand == "+"){
        _out = (num1 + num2).toString();
      }
      if(operand == "-"){
        _out = (num1 - num2).toString();
      }
      if(operand == "*"){
        _out = (num1 * num2).toString();
      }
      if(operand == "/"){
        _out = (num1 / num2).toString();
      }
      num2 = 0.0;
      num1 = 0.0;
    }else{
      _out = _out+val;
    }

    setState(() {
      Output = double.parse(_out).toStringAsFixed(2);
    });
    }

  //create button widgets
  Widget CalBtn(String Btnval){
    return Expanded(
      child:Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey,
                offset: Offset(2.0,2.0),
                blurRadius: 8.0,
                spreadRadius: 1.0,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-2.0,-2.0),
                blurRadius: 8.0,
                spreadRadius: 1.0,
              ),
            ]
        ),
        child: MaterialButton(
          padding: EdgeInsets.all(30.0),
          child: Text(Btnval, style: TextStyle(
              fontSize: 22.0
          ),),
          onPressed: ()=>PressedButton(Btnval),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 50.0),
                child: Text(Output, style: TextStyle(
                  fontSize: 60.0,
                ),),
              ),
              Positioned(
                bottom: 0,
                  child:Divider(),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: [
                      // add custom buttons
                      CalBtn("."),
                      CalBtn("C"),
                      CalBtn("<"),
                      CalBtn("*"),
                    ],
                  ),
                  Row(
                    children: [
                      // add custom buttons
                      CalBtn("7"),
                      CalBtn("8"),
                      CalBtn("9"),
                      CalBtn("/"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      // add custom buttons
                      CalBtn("4"),
                      CalBtn("5"),
                      CalBtn("6"),
                      CalBtn("+"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      // add custom buttons
                      CalBtn("1"),
                      CalBtn("2"),
                      CalBtn("3"),
                      CalBtn("-"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      // add custom buttons
                      CalBtn("0"),
                      CalBtn("="),

                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
