class TodoItem {
  String text;
  int dauer;
  bool erledigt;

  TodoItem({required this.text, this.dauer = 15, this.erledigt = false});

  @override
  String toString() {
    return "$text $erledigt";
  }
}
