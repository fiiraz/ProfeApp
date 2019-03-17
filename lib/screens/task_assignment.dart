import 'package:flutter/material.dart';


class TaskAssignmentScreen extends StatefulWidget {
  @override
  _TaskAssignmentScreenState createState() => _TaskAssignmentScreenState();
}

class _TaskAssignmentScreenState extends State<TaskAssignmentScreen> {
  final formKey = GlobalKey<FormState>();
  String _currencie = null;
  String _category = null;
  List<String> _currencies = List<String>();
  List<String> _categories = List<String>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currencies.addAll(["Şef","option2","option3"]);
    _currencie = _currencies.elementAt(0);
    _categories.addAll(["Soğutucu","option2","option3"]);
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
            onPressed: (){

            },
          ),
        ],
      ),
      body: getForm(),
    );
  }

  Widget getForm(){
    return Form(
      key: formKey,
      child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Company Name:',
              ),
            ),
            FormField(
              builder: (FormFieldState state) {
                return InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Atanacak rol:',
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
                      items: _currencies.map((String dropDownStringItem){
                        return DropdownMenuItem(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String value){
                        _onDropDownItemSelected(value);
                      },
                      value: _currencie,
                    ),
                  ),
                );
              },
            ),
            FormField(
              builder: (FormFieldState state) {
                return InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Atanacak rol:',
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
                        items: _categories.map((String dropDownStringItem){
                          return DropdownMenuItem(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (String value){
                          _onDropDownItemSelectedCat(value);
                        },
                        value: _category,
                      ),
                    ),

                );
              },
            ),

          ],
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String value){
    setState(() {
      this._currencie = value;
    });
  }

  void _onDropDownItemSelectedCat(String value){
    setState(() {
      this._category = value;
    });
  }
}