import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Записная книжка'),
          centerTitle: true,
        ),
        body: Column
          (
          children:
          [
            Padding(padding: EdgeInsets.only(top: 10)),
            Center(
            child: Text(
              'Главная страница',
              style: TextStyle(
                fontSize: 28, // Changing font size to 28
                color: Colors.black,
              ),
            ),
          ),
            Padding(padding: EdgeInsets.only(top: 20)),
            ElevatedButton
              (
                onPressed: ()
            {
                Navigator.pushNamed(context, '/home');
            },
                child: Text('Заметки')
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            ElevatedButton
              (
                onPressed: ()
            {
                Navigator.pushNamed(context, '/page2');
            },
                child: Text('Контакты')
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            ElevatedButton
              (
                onPressed: ()
                {
                  Navigator.pushNamed(context, '/page3');
                },
                child: Text('Список дел')
            ),
          ],
        )
    );
  }
}