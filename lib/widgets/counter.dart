import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({
    Key? key,
    required this.allTodos,
    required this.allCompleted
  }) : super(key: key);

  final int allTodos;
  final int allCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Text("$allCompleted / $allTodos",
        style: TextStyle(
          color: allTodos == allCompleted ? Colors.green : Colors.white,
          fontSize: 48,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

