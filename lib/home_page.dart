import 'package:card_swipe_example/functions/alert_function.dart';
import 'package:card_swipe_example/utils/constants.dart';
import 'package:card_swipe_example/widgets/app_bar.dart';
import 'package:card_swipe_example/widgets/bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<String> _names = [
    "Chandler",
    "Joey",
    "Monica",
    "Phoebe",
    "Rachel",
    "Ross",
  ];

  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: _names[i]),
          likeAction: () {
            actions(context, _names[i], 'Liked');
          },
          nopeAction: () {
            actions(context, _names[i], 'Rejected');
          },
          superlikeAction: () {
            actions(context, _names[i], 'Super Liked');
          }));
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const TopBar(),
            Expanded(
                child: Container(
              child: SwipeCards(
                matchEngine: _matchEngine!,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover),
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _names[index],
                          style: const TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  );
                },
                onStackFinished: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Stack Finished"),
                    duration: Duration(milliseconds: 500),
                  ));
                },
              ),
            )),
            BottomBar()
          ],
        ),
      ),
    );
  }
}

class Content {
  final String? text;
  Content({this.text});
}
