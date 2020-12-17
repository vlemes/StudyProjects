import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Lais Linda'),
              actions: [
                IconButton(icon: const Icon(Icons.alarm), onPressed:(){})
              ],
            ),
            body: Center(child: const Text("Aperte o botão")),
            floatingActionButton: FloatingActionButton(
              onPressed: (){},
              child: Icon(Icons.favorite),
              backgroundColor: Colors.red,
            ),
          ),
    );
  }
}
