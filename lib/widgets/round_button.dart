
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  const RoundButton({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 150,
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.deepPurple,
        ),
        child: Center(child: Text(title,style: TextStyle(fontSize: 16, color: Colors.white),)),
      ),
    );
  }
}
