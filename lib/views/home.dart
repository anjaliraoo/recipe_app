import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/models/recipe_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<RecipeModel> recipes = <RecipeModel>[];
  TextEditingController textEditingController = TextEditingController();
  String applicationId = "eef606a3";
  String applicationKey = "3823b66340441f3cbcd79654ec9095e0";

  getRecipes(String query) async {
    String url =
        "https://api.edamam.com/search?q=$query&app_id=$applicationId&app_key=$applicationKey";

    var response = await http.get(Uri.parse(
        'https://api.edamam.com/search?q=$query&app_id=$applicationId&app_key=$applicationKey'));
    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData["hits"].forEach((element) {
      print(element.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xff213A50), Color(0xff071930)]),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Platform.isIOS ? 60 : 30, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: kIsWeb
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: const [
                    Text(
                      'AppGuy',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Text(
                      'Recipes',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "What will you cook today?",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Just Enter Ingredients you have and we will show the best recipe for you",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: textEditingController,
                          decoration: const InputDecoration(
                            hintText: "Enter Ingredients",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: () {
                          if (textEditingController.text.isNotEmpty) {
                            getRecipes(textEditingController.text);
                            print("jyst");
                          } else {
                            print("don;t");
                          }
                        },
                        child: Container(
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
