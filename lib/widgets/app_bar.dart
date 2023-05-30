import 'package:card_swipe_example/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      // color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buttonWidgets(Icons.star, Colors.amber),
          imageWidgets('assets/tinder.jpeg'),
          imageWidgets('assets/diamond.png'),
          buttonWidgets(Icons.notifications, Colors.grey.shade400)
        ],
      ),
    );
  }
}

Widget imageWidgets(String image) {
  return Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
    ),
  );
}
