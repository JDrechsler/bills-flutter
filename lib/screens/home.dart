import 'package:bills/components/bill_card.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  static final String id = 'home_screen';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String getDate() {
    DateTime now = DateTime.now();
    return "${now.weekday} ${now.month} ${now.day}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1543835683-ec5466c68daa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80'),
              ),
            ),
            accountEmail: Text('JohannesDrechslerUS@gmail.com'),
            accountName: Text('Johannes Drechsler'),
            currentAccountPicture: Image.network(
                'https://images.freeimages.com/images/large-previews/20c/my-puppy-maggie-1362787.jpg'),
          ),
          ListTile(
            title: Text('Item 1'),
          ),
          ListTile(
            title: Text('Item 1'),
          )
        ],
      )),
      appBar: AppBar(
        title: Text('Bill Tracker - ${getDate().toString()}'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blueAccent, Colors.greenAccent],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BillCard(
                amount: 1,
                dueDate: 12,
                title: 'Test',
                imageUrl:
                    'https://images.freeimages.com/images/large-previews/1f8/delicate-arch-1-1391746.jpg',
              ),
              BillCard(
                amount: 1,
                dueDate: 12,
                title: 'Test',
                imageUrl:
                    'https://images.freeimages.com/images/large-previews/1ad/tractor-2-1386664.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
