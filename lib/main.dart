import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Avengers Money Tracker',
        // Make all our text default to white
        // and backgrounds default to dark
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Avengers Money Tracker'),
            backgroundColor: Colors.blueGrey,
          ),
          body: ListView(
            children: <Widget>[
              PersonCard(),
              PersonCard(),
              PersonCard(),
              SizedBox(
                height: 35,
              ),
              PersonCard(),
              PersonCard(),
              PersonCard(),
              SizedBox(
                height: 35,
              ),
              PersonCard(),
              PersonCard(),
              PersonCard(),
              SizedBox(
                height: 35,
              ),
              PersonCard(),
              PersonCard(),
              PersonCard(),
            ],
          ),
        ));
  }
}

Widget _buildList(BuildContext context){
  return StreamBuilder
}

class PersonCard extends StatefulWidget {
//  final String text;
//
//  PersonCard(this.text);
  @override
  PersonCardState createState() => new PersonCardState();
}

class PersonCardState extends State<PersonCard> {

  int cash =0;

  @override
  Widget build(BuildContext context) {
        return Card(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 20, bottom: 30),
                  child: Text(
                    snapshot.data.documents['name'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: SizedBox(
                      width: 100,
                      child: TextFormField(
                        initialValue: snapshot.data.documents['cash'],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontWeight: FontWeight.bold),

                      ),
                    ))
              ],
            ),
          ),);
      },
//
    );
    }
  }

