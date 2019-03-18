import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

buildCart(context) {
  return _buildCard(
    config: CustomConfig(
      colors: [
        Colors.white70,
        Colors.white54,
        Colors.white30,
        Colors.white24,
      ],
      durations: [32000, 21000, 18000, 5000],
      heightPercentages: [0.75, 0.76, 0.78, 0.81],
      blur: blur,
    ),
    backgroundColor: Colors.blue[900],
    context: context,
  );
}

_buildCard(
    {Config config, Color backgroundColor = Colors.transparent, context}) {
  return Container(
    height: 80.0,
    width: double.infinity,
    child: Stack(
      children: <Widget>[
        Container(
          height: 80,
          child: WaveWidget(
            config: config,
            backgroundColor: backgroundColor,
            size: Size(double.infinity, double.infinity),
            waveAmplitude: 0,
          ),
        ),
        Positioned(
          top: 15,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text("T3",style: TextStyle(color: Colors.blue[900]),),
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "5003612 - KÖŞEM BÜFE-VEDAT KARATAŞ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "BAKKAL(<50M2)",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "SERDİVAN / SAKARYA",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

MaskFilter blur;
final List<MaskFilter> blurs = [
  null,
  MaskFilter.blur(BlurStyle.normal, 10.0),
  MaskFilter.blur(BlurStyle.inner, 10.0),
  MaskFilter.blur(BlurStyle.outer, 10.0),
  MaskFilter.blur(BlurStyle.solid, 16.0),
];
int _blurIndex = 0;

MaskFilter nextBlur() {
  if (_blurIndex == blurs.length - 1) {
    _blurIndex = 0;
  } else {
    _blurIndex = _blurIndex + 1;
  }
  blur = blurs[_blurIndex];
  return blurs[_blurIndex];
}
