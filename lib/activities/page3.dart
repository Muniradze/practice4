import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {

  late String _userToDo;
  List<String> separatedList = ['Item X', 'Item Y', 'Item Z'];

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
        title: Text('Список дел'),
        centerTitle: true,
      ),
        body: Column(
          children: [
            Expanded
              (
                child: ListView.separated(
                  itemCount: separatedList.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (BuildContext context, int index)
                  {
                    return Dismissible(
                        key: Key(separatedList[index]),
                        child: Card(
                          child: ListTile(
                            title: Text(separatedList[index]),
                              trailing: IconButton(
                                icon: Icon(Icons.delete_outline_outlined),
                                color: Colors.amber,
                                onPressed: () {
                                  setState(() {
                                    separatedList.removeAt(index);
                                  });
                                },
                              ),
                          ),
                        ),
                      onDismissed: (direction) {
                        //if(direction == DismissDirection.endToStart)
                        setState(() {
                          separatedList.removeAt(index);
                        }
                        );
                      },
                    );
                  },
                )
            )
          ],
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context ) {
            return AlertDialog(
              title: Text('Пополнить список'),
              content: TextField(
                onChanged: (String value) {
                  _userToDo = value;
                },
              ),
              actions: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    separatedList.add(_userToDo);
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
