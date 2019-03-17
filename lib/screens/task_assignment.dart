import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

class TaskAssignmentScreen extends StatefulWidget {
  @override
  _TaskAssignmentScreenState createState() => _TaskAssignmentScreenState();
}

class _TaskAssignmentScreenState extends State<TaskAssignmentScreen> {
  int selectedRadio;
  File _image;
  DateTime _date = DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();
  final formKey = GlobalKey<FormState>();
  String _currencie = "";
  String _category = "";
  List<String> _currencies = List<String>();
  List<String> _categories = List<String>();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2016),
        lastDate: DateTime(2020));
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currencies.addAll(["Şef", "option2", "option3"]);
    _currencie = _currencies.elementAt(0);
    _categories.addAll(["Soğutucu", "option2", "option3"]);
    _category = _categories.elementAt(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TaskAssignmentScreen"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: getForm(),
    );
  }

  Widget getForm() {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: new Border.all(width: 1.0, color: Colors.blue),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.blue,
                    blurRadius: 1.0, // has the effect of softening the shadow
                    spreadRadius: 1.0, // has the effect of extending the shadow
                  )
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0)),
              ),
              child: TextField(
                decoration: InputDecoration(),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: new Border.all(width: 1.0, color: Colors.blue),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.blue,
                    blurRadius: 1.0, // has the effect of softening the shadow
                    spreadRadius: 1.0, // has the effect of extending the shadow
                  )
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0)),
              ),
              child: FormField(
                builder: (FormFieldState state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsetsDirectional.only(
                        top: 12.0,
                        bottom: 7.0,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        iconSize: 24.0,
                        isExpanded: true,
                        isDense: true,
                        items: _currencies.map((String dropDownStringItem) {
                          return DropdownMenuItem(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (String value) {
                          _onDropDownItemSelected(value);
                        },
                        value: _currencie,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: new Border.all(width: 1.0, color: Colors.blue),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.blue,
                    blurRadius: 1.0, // has the effect of softening the shadow
                    spreadRadius: 1.0, // has the effect of extending the shadow
                  )
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0)),
              ),
              child: FormField(
                builder: (FormFieldState state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsetsDirectional.only(
                        top: 12.0,
                        bottom: 7.0,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        iconSize: 24.0,
                        isExpanded: true,
                        isDense: true,
                        items: _categories.map((String dropDownStringItem) {
                          return DropdownMenuItem(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (String value) {
                          _onDropDownItemSelectedCat(value);
                        },
                        value: _category,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: new Border.all(width: 1.0, color: Colors.blue),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.blue,
                    blurRadius: 1.0, // has the effect of softening the shadow
                    spreadRadius: 1.0, // has the effect of extending the shadow
                  )
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0)),
              ),
              alignment: Alignment(-1, 0),
              child: SizedBox(
                width: double.infinity,
                child: FlatButton(
                  child: Text(
                    _date.day.toString() +
                        "/" +
                        _date.month.toString() +
                        "/" +
                        _date.year.toString(),
                    textAlign: TextAlign.left,
                  ),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: new Border.all(width: 1.0, color: Colors.blue),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.blue,
                    blurRadius: 1.0, // has the effect of softening the shadow
                    spreadRadius: 1.0, // has the effect of extending the shadow
                  )
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0)),
              ),
              alignment: Alignment(-1, 0),
              child: SizedBox(
                width: double.infinity,
                child: FlatButton(
                  child: Text(
                    "Image Picker",
                    textAlign: TextAlign.left,
                  ),
                  onPressed: () {
                    getImage();
                  },
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: new Border.all(width: 1.0, color: Colors.blue),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.blue,
                    blurRadius: 1.0, // has the effect of softening the shadow
                    spreadRadius: 1.0, // has the effect of extending the shadow
                  )
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0)),
              ),
              alignment: Alignment(-1, 0),
              child: Row(
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(val);
                    },
                  ),
                  Text("Hiçbiri"),
                  Radio(
                    value: 2,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(val);
                    },
                  ),
                  Text("Fotoğraf"),
                  Radio(
                    value: 3,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(val);
                    },
                  ),
                  Text("Video"),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                ),
                color: Colors.blue[900],
                textColor: Colors.white,
                child: Text("GÖNDER"),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  void _onDropDownItemSelected(String value) {
    setState(() {
      this._currencie = value;
    });
  }

  void _onDropDownItemSelectedCat(String value) {
    setState(() {
      this._category = value;
    });
  }
}
