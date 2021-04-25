import 'package:flutter/material.dart';

class CountBox extends StatelessWidget {
  String head;
  String count;
  Color colorbox;
  Color colorhead;
  Color colorcount;
  CountBox(
      {this.colorbox, this.colorcount, this.colorhead, this.count, this.head});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.43,
      decoration: BoxDecoration(
        color: colorbox,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child:
                Text(head, style: TextStyle(fontSize: 17.5, color: colorhead)),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              count,
              style: TextStyle(
                  fontSize: 20, color: colorcount, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
