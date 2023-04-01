import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final Function onpress;
  MyButton({required this.name, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      child: ElevatedButton(
        child: Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        onPressed: onpress(context),
        style: ElevatedButton.styleFrom(
          primary: Colors.green.shade500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
/*width: double.infinity,
                height: 550,
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(450),
                  ),
                  color: Color.fromARGB(141, 76, 175, 79),
                ), */