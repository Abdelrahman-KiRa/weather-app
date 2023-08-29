// import 'package:flutter/material.dart';
// import 'package:weather/pags/first.dart';
// import 'package:weather/pags/result.dart';
// import 'package:weather/pags/servics/serv.dart';

// // ignore: camel_case_types
// class search extends StatefulWidget {
//   const search({super.key});

//   @override
//   State<search> createState() => _searchState();
// }

// late String onchange;
// late String supmit;

// // ignore: camel_case_types
// class _searchState extends State<search> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextFormField(
//           onChanged: (value) {
//             onchange = value;
//           },
//           onFieldSubmitted: (value) async {
//             supmit = value;
//             serviceweather servv = serviceweather();
//             weathermodel today = await servv.getweather(search: supmit);
//             // ignore: use_build_context_synchronously
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: ((context) => result(
//                       cetyname: today.cetyname,
//                       currentdata: today.currentdata,
//                       iconweeather: today.iconweeather,
//                       maxtemp: today.maxtemp,
//                       mintemp: today.mintemp,
//                       temp: today.temp,
//                       tempstatus: today.tempstatus,
//                     )),
//               ),
//             );
           
//             print(today.currentdata);
//           },
//           autofocus: true,
//           cursorColor: Colors.white,
//           style: const TextStyle(
//             //  color: Color.fromARGB(255, 255, 255, 255),
//             fontSize: 20,
//           ),
//           decoration: const InputDecoration(
//             hintText: "search",
//             focusedBorder: UnderlineInputBorder(
//                 //Borders when a TextField is in focus
//                 borderSide: BorderSide(color: Colors.white)),
//             hintStyle: TextStyle(
//               //Style of hintText
//               color: Colors.white60,
//               fontSize: 20,
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               move(context);
//             },
//             icon: const Icon(Icons.search),
//           ),
//         ],
//       ),
//     );
//   }
// }

// move(context) {
//   serviceweather servv = serviceweather();
//   servv.getweather(search: supmit);
//   weathermodel today = servv.getweather(search: supmit);
//   Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: ((context) => result(
//                 cetyname: today.cetyname,
//                 currentdata: today.currentdata,
//                 iconweeather: today.iconweeather,
//                 maxtemp: today.maxtemp,
//                 mintemp: today.mintemp,
//                 temp: today.temp,
//                 tempstatus: today.tempstatus,
//               ))));
// }
