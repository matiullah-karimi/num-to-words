import 'package:flutter/material.dart';
import 'package:numbers_to_words/numbers_to_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String number = '';
  String dariNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Enter the number'),
                keyboardType: TextInputType.number,
                maxLength: 12,
                onChanged: (s) {
                  setState(() {
                    if (s.isEmpty) {
                      number = "";
                      dariNumber = "";
                      return;
                    }
                    number = NumberToWords.convert(int.parse(s), "en");
                    dariNumber = NumberToWords.convert(int.parse(s), "da");
                  });
                },
              ),
              Card(
                color: Colors.blue,
                elevation: 3.0,
                child: Container(
                    alignment: Alignment.centerRight,
                    width: double.infinity,
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '$dariNumber',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                color: Colors.blue,
                elevation: 3.0,
                child: Container(
                    alignment: Alignment.centerRight,
                    width: double.infinity,
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '$number',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
