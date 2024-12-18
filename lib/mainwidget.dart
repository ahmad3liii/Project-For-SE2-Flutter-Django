import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Mainwidget extends StatelessWidget {
  const Mainwidget({super.key});

  @override
  Widget build(BuildContext context) {
    // احمد زيان علي
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 131, 166, 206),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 30, 76),
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
        padding: const EdgeInsets.all(8.0),
        // الحسن رائد علي  , احمد زيان علي
        child: FutureBuilder<List<Food>>(
          future: fetchFoods(), // Fetching multiple foods
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No data available.'));
            } else {
              final foods = snapshot.data!;
              // الحسن رائد علي

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 180,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: foods.length, // Set the item count based on the data
                itemBuilder: (context, index) {
                  final food = foods[index];
                  return Card(
                    elevation: 30,
                    shadowColor: const Color.fromARGB(255, 14, 6, 95),
                    color: const Color.fromARGB(255, 38, 65, 94),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      //احمد زيان علي
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name: ${food.name}',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'ID: ${food.id}',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Desc: ${food.description}',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Price: ${food.price} S.P',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

// احمد زيان علي
Future<List<Food>> fetchFoods() async {
  final response = await http.get(Uri.parse(
      "http://127.0.0.1:8000/restaurantsprices/allprices/?format=json"));

  if (response.statusCode == 200) {
    // Decode the response and map it to a list of Food objects
    List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((json) => Food.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load foods');
  }
}

// الحسن رائد علي
class Food {
  String? name;
  int? id;
  String? description;
  int? price;

  Food({this.name, this.id, this.description, this.price});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name'],
      id: json['id'],
      description: json['description'],
      price: json['price'],
    );
  }
// الحسن رائد علي  , احمد زيان علي
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'description': description,
      'price': price,
    };
  }
}
