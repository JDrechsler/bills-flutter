import 'package:flutter/material.dart';

class BillCard extends StatefulWidget {
  BillCard({
    this.dueDate,
    this.amount,
    this.title,
    this.imageUrl,
  });

  final int dueDate;
  final dynamic amount;
  final String title;
  final String imageUrl;

  @override
  _BillCardState createState() => _BillCardState();
}

class _BillCardState extends State<BillCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.indigo,
      // ),
      height: 100,
      child: Card(
        color: Colors.lightGreen[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(widget.dueDate.toString()),
            Image.network(
              widget.imageUrl,
              width: 100,
            ),
            Text(widget.title),
            Text(widget.amount.toString()),
          ],
        ),
      ),
    );
  }
}
