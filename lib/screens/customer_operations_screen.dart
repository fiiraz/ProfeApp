import 'package:flutter/material.dart';

class CustomerOperationsScreen extends StatefulWidget {
  @override
  _CustomerOperationsScreenState createState() =>
      _CustomerOperationsScreenState();
}

class _CustomerOperationsScreenState extends State<CustomerOperationsScreen> {
  @override
  Widget build(BuildContext context) {
    return
        Expanded(
          child: buildPhoneList(),
        );
  }

  ListView buildPhoneList() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  border: new Border.all(width: 1.0, color: Colors.black),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black,
                    blurRadius: 1.0, // has the effect of softening the shadow
                    spreadRadius: 1.0, // has the effect of extending the shadow

                  )
                ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular( 16.0)
                  ),
              ),
              child:
            ListTile(
            title: Text("Deneme"),
            subtitle: Text("Görev Türü: Stand"),
            trailing:
            Container(
              decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                      color: Colors.black,
                      width: 0.8,
                    )
                ),
              ),
              child:
              Padding(padding: EdgeInsets.fromLTRB(4.0, 0, 0, 0),
              child: Column(
                  children: <Widget>[
                  Icon(Icons.timer),
              Text("01.01.2019 - 00:00"),
              ],
            ),
              ),

            ),
          ),);
        });
  }
}
