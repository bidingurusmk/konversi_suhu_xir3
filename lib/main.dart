import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final formKey = GlobalKey<FormState>();
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();
  TextEditingController input = TextEditingController();

  double kelvin = 0;
  double reamur = 0;
  double fahrenheit = 0;

  hitung() {
    setState(() {
      if (formKey.currentState!.validate()) {
        reamur = 4 / 5 * double.parse(input.text);
        kelvin = double.parse(input.text) + 273;
        fahrenheit = (double.parse(input.text) * 9 / 5) + 32;
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messangerKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Konversi Suhu XIR3",
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(
            Icons.access_alarm_rounded,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: formKey,
                child: TextFormField(
                  controller: input,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      _messangerKey.currentState!.showSnackBar(
                        const SnackBar(
                          content: Text("Input Number"),
                        ),
                      );
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Inputkan Angka",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(25),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("Suhu dalam Kelvin"),
                      Text(
                        kelvin.toString(),
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Suhu dalam Reamor"),
                      Text(
                        reamur.toString(),
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    hitung();
                  }
                },
                child: Text("Hitung"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
