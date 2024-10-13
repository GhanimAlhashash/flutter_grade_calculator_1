import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String gradeState(double grade) {
    if (grade >= 90) {
      return 'A';
    } else if (grade >= 80 && grade < 90) {
      return 'B';
    } else if (grade >= 70 && grade < 80) {
      return 'C';
    } else if (grade >= 60 && grade < 70) {
      return 'D';
    } else {
      return "F";
    }
  }

  final gradeController = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Grade Calculator"),
          backgroundColor: Colors.pinkAccent[200],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(30),
                child: TextField(
                  controller: gradeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Grade",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              if (result.isNotEmpty) Container(height: 30),
              Container(
                width: 150,
                height: 50,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Colors.pinkAccent[200]),
                  ),
                  label: Text(
                    'Calculate',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    if (gradeController.text.isNotEmpty) {
                      var grade = double.parse(gradeController.text);
                      result = gradeState(grade);

                      setState(() {});
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please enter a grade.'),
                        ),
                      );
                    }
                  },
                ),
              ),
              Text(
                result,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
