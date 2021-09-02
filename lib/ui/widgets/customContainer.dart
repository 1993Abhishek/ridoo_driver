import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ridoo_driver/ui/helper/app_dimen.dart';

class CustomContainer extends StatefulWidget {
  final String actionName;
  const CustomContainer({Key key,this.actionName}) : super(key: key);

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: hDimen(50),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: hDimen(20),
          right: hDimen(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.actionName,
              style: TextStyle(
                fontSize: hDimen(16),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: Colors.black,
              size: hDimen(25),
            )
          ],
        ),
      ),
    );
  }
}
