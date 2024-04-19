import 'package:flutter/material.dart';
import 'worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  dynamic temp_l,condition_l,wspeed_l,humidity_l,icon_l,city_l,des_l;
  void startapp(String city) async{
    Worker instance=Worker(location: city);
    await instance.getData();
    temp_l=instance.temp_c;
    condition_l=instance.w_condition;
    wspeed_l=instance.wind_kph;
    humidity_l=instance.w_humidity;
    icon_l=instance.icon;
    city_l=instance.city;
    des_l=instance.des;
    Future.delayed(Duration(milliseconds: 2500),(){
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "temp_home": temp_l,
        "condition_home": condition_l,
        "wspeed_home": wspeed_l,
        "humidity_home": humidity_l,
        "icon_home": icon_l,
        "location_home": city_l,
        "des_home": des_l,

      });
    });
    }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic city_name="Kolkata";
    dynamic city_lmap=ModalRoute.of(context)?.settings.arguments;
    if(city_lmap!=null) {
       city_name = (city_lmap["searchtext"]);
    }
    startapp(city_name);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 250,),
              Image.asset("images/weatherappimage.png",height: 200,width: 200,),
              SizedBox(height: 20,),
              Text("WEATHER APP",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              Text("MADE BY ARITRA PAUL",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500)),
              SizedBox(height: 10,),
          SpinKitWave(
            color: Colors.white,
            size: 50.0,
          ),

            ],
          ),
        ),
      ),
    backgroundColor: Colors.lightBlueAccent,
    );
  }
}


