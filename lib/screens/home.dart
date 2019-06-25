import 'package:bills/components/bill_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatefulWidget {
  static final String id = 'home_screen';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String getDate() {
    DateTime now = DateTime.now();
    return "${DateFormat.yMMMMd().format(now)}";
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
            ),
          ],
        ),
      ),
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
              StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('billers').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Text('Loading...');
                      break;
                    default:
                      if (snapshot.hasData) {
                        final bills = snapshot.data.documents;
                        List<BillCard> billCards = [];
                        for (var bill in bills) {
                          final String billTitle = bill.data['title'];
                          final dynamic billAmount = bill.data['amount'];
                          final int billDueDate = bill.data['dayOfMonth'];
                          final String billImageUrl = bill.data['imageUrl'];
                          billCards.add(BillCard(
                            amount: billAmount,
                            dueDate: billDueDate,
                            imageUrl: billImageUrl,
                            title: billTitle,
                          ));
                        }
                        billCards.sort((a, b) {
                          return a.dueDate.compareTo(b.dueDate);
                        });
                        return Expanded(
                          child: ListView(
                            children: billCards,
                          ),
                        );
                      }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
