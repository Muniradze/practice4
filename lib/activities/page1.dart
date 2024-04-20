import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  late String _userToDo;
  List<String> columnList = ['Item 1', 'Item 2', 'Item 3'];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Заметки'),
        centerTitle: true,
      ),
      body: Column(
        children: [
            ListView.builder(
              itemCount: columnList.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(columnList[index]),
                  child: Card(
                    child: ListTile(
                      title: Text(columnList[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_outline_outlined),
                        color: Colors.amber,
                        onPressed: () {
                          setState(() {
                            columnList.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ),
                  onDismissed: (direction) {
                    //if(direction == DismissDirection.endToStart)
                    setState(() {
                      columnList.removeAt(index);
                    });
                  },
                );
              },
            ),
          ]
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context ) {
            return AlertDialog(
              title: Text('Добавить заметку'),
              content: TextField(
                onChanged: (String value) {
                  _userToDo = value;
                },
              ),
              actions: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    columnList.add(_userToDo);
                  });

                  Navigator.of(context).pop();
                },
                    child: Text('Добавить'))
              ],
            );
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.amber,
        ),
      ),
    );
  }
}
