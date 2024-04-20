import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  late String _userToDo;
  List<String> listViewList = ['Item A', 'Item B', 'Item C'];

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
        title: Text('Контакты'),
        centerTitle: true,
      ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: listViewList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: Key(listViewList[index]),
                      child: Card(
                        child: ListTile(
                          title: Text(listViewList[index]),
                          trailing: IconButton(
                            icon: Icon(Icons.delete_outline_outlined),
                            color: Colors.amber,
                            onPressed: () {
                              setState(() {
                                listViewList.removeAt(index);
                              });
                            },
                          ),
                        ),
                      ),
                      onDismissed: (direction) {
                        //if(direction == DismissDirection.endToStart)
                        setState(() {
                          listViewList.removeAt(index);
                        });
                      },
                    );
                  },
                ),
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context ) {
            return AlertDialog(
              title: Text('Добавить контакт'),
              content: TextField(
                onChanged: (String value) {
                  _userToDo = value;
                },
              ),
              actions: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    listViewList.add(_userToDo);
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

