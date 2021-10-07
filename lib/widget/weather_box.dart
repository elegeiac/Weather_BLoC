import 'package:flutter/material.dart';
import 'package:weather_bloc/model/model.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/api.dart';

class WeatherBox extends StatelessWidget {
  final Weather weatherinfo;
  const WeatherBox({Key? key, required this.weatherinfo});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.brown.withOpacity(0.8),
            Color(0x05E0E9).withOpacity(0.3)
          ], begin: Alignment.bottomRight, end: Alignment.topLeft),
        ),
        child: Column(
          children: [
            Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ClipRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Container(
                          width: 320,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.8)),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.8),
                                    Colors.white.withOpacity(0.2)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)),
                          child: Column(children: [
                            Center(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Text(
                                  '${weatherinfo.location?.name}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'Beon',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              height: 64,
                              width: 64,
                              child: Image.network(
                                  'http:${weatherinfo.current?.condition?.icon}'),
                              // child: Image(
                              //     image: AssetImage(
                              //         "static/img.jpg"))
                            ),
                            Center(
                              child: Container(
                                child: Text(
                                    '${weatherinfo.current?.condition?.text}',
                                    style: TextStyle(
                                        fontFamily: 'Beon',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Center(
                              child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text('Country:',
                                      style: TextStyle(
                                          fontFamily: 'Cinzel',
                                          fontSize: 18))),
                            ),
                            Center(
                              child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Center(
                                    child: Text(
                                        '${weatherinfo.location?.country}',
                                        style: TextStyle(
                                            fontFamily: 'Beon',
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  )),
                            ),
                            Center(
                              child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text('Temperature:',
                                      style: TextStyle(
                                          fontFamily: 'Cinzel', fontSize: 17))),
                            ),
                            Center(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text(
                                    '${weatherinfo.current?.tempC}\u00B0C',
                                    style: TextStyle(
                                        fontFamily: 'Beon',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ]))),
                )),
            Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ClipRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Container(
                          width: 320,
                          height: 340,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.8)),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.8),
                                    Colors.white.withOpacity(0.2)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text(
                                'Details',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Cinzel',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(50, 30, 0, 0),
                                      child: Column(children: [
                                        Text('Humidity',
                                            style: TextStyle(
                                                fontFamily: 'Cinzel',
                                                fontSize: 17)),
                                        Text('${weatherinfo.current?.humidity}',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontFamily: 'Beon',
                                                fontWeight: FontWeight.bold))
                                      ]),
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      padding:
                                          EdgeInsets.fromLTRB(80, 30, 0, 0),
                                      child: Column(children: [
                                        Text('UV',
                                            style: TextStyle(
                                                fontFamily: 'Cinzel',
                                                fontSize: 17)),
                                        Text('${weatherinfo.current?.uv}',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontFamily: 'Beon',
                                                fontWeight: FontWeight.bold))
                                      ]),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(50, 40, 0, 0),
                                      child: Column(children: [
                                        Text('Visibility',
                                            style: TextStyle(
                                                fontFamily: 'Cinzel',
                                                fontSize: 17)),
                                        Text('${weatherinfo.current?.visKm} km',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontFamily: 'Beon',
                                                fontWeight: FontWeight.bold))
                                      ]),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(35, 40, 0, 0),
                                      child: Column(children: [
                                        Text('Percipitation',
                                            style: TextStyle(
                                                fontFamily: 'Cinzel',
                                                fontSize: 17)),
                                        Text(
                                            '${weatherinfo.current?.precipMm} mm',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontFamily: 'Beon',
                                                fontWeight: FontWeight.bold))
                                      ]),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(50, 40, 0, 0),
                                      child: Column(children: [
                                        Text('SSW Wind',
                                            style: TextStyle(
                                                fontFamily: 'Cinzel',
                                                fontSize: 17)),
                                        Text(
                                            '${weatherinfo.current?.gustKph} km/h',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontFamily: 'Beon',
                                                fontWeight: FontWeight.bold))
                                      ]),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(60, 40, 0, 0),
                                      child: Column(children: [
                                        Text('Cloud',
                                            style: TextStyle(
                                                fontFamily: 'Cinzel',
                                                fontSize: 17)),
                                        Text('${weatherinfo.current?.cloud} %',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontFamily: 'Beon',
                                                fontWeight: FontWeight.bold))
                                      ]),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ]))),
                ))
          ],
        ));
  }
}
