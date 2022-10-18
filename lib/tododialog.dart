import 'package:flutter/material.dart';

// Dialog zur Eingabe eines neuen Todo-Items
class TodoDialog extends StatefulWidget {
  const TodoDialog({super.key});

  @override
  State<TodoDialog> createState() => _TodoDialogState();
}

class _TodoDialogState extends State<TodoDialog> {
  // Variable, die den aktuell eingebenem Text enthält
  String eingabe = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        onChanged: (value) {
          // Textänderung, aktueller Wert wird gespeichert
          eingabe = value;
        },
        decoration: const InputDecoration(
          hintText: 'Aufgabe eingeben',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Abbrechen, Dialog wird geschlossen
            Navigator.pop(context);
          },
          child: const Text("Abbrechen"),
        ),
        TextButton(
          onPressed: () {
            // Speichern, eingegebener Wert wird zurückgegeben
            Navigator.pop(context, eingabe);
          },
          child: const Text("Speichern"),
        ),
      ],
    );
  }
}
