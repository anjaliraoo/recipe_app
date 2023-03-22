import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeView extends StatefulWidget {
  //const RecipeView({super.key});

  final String postUrl;
  RecipeView({this.postUrl = ""});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  String finalUrl = "";
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.postUrl.contains("http://")) {
      finalUrl = widget.postUrl.replaceAll("http://", "https://");
    } else {
      finalUrl = widget.postUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.black54,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white30, Colors.white],
                      begin: FractionalOffset.topRight,
                      end: FractionalOffset.bottomLeft)),
              padding: EdgeInsets.only(
                  top: Platform.isIOS ? 60 : 30,
                  right: 24,
                  left: 24,
                  bottom: 16),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment:
                    kIsWeb ? MainAxisAlignment.start : MainAxisAlignment.center,
                children: const [
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
            Container(
              height: MediaQuery.of(context).size.height -
                  (Platform.isIOS ? 104 : 30),
              width: MediaQuery.of(context).size.width,
              child: WebView(
                  onPageFinished: (val) {
                    print(val);
                  },
                  JavaScriptMode: JavaScriptMode.unrestricted,
                  initialUrl: finalUrl,
                  onWebViewCreated: (WebViewController webViewController) {
                    setState(() {
                      _controller.complete(webViewController);
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
