import 'package:flutter/material.dart';
import 'package:profe_app/screens/customer_operations_screen.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fancy Bottom Navigation"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      floatingActionButton:
      FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/assignment'),
        tooltip: 'Increment',
        child: new Icon(Icons.add),
        backgroundColor: Colors.blue[900],
      ),
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: Colors.white,
        barBackgroundColor: Colors.blue[900],
        textColor: Colors.white,
        activeIconColor: Colors.blue[900],
        inactiveIconColor: Colors.white,
        tabs: [
          TabData(
            iconData: Icons.airplanemode_active,
            title: "",

          ),
          TabData(
            iconData: Icons.call_split,
            title: "Görev Atama",
          ),
          TabData(iconData: Icons.check, title: "")
        ],
        initialSelection: 0,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return Center(
          child: Text("First Screen"),
        );
      case 1:
        return CustomerOperationsScreen();
      default:
        return Center(
          child: Text("Third Screen"),
        );
    }
  }
}