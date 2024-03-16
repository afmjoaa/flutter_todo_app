class TodoModel {
  String task;
  bool isDone;

  TodoModel(this.task, this.isDone);

  @override
  String toString() {
    return "task is $task and isDone is $isDone";
  }
}