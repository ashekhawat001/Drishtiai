import 'dart:convert';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:geolocator/geolocator.dart';

class NewPagen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Center(
          child: Column(
            children: [
              Lottie.asset(
                'assets/miss.json',
                width: 350,
                height: 350,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 0, 15.0, 15.0),
                child: Text(
                  'Child not found in our database.\nBut if they need help reach out below.',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 60),
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
        'Name': 'Aditya',
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
