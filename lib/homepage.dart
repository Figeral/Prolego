import 'package:prolego/body.dart';
import 'package:flutter/material.dart';
import 'package:prolego/controller/api_fetcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  bool isClicked = true;
  bool isTextFieldFocus = false;
  static final _inputController = TextEditingController();
  String _inputTextField = "douala";

  void setInputController(String text) {
    _inputController.text = text;
  }

  String getInputController() {
    return _inputController.text;
  }

  @override
  void dispose() {
    super.dispose();
    return _inputController.dispose();
  }

  HomePageState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(137, 177, 175, 175),
          title: const Text("Prolego",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: "Poppins")),
          actions: [
            SizedBox(
              height: 30,
              width: 140,
              child: TextField(
                controller: _inputController,
                decoration: InputDecoration(
                  hintText: "City",
                  suffixIcon: isTextFieldFocus
                      ? IconButton(
                          onPressed: () => _inputController.clear(),
                          icon: const Icon(Icons.clear))
                      : null,
                ),
                onChanged: (value) {
                  setState(() => isTextFieldFocus = true);
                },
                onEditingComplete: () {
                  setState(() => isTextFieldFocus = true);
                },
                onTap: () {
                  setState(() {
                    isTextFieldFocus = true;
                  });
                },
              ),
            ),
            //On click send input data to the fetch api controller
            IconButton(
                onPressed: () {
                  setState(() {
                    isClicked = true;
                    _inputTextField = getInputController();
                    isClicked ? WeatherApi(isClicked) : null;
                  });
                  print("Entered value :$_inputTextField");
                },
                icon: const Icon(Icons.search)),
          ],
        ),
        body: Body(
          value: _inputTextField,
        ));
  }
}
