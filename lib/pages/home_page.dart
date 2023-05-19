import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_item_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ToDoItemModel> todos = ToDoItemModel.todoList();
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (textController.text.isNotEmpty) {
                todos.add(ToDoItemModel(
                    id: todos.isNotEmpty
                        ? (int.parse(todos.last.id) + 1).toString()
                        : "1",
                    text: textController.text));
                textController.clear();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Não pode adicionar uma tarefa vazia"),
                ));
              }
            });
          },
          tooltip: 'Nova Tarefa',
          child: const Icon(Icons.add)),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (ctx, i) {
                  return CheckboxListTile(
                      secondary: IconButton(
                          onPressed: () {
                            setState(() {
                              todos.remove(todos[i]);
                            });
                          },
                          icon: const Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          )),
                      title: Text(todos[i].text),
                      value: todos[i].isComplete,
                      onChanged: (value) {
                        setState(() {
                          todos[i].isComplete = value ?? false;
                        });
                      });
                },
              ),
            ),
            Expanded(
                flex: 0,
                child: Material(
                  elevation: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                          hintText: "Adicionar uma nova tarefa",
                          border: InputBorder.none),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
