import 'package:flutter/material.dart';
import 'package:profe_app/screens/customer_operations_screen.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

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
        title: Text("Profe App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(_blur == null ? Icons.blur_off : Icons.blur_on),
            onPressed: () {
              setState(() {
                _blur = _nextBlur();
              });
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
        return Column(
          children: <Widget>[
            _buildCard(
              config: CustomConfig(
                colors: [
                  Colors.white70,
                  Colors.white54,
                  Colors.white30,
                  Colors.white24,
                ],
                durations: [32000, 21000, 18000, 5000],
                heightPercentages: [0.75, 0.76, 0.78, 0.81],
                blur: _blur,
              ),
              backgroundColor: Colors.blue[900],
            ),
            Center(
              child: Text("First Screen"),
            ),
          ],
        );
      case 1:
        return Column(
          children: <Widget>[
            _buildCard(
              config: CustomConfig(
                colors: [
                  Colors.white70,
                  Colors.white54,
                  Colors.white30,
                  Colors.white24,
                ],
                durations: [32000, 21000, 18000, 5000],
                heightPercentages: [0.75, 0.76, 0.78, 0.81],
                blur: _blur,
              ),
              backgroundColor: Colors.blue[900],
            ),
            CustomerOperationsScreen(),
          ],
        );

      default:
        return Column(
          children: <Widget>[
            _buildCard(
              config: CustomConfig(
                colors: [
                  Colors.white70,
                  Colors.white54,
                  Colors.white30,
                  Colors.white24,
                ],
                durations: [32000, 21000, 18000, 5000],
                heightPercentages: [0.75, 0.76, 0.78, 0.81],
                blur: _blur,
              ),
              backgroundColor: Colors.blue[900],
            ),
            Center(
              child: Text("Third Screen"),
            ),
          ],
        );
    }
  }

  _buildCard({Config config, Color backgroundColor = Colors.transparent}) {
    return Container(
      height: 80.0,
      width: double.infinity,
      child: WaveWidget(
        config: config,
        backgroundColor: backgroundColor,
        size: Size(double.infinity, double.infinity),
        waveAmplitude: 0,
      ),
    );
  }

  MaskFilter _blur;
  final List<MaskFilter> _blurs = [
    null,
    MaskFilter.blur(BlurStyle.normal, 10.0),
    MaskFilter.blur(BlurStyle.inner, 10.0),
    MaskFilter.blur(BlurStyle.outer, 10.0),
    MaskFilter.blur(BlurStyle.solid, 16.0),
  ];
  int _blurIndex = 0;

  MaskFilter _nextBlur() {
    if (_blurIndex == _blurs.length - 1) {
      _blurIndex = 0;
    } else {
      _blurIndex = _blurIndex + 1;
    }
    _blur = _blurs[_blurIndex];
    return _blurs[_blurIndex];
  }
}
