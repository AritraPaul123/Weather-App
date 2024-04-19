import 'dart:math';
import 'dart:ui';
import 'package:weatherapp02/Activity/worker.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'loading.dart';
import 'package:dynamic_weather_icons/dynamic_weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchcontroller= new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Init state called");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set state called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget disposed");
  }

  @override
  Widget build(BuildContext context) {
    String replacement="";
    var city_list = [
      "Mumbai",
      "Kolkata",
      "Howrah",
      "Delhi",
      "Darjiling",
      "New York",
      "Los Angeles",
      "Chennai"
    ];
    final _random = new Random();
    var city_names = city_list[_random.nextInt(city_list.length)];
    dynamic weather_info = ModalRoute.of(context)?.settings.arguments;
    String temp=(weather_info["temp_home"]);
    String weathericon=("https:"+weather_info["icon_home"]);
    String locationcity=(weather_info["location_home"]);
    String humidityd=(weather_info["humidity_home"]);
    String wspeedd=(weather_info["wspeed_home"]);
    String desd=(weather_info["des_home"]);
    print(locationcity);
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child:  AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.red],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight)),
              ),
            )),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.9],
                colors: [
                  Colors.lightBlueAccent,
                  Colors.orangeAccent,
                ],
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black12,
                  ),
                  child: Row(
                      children: [
                    Expanded(
                      child: Container(
                        child: TextField(
          
                          controller: searchcontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search $city_names",
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: GestureDetector(
                        onTap: () {
                          if((searchcontroller.text).replaceFirst(" ", "")!="") {
                            Navigator.pushReplacementNamed(
                                context, "/loading", arguments: {
                              "searchtext": searchcontroller.text,
                            }
                            );
                          }
                        },
                        child: Container(
                          child: Icon(
                            Icons.search,
                            color: Colors.lightBlue[900],
                            size: 38,
                          ),
                          margin: EdgeInsets.fromLTRB(3, 7, 11, 7),
                        ),
                      ),
                    ),
          
                  ]),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.4),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        padding: EdgeInsets.all(13),
                        child: Row(
                          children: [
                                Image.network("https://cdn.weatherapi.com/weather/64x64/night/143.png"),
                            Column(
                                children: [
                                  Text("$desd",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                                  Text("In $locationcity",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                                ],
                            )
                          ],
                        )
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.4),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcon.getIcon("wi-thermometer")),
                            SizedBox(height: 40,),
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("$temp",style: TextStyle(fontSize: 90),),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 48),
                                    child: Icon(WeatherIcon.getIcon("wi-celsius",),size: 47,),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.4),
                        ),
                        margin: EdgeInsets.fromLTRB(15, 0, 8, 0),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcon.getIcon("wi-strong-wind")),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("$wspeedd",style: TextStyle(fontSize: 35),),
                            Text("KM/H",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),)
                            
                          ],
                        ),
                        height: 170,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.4),
                        ),
                        margin: EdgeInsets.fromLTRB(8, 0, 15, 0),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcon.getIcon("wi-humidity")),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("$humidityd",style: TextStyle(fontSize: 35),),
                            Text("%",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600),)
          
                          ],
                        ),
                        height: 170,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "MADE BY ARITRA PAUL",
                            style: TextStyle(fontSize: 11),
                          ),
                          Text(
                            "DATA PROVIDED BY WEATHERAPI.COM",
                            style: TextStyle(fontSize: 11),
                          ),
                        ]))
              ],
            ),
          )),
        ));
  }
}
