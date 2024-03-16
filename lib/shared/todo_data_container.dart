class TodoDataContainer {
  List<Todos> todos =  [
    Todos('Complete the homework', false),
    Todos('Clean the bedroom', false),
    Todos('Wash the car', false),
    Todos('Do exercise(50 push-up)', false),
    Todos('Take a bath', false),
    Todos('Cut you hair', false),
    Todos('Feed your pet', false),
    Todos('Take your medicine', false),
  ];
}

class Todos {
  String task;
  bool isDone;

  Todos(this.task, this.isDone);

  @override
  String toString() {
    return "task is $task and isDone is $isDone";
  }
}