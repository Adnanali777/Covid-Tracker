import 'package:flutter/material.dart';

class SelectTab extends StatefulWidget {
  bool isSelected;
  SelectTab({this.isSelected = true});

  @override
  _SelectTabState createState() => _SelectTabState();
}

class _SelectTabState extends State<SelectTab> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(3),
        width: width * 0.5,
        height: height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: Colors.grey[500]),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.isSelected = !widget.isSelected;
                });
              },
              child: Container(
                height: height * 0.4,
                width: width * 0.239,
                decoration: BoxDecoration(
                    color: widget.isSelected ? Color(0xff0655B2) : Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    'Global',
                    style: TextStyle(
                      fontSize: 15,
                      color: !widget.isSelected ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.isSelected = !widget.isSelected;
                });
              },
              child: Container(
                height: height * 0.4,
                width: width * 0.239,
                decoration: BoxDecoration(
                    color:
                        !widget.isSelected ? Color(0xff0655B2) : Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    'India',
                    style: TextStyle(
                      fontSize: 15,
                      color: !widget.isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
