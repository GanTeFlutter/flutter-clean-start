import 'package:flutter/material.dart';

class Detailddeneme extends StatefulWidget {
  const Detailddeneme({super.key});

  @override
  State<Detailddeneme> createState() => _DetailddenemeState();
}

class _DetailddenemeState extends State<Detailddeneme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detailddeneme')),
      body: Column(
        spacing: 10,
        children: [
          ElevatedButton(onPressed: () {}, child: Text('Detailddeneme')),
          ElevatedButton(onPressed: () {}, child: Text('Detailddeneme')),
          ElevatedButton(onPressed: () {}, child: Text('Detailddeneme')),
          Text('Detailddeneme'),
        ],
      ),
    );
  }
}
