import 'package:flutter/material.dart';

import 'todoitem.dart';

// Diese Seite könnte später Details eines Todo-Items anzeigen
// oder auch Form-Element zum ändern beinhalten
// TODO item bearbeiten implementieren
class TodoDetailPage extends StatelessWidget {
  final TodoItem item;

  const TodoDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detailseite für Todo-Items"),
      ),
      body: Center(
        child: Text(item.text),
      ),
    );
  }
}
