import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: Text(
            "Hello",
            style: TextStyle(fontSize: 15),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Stack(
          children: [
            Container(
              height: 70,
              width: 15,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).colorScheme.primary, width: 3),
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 236, 236, 234),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Text("Hello")
      ],
    );
  }
}
