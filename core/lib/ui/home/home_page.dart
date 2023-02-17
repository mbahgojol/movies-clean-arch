import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        const Text('test'),
        ElevatedButton(
            onPressed: () {},
            child: Text(
              'test',
              style: Theme.of(context).textTheme.labelLarge,
            ))
      ],
    )));
  }
}
