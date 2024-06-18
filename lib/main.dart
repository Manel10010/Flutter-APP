import 'package:flutter/material.dart'; 
import 'controlador_pages/controlador_pages_arg.dart';
import 'controlador_pages/controlador_pages_fbf.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Elthon",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (_) => const HomePageWidget(),
        '/fbf': (_) => const ControladorPagesFBF(),
        '/args': (_) => const ControladorPagesARG(),
      },
      home: const HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.cyan.shade700,
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("lib/assets/png-1.png", width: 300, height: 300,),
            SizedBox(
              height: 50,
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan[700], shape: const StadiumBorder()),
                onPressed: () {
                  Navigator.pushNamed(context, '/fbf');
                }, 
                child: const Text("Formulas"),
                ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            SizedBox(
              height: 50,
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan[700], shape: const StadiumBorder()),
                onPressed: (){
                  Navigator.pushNamed(context, '/args');
                }, 
                child: const Text("Argumentos"),
                ),
            ),
           ],
         ),
       ),
      );
  }
}