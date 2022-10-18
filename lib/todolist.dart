import 'package:block2/tododetail.dart';
import 'package:block2/tododialog.dart';
import 'package:flutter/material.dart';
import 'todoitem.dart';

// Dieses Widget zeigt die Hauptliste der Todo-Einträge
// es ist ein Stateful-Widget, weil sich die Liste ändern kann
class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // ein paar Beispiel-Items
  var items = [
    TodoItem(text: "Milch einkaufen"),
    TodoItem(text: "Reifen wechseln", dauer: 30),
    TodoItem(text: "Postablage", dauer: 60, erledigt: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar - Titelleiste mit unserem "+"-Button
      appBar: AppBar(
        title: const Text("TodoApp"),
        actions: [
          IconButton(
            onPressed: () async {
              // Ereginisbehandlung - Benutzer hat auf "+" gedrückt
              // Dialog anzeigen und auf Ergebnis warten (await)
              var eingegebenerText = await showDialog<String>(
                context: context,
                builder: (context) => const TodoDialog(),
              );

              // nur wenn der Benutzer einen Text eingegeben hat und
              // auf Speichern gedrückt hat
              if (eingegebenerText != null) {
                // neues Todoitem erzeugen, Oberfläche neu zeichnen
                setState(() {
                  items.add(TodoItem(text: eingegebenerText));
                });
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      // Liste mot allen TodoItems
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          // hier wird eine einzelne Zeile in unserer Todo-Liste erzeugt
          // (ein ListTile)
          var item = items[index];

          return ListTile(
            onTap: () {
              // Detailseite für ein Item aufrufen
              Navigator.push(
                context,
                // diese Builder erzeugt die neue Seite, auf die wir navigieren wollen
                // diese Seite legt sich dann über die aktuelle Seite
                MaterialPageRoute(builder: (context) {
                  // Detailseite erzeugen und zurückliefern
                  // unsere Detailseite bekommt das angeklickte item übergeben
                  return TodoDetailPage(item: item);
                }),
              );
            },
            trailing: Checkbox(
              value: item.erledigt,
              onChanged: (value) {
                // Checkbox wurde gedrückt, TodoItem verändern und neu zeichnen
                setState(() {
                  item.erledigt = value!;
                });
              },
            ),
            title: Text(item.text),
            subtitle: Text("${item.dauer} Minuten"),
          );
        },
      ),
    );
  }
}
