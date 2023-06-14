import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:geolocator/geolocator.dart';

class NewPageg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset('assets/govind.jpg'),
                  Positioned(
                    bottom: 20, // adjust the position as needed
                    left: 20, // adjust the position as needed
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        'Govind, 21M',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 20, 12.0, 15.0),
                child: Text(
                  'This Child has been reported missing from Delhi, 2 days ago',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: dbsave,
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 80,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 191, 191, 191),
                        blurRadius: 5.0, // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
                        offset: Offset(
                          5.0, // Move to right 5  horizontally
                          5.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.local_police_outlined),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Notify Authorities',
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => MapsLauncher.launchQuery('Police Station Near Me'),
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 80,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 191, 191, 191),
                        blurRadius: 5.0, // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
                        offset: Offset(
                          5.0, // Move to right 5  horizontally
                          5.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.pin_drop_outlined),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Nearby Police Station',
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  String telephoneNumber = '1098';
                  String telephoneUrl = "tel:$telephoneNumber";
                  // ignore: deprecated_member_use
                  if (await canLaunch(telephoneUrl)) {
                    // ignore: deprecated_member_use
                    await launch(telephoneUrl);
                  } else {
                    throw "Error occured trying to call that number.";
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 80,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 191, 191, 191),
                        blurRadius: 5.0, // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
                        offset: Offset(
                          5.0, // Move to right 5  horizontally
                          5.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.call_outlined),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Call Childline 1098',
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  dbsave() async {
    final url =
        'https://admin.memberstack.com/members/mem_clfpyslpa01u60ukufr4335rf';
    final apiKey = '';
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final data = jsonEncode({
      'json': {
        'Name': 'Govind',
        'Location': position.toString(),
        'Time': position.timestamp.toString()
      }
    });
    final response = await http.patch(Uri.parse(url),
        headers: {'x-api-key': apiKey, 'Content-Type': 'application/json'},
        body: data);
    if (response.statusCode == 200) {
      print('Patch request successful');
      Fluttertoast.showToast(
        msg: "Message sent successfully",
        toastLength: Toast.LENGTH_SHORT,
      );
    } else {
      print('Error: ${response.statusCode}');
    }
  }
}
