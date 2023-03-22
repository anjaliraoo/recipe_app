import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class RecipeView extends StatefulWidget {
  //const RecipeView({super.key});

  final String postUrl;
  RecipeView({this.postUrl=""});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row (
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
        ),
        ],
      ),
    );
  }
}
