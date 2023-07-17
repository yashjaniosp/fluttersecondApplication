import 'dart:async';

import 'package:flutter/material.dart';

class IncrementDecrement extends StatefulWidget {
  const IncrementDecrement({super.key});

  @override
  State<IncrementDecrement> createState() => _IncrementDecrementState();
}

class _IncrementDecrementState extends State<IncrementDecrement> {
  StreamController<int> streamController = StreamController<int>();
  int counter = 0;

  int calculationAdd() {
    setState(() {
      counter++;
    });
    return counter;
  }

  int calculationDel() {
    setState(() {
      counter--;
    });
    return counter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Increment Decrement"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<int>(
                stream: streamController.stream,
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      streamController.add(calculationDel());
                    },
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      streamController.add(calculationAdd());
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
