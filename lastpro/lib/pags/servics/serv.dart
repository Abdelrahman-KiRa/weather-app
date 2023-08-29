import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../result.dart';

// ignore: camel_case_types
class serviceweather {
  String apikay = "b933e506e954451da24122141232001";
  String baseUrl = "http://api.weatherapi.com/v1";
  getweather({required String? search}) async {
    try {
      
      Uri urll = Uri.parse('$baseUrl/forecast.json?key=$apikay&q=$search');
// ignore: non_constant_identifier_names, unused_local_variable
      http.Response Respons = await http.get(urll);
      Map<String, dynamic> res = jsonDecode(Respons.body);
      dynamic wee = res["forecast"]["forecastday"][0]["day"];
      weathermodel todayweather = weathermodel(
          cetyname: res['location']['name'],
          currentdata: res['location']['localtime'],
          maxtemp: wee["maxtemp_c"],
          mintemp: wee["mintemp_c"],
          temp: wee["avgtemp_c"],
          tempstatus: wee["condition"]["text"],
          iconweeather: wee["condition"]["icon"]);
          if(todayweather.cetyname==null)
          {
            search=null;
          }
      return todayweather;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}

// ignore: camel_case_types
class weathermodel {
  String? cetyname;
  String? currentdata;
  double? temp;
  double? maxtemp;
  double? mintemp;
  String? tempstatus;
  String? iconweeather;
  weathermodel.fromjson(dynamic res) {
    dynamic wee = res["forecast"]["forecastday"][0];
    cetyname = res['location']['name'];
    currentdata = res['location']['localtime'];
    maxtemp = wee["maxtemp_c"];
    mintemp = wee["mintemp_c"];
    temp = wee["avgtemp_c"];
    tempstatus = wee["condition"]("text");
    iconweeather = wee["condition"]("icon");
    // iconweeather="https://cdn.weatherapi.com/weather/64x64/night/113.png";
  }

  weathermodel({
    required this.cetyname,
    required this.currentdata,
    required this.maxtemp,
    required this.mintemp,
    required this.temp,
    required this.tempstatus,
    required this.iconweeather,
  });
}

search(dynamic supmit, dynamic context) async {
  serviceweather servv = serviceweather();
  
  try{weathermodel today = await servv.getweather(search: supmit!);
  
  if (today.cetyname != null) {
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => result(
              cetyname: today.cetyname,
              currentdata: today.currentdata,
              iconweeather: today.iconweeather,
              maxtemp: today.maxtemp,
              mintemp: today.mintemp,
              temp: today.temp,
              tempstatus: today.tempstatus,
            )),
      ),
    );
  }}
  catch(e)
  {
    // ignore: avoid_print
    print(e);
  }
  
}
