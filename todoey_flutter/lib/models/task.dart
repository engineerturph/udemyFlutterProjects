class Task {
  String? name;
  bool isDone = false;

  Task({required this.name});

  void toggleDone() {
    isDone = !isDone;
  }

  void changeName(String? value) {
    name = value;
  }
}
