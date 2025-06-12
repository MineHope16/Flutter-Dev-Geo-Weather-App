import "dart:io";

void main() {
  performTask();
}

void performTask() async{
  task1();
  String t1 = await task2();
  task3(t1);
}

void task1() {
  String task1Result = "Task 1 data";
  print("Task 1 completed");
}

Future<String> task2()  async{
  String task2Result = "";

  await Future.delayed(Duration(seconds: 3),() {
    task2Result = "Task 2 data";
    print("Task 2 completed");
  });

  return task2Result;
}

void task3(String task2) {
  String task1Result = "Task 3 data";
  print("Task 3 completed $task2");
}
