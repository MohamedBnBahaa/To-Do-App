import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  const Add({
    Key? key,
    required this.myController,
    required this.addNewTask}) : super(key: key);

  final Function addNewTask;
  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        showDialog(
          context: context,
          builder: (BuildContext context){
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)
              ),
              child: Container(
                height: 200,
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: myController,
                      maxLength: 20,
                      decoration: const InputDecoration(
                        hintText: "Add new Task",
                      ),
                    ),
                    const SizedBox(height: 24.0,),
                    TextButton(
                      onPressed: (){
                        addNewTask();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "ADD",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: const Icon(Icons.add,),
      backgroundColor: Colors.redAccent,
    );
  }
}
