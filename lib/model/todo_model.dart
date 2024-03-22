class TodoModel {
  String task;
  String description;
  bool isDone;

  TodoModel(this.task, this.isDone, this.description);

  @override
  String toString() {
    return "task is $task and isDone is $isDone";
  }
}