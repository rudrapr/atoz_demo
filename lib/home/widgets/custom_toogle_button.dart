import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  final String title;
  final int index;
  final int currentSelection;
  final Function(int index) onTap;

  const CustomToggleButton(
      {Key? key,
      required this.title,
      required this.index,
      required this.currentSelection,
      required this.onTap})
      : super(key: key);

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.index == widget.currentSelection;
    return InkWell(
      onTap: () {
        widget.onTap(widget.index);
      },
      child: Container(
        height: 55,
        width: 120,
        color: isSelected ? Colors.white : Color(0xffF3F4F6),
        child: Stack(children: [
          Row(
            children: [
              Container(
                width: 4,
                color: isSelected ? Colors.red : Color(0xffF3F4F6),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.title,
                style: TextStyle(
                    color: isSelected ? Colors.red : Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Divider(
              thickness: 1,
              height: 0,
            ),
          )
        ]),
      ),
    );
  }
}
