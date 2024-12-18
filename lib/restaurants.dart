import 'package:flutter/material.dart';
import 'package:projecse2food/mainwidget.dart';

class RestaurantsApp extends StatefulWidget {
  const RestaurantsApp({super.key});

  @override
  State<RestaurantsApp> createState() => _RestaurantsAppState();
}

class _RestaurantsAppState extends State<RestaurantsApp> {
  @override
  Widget build(BuildContext context) {
    // الحسن رائد علي
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            "Welcome",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.asset(
                'images/Screenshot 2024-12-03 091716.png',
              ),
              SizedBox(height: 15),
              Image.asset(
                'images/{9BF1AC47-8B9E-4211-9018-CF12C58FE1A2}.png',
              ),
              SizedBox(height: 18),
              // احمد زيان علي
              Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 2, 19, 145),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Mainwidget()));
                  },
                  child: Text(
                    "START !!",
                    style: TextStyle(
                        fontSize: 30.5,
                        color: Color.fromARGB(255, 255, 253, 253),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
