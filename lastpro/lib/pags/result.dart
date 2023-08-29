// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:weather/pags/first.dart';

// ignore: camel_case_types, must_be_immutable
class result extends StatefulWidget {
  result({
    super.key,
    required this.cetyname,
    required this.currentdata,
    required this.maxtemp,
    required this.mintemp,
    required this.temp,
    required this.tempstatus,
    required this.iconweeather,
  });
  String? cetyname;
  String? currentdata;
  double? temp;
  double? maxtemp;
  double? mintemp;
  String? tempstatus;
  String? iconweeather;

  @override
  State<result> createState() => _resultState();
}

// ignore: camel_case_types
class _resultState extends State<result> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: themecolor("${widget.tempstatus}")),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("weaher result"),
          actions: [
            IconButton(
              onPressed: () {
                //  print("https://${widget.iconweeather}");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => mainpadg()));
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              themecolor("${widget.tempstatus}"),
              themecolor("${widget.tempstatus}")[0300],
              // themecolor("${widget.tempstatus}")[300],
              // themecolor("${widget.tempstatus}")[200],
              // themecolor("${widget.tempstatus}")[100],
              themecolor("${widget.tempstatus}")[100],
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(
                flex: 3,
              ),
              Text(
                "${widget.cetyname}",
                // "tanta",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${widget.currentdata}",
                //      "22:22",
                style: TextStyle(fontSize: 15),
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: NetworkImage("https:${widget.iconweeather}"),
                    // height: 150,
                    // width: 150,
                  ),
                  //   Image(
                  //   image: NetworkImage("https://cdn.weatherapi.com/weather/64x64/night/113.png"),

                  // ),
                  //   Image.asset("assets/images/clear.png"),
                  Text(
                    "${widget.temp}",
                    //  "23",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  Column(
                    children: [
                      Text(
                        "Max: ${widget.maxtemp}",
                        // "33"
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        "Min: ${widget.mintemp}",
                        // "33"
                      ),
                    ],
                  )
                ],
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                "${widget.tempstatus}",
                //"cold",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Spacer(
                flex: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}

themecolor(String weaherstatus) {
  if (weaherstatus == "Sunny" || weaherstatus == "Clear") {
    return (Colors.orange);
  } else if (weaherstatus == "Overcast" ||
      weaherstatus == "Cloudy" ||
      weaherstatus == "Partly Cloudy") {
    return Colors.blue;
  } else if (weaherstatus == "Mist") {
    return Colors.blueGrey;
  } else if (weaherstatus == "Patchy sleet nearby" ||
      weaherstatus == "Patchy snow nearby" ||
      weaherstatus == "Patchy rain nearby") {
    return Colors.blue;
  }
  return Colors.blue;
}
