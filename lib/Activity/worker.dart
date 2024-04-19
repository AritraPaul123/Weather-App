import 'package:http/http.dart' as http;
import 'dart:convert';
class Worker {
  dynamic location;
  Worker({required this.location}){
  location=this.location;
}
  dynamic temp_c,w_condition,wind_kph,w_humidity,current_condition,icon,city,des;
  Future <void> getData() async {

    //getting values
    try {
      dynamic url = "http://api.weatherapi.com/v1/current.json?key=d570b3d068824e898f4120128241401&q=$location&aqi=yes";
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      var data = jsonDecode(response.body);
      Map current_weather = data["current"];
      double getTemp_cel = (current_weather["temp_c"]);
      current_condition=current_weather["condition"];
      Map location_w=data["location"];
      city=location_w["name"];
      //creating secondary variables
      des=current_condition["text"];
      icon=current_condition["icon"];
      temp_c=getTemp_cel.toString();
      w_condition=current_condition["text"];
      wind_kph=current_weather["wind_kph"].toString();
      w_humidity=current_weather["humidity"].toString();

    }catch(e){
      temp_c="NA";
      w_condition="NA";
      wind_kph="NA";
      w_humidity="NA";
      current_condition="NA";
      icon="NA";
      city="NA";
      des="NA";
    }
    //assigning values


  }

}