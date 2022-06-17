import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController(text: "");
  dynamic result = "";
  leap() {
    int year = int.parse(controller.text);
    setState(() {
      if (year % 4 == 0) {
        result = '${controller.text} is a leap year';
      } else if (year % 4 != 0) {
        result = '${controller.text} is not a leap year';
      }
    });
  }

  clear() {
    setState(() {
      controller.text = "";
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: const Text("Leap year"),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Enter a year to know it is leap year or not?",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$result  ",
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter a year",
                    labelText: "Enter a year",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.cyan,
                  onPressed: leap,
                  child: const Text("Go!"),
                ),
              ),
              ElevatedButton(
                onPressed: clear,
                child: const Text("clear"),
              ),
            ],
          )),
    );
  }
}
