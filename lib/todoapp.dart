import 'package:flutter/material.dart';
import 'package:todo_app_lesson10_1/task.dart';
import 'package:todo_app_lesson10_1/widgets/add.dart';
import 'package:todo_app_lesson10_1/widgets/counter.dart';
import 'package:todo_app_lesson10_1/widgets/todo_card.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {

  // Create controller to get the text inside the textField in the dialog widget
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1),
        title: const Text(
          "TO DO APP",
          style: TextStyle(
              fontSize: 33,
              color: Colors.white,
              fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              deleteAllTasks();
            },
            icon: const Icon(Icons.delete_forever),
            iconSize: 36,
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Counter(
              allCompleted: calculateCompletedTasks(),
              allTodos: allTasks.length,
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              height: 500,
              color: const Color.fromRGBO(58, 66, 86, 1),
              child: ListView.builder(
                itemCount: allTasks.length,
                itemBuilder: (BuildContext context, int index){
                  return TodoCard(
                    title: allTasks[index].title,
                    status : allTasks[index].status,
                    changeStatus: changeStatus,
                    index: index,
                    deleteTask: deleteTask,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Add(
        myController: myController,
        addNewTask: addNewTask,
      ),
    );
  }


  // To add new todo when clicking on "ADD" in the dialog widget
  void addNewTask(){
    setState((){
      allTasks.add(
        Task(title: myController.text, status: false),
      );
    });
  }

  // To calculate only completed todos
  int calculateCompletedTasks(){
    int completedTasks = 0;
    for(var element in allTasks){
      if(element.status){
        completedTasks++;
      }
    }
    return completedTasks;
  }

  // To change the state of the todo (completed or not completed) when click on the todo
  void changeStatus(int index){
    setState(() {
      allTasks[index].status = !allTasks[index].status;
    });
  }

  // To remove todo  when clicking on "delete" icon
  void deleteTask(int index){
    setState(() {
      allTasks.removeAt(index);
      //allTasks.remove(allTasks[index]);
    });
  }

  // To remove all todos  when clicking on "delete" icon in the appBar
  void deleteAllTasks(){
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }

}
