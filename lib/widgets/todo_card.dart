import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    Key? key,
    required this.title,
    required this.status,
    required this.changeStatus,
    required this.index,
    required this.deleteTask,
  }) : super(key: key);

  final String title;
  final bool status;
  final Function changeStatus;
  final Function deleteTask;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (){changeStatus(index);},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        color: status ? Colors.grey[900] : Colors.white,
                        decoration: status
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    Icon(
                      status ? Icons.check : Icons.close,
                      size: 32,
                      color: status ? Colors.green : Colors.red,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12,),
            IconButton(
              onPressed: (){
                deleteTask(index);
              },
              icon: const Icon(Icons.delete),
              iconSize: 32,
              color: Colors.white,
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(209, 224, 224, 0.2),
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
