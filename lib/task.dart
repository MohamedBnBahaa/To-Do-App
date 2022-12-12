// class for task(todo-card)
class Task {
  String title;
  bool status;

  Task({required this.title, required this.status});
}


// list of todos
List allTasks = [
  Task(title: "Go to GEM", status: false),
  Task(title: "Call Mom", status: true),
];