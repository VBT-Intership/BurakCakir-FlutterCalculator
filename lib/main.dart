import 'package:basic_calculator/utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BasicCalculator(),
    );
  }
}

class BasicCalculator extends StatefulWidget {
  @override
  _BasicCalculatorState createState() => _BasicCalculatorState();
}

class _BasicCalculatorState extends State<BasicCalculator> {
  String operation = "";
  String result = "";
  String savedOperations;

  buttonOnPressed(text) {
    setState(() {
      switch (text) {
        case CLEAN:
          operation = "";
          result = "";
          break;

        case DELETE:
          operation = operation.substring(0, operation.length - 1);
          break;

        case RESULT:
          result = handleResult(operation);
          break;

        case SAVE:
          if (result.length > 0) listSavedResults.add(result);
          break;

        default:
          operation += text;
          break;
      }
    });
  }

  Widget bindFlatButton(String text) {
    return Container(
        margin: EdgeInsets.all(0.5),
        child: FlatButton(
          onPressed: () => buttonOnPressed(text),
          child: Text(
            text,
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.normal),
          ),
          color: Colors.lightBlueAccent,
          padding: EdgeInsets.all(25.0),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Basic Calculator"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Text(
                  "Kaydedilen sonuçlar: ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 80),
                child: Text(
                  savedOperations = listSavedResults.join(" , "),
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Text(
                  operation,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Text(
                  result,
                  style: TextStyle(fontSize: 32, color: Colors.redAccent),
                ),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
              ),
              Container(
                child: Table(
                  children: [
                    TableRow(children: [
                      for (var item in listFirstRow) bindFlatButton(item)
                    ]),
                    TableRow(children: [
                      for (var item in listSecondRow) bindFlatButton(item)
                    ]),
                    TableRow(children: [
                      for (var item in listThirdRow) bindFlatButton(item)
                    ]),
                    TableRow(children: [
                      for (var item in listFourthRow) bindFlatButton(item)
                    ]),
                    TableRow(children: [
                      for (var item in listFifthRow) bindFlatButton(item)
                    ])
                  ],
                ),
              ),
            ]));
  }
}
