// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:weather/pags/servics/serv.dart';

// ignore: camel_case_types
class mainpadg extends StatefulWidget {
  const mainpadg({super.key});

  @override
  State<mainpadg> createState() => _mainpadgState();
}

String? onchange;
String? supmit;
String? currentsearch;

bool searchh = false;

// ignore: camel_case_types
class _mainpadgState extends State<mainpadg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchh
          ? AppBar(
              leading: IconButton(
                  onPressed: () {
                    setState(() {
                      searchh = false;
                    
                    });
                  },
                  icon: const Icon(Icons.arrow_back)),
              title: TextFormField(
                onChanged: (value) {
                  onchange = value;
                },
                onFieldSubmitted: (value) {
                  supmit = value;

                  if (onchange != null) {
                    currentsearch = supmit;
                    search(supmit, context);
                    supmit = null;
                  }
                },
                autofocus: true,
                cursorColor: Colors.white,
                style: const TextStyle(
                  //  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                  hintText: "search",
                  focusedBorder: UnderlineInputBorder(
                      //Borders when a TextField is in focus
                      borderSide: BorderSide(color: Colors.white)),
                  hintStyle: TextStyle(
                    //Style of hintText
                    color: Colors.white60,
                    fontSize: 20,
                  ),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    if (onchange != null) {
                      currentsearch = onchange;
                      search(onchange, context);
                      onchange = null;
                    }
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            )
          : AppBar(
              title: const Text("Weather"),
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      searchh ? searchh = false : searchh = true;
                    });

                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: ((context) =>  const search())));
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
      body: searchh
          ? null
          : const Center(
              child: Text(
                "Enter Your City ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
    );
  }
}
