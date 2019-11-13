import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Avengers Money Tracker',
        // Make all our text default to white
        // and backgrounds default to dark
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: new HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Avengers Money Tracker'),
          backgroundColor: Colors.blueGrey,
        ),
        body: ListView(
          children: <Widget>[
            PersonCard(10),
            PersonCard(11),
            PersonCard(1),
            SizedBox(
              height: 35,
            ),
            PersonCard(6),
            PersonCard(8),
            PersonCard(5),
            SizedBox(
              height: 35,
            ),
            PersonCard(3),
            PersonCard(4),
            PersonCard(0),
            SizedBox(
              height: 35,
            ),
            PersonCard(7),
            PersonCard(2),
            PersonCard(9),
          ],
        ));
  }
}

//Widget _buildList(BuildContext context){
//  return StreamBuilder
//}

class PersonCard extends StatefulWidget {
  final int index;

  PersonCard(this.index);
  @override
  PersonCardState createState() => new PersonCardState();
}

class PersonCardState extends State<PersonCard> {
  int cash = 0;
  String money ='';

  var controller = TextEditingController();

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    String label = '';
    StreamBuilder(
        stream:  Firestore.instance.collection('cashtogive').snapshots(),
        builder: (context, snapshot){
        label = snapshot.data.documents[widget.index]['cash'].toString();
        return null;
    });
    controller.text=label;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          child: StreamBuilder(
        stream: Firestore.instance.collection('cashtogive').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text('Loading..');
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 30, left: 20, bottom: 30),
                  child: Text(snapshot.data.documents[widget.index]['name'])),
              Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: SizedBox(
                    width: 100,
                    child: TextFormField(
                      controller: controller,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(right: 30),
                  child: RaisedButton(
                child: Text('Refresh'),
                color: Colors.orangeAccent,
                onPressed: (){
                          Firestore.instance.runTransaction((transaction) async{
                          DocumentSnapshot freshSnap =
                                await transaction.get(snapshot.data.document.reference);
                           await transaction.update(freshSnap.reference,{
                             'cash':controller.text,
                           });
                        });
                },
              ))
            ],
          );
        },
      )),
    );
  }
}
