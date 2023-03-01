import 'dart:io';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> oOrY = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  bool xAndY = true;

  void tapped(int index) {
    setState(() {
      if (xAndY && oOrY[index] == '') {
        oOrY[index] = "O";
      } else if (!xAndY && oOrY[index] == "") {
        oOrY[index] = 'x';
      }
      xAndY = !xAndY;
      endGame();
    });
  }

  void endGame() {
    if (oOrY[0] == oOrY[1] && oOrY[0] == oOrY[2] && oOrY[0] != '') {
      showEndGame(context, oOrY[0]);
    }
    if (oOrY[3] == oOrY[4] && oOrY[3] == oOrY[5] && oOrY[3] != '') {
      showEndGame(context, oOrY[3]);
    }
    if (oOrY[6] == oOrY[7] && oOrY[6] == oOrY[8] && oOrY[6] != '') {
      showEndGame(context, oOrY[6]);
    }
    if (oOrY[0] == oOrY[3] && oOrY[0] == oOrY[6] && oOrY[0] != '') {
      showEndGame(context, oOrY[0]);
    }
    if (oOrY[1] == oOrY[4] && oOrY[1] == oOrY[7] && oOrY[1] != '') {
      showEndGame(context, oOrY[1]);
    }
    if (oOrY[2] == oOrY[5] && oOrY[2] == oOrY[8] && oOrY[2] != '') {
      showEndGame(context, oOrY[2]);
    }
    if (oOrY[0] == oOrY[4] && oOrY[0] == oOrY[8] && oOrY[0] != '') {
      showEndGame(context, oOrY[0]);
    }
  }

  void startPLay() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        oOrY[i] = '';
      }
    });

    Navigator.of(context).pop();
  }

  void showEndGame(BuildContext context, String gamer) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("O'yin tugadi $gamer yutdi"),
            actions: [
              TextButton(
                  onPressed: () {
                    startPLay();
                  },
                  child: Text("Boshidan boshlash"))
            ],
          );
        });
    if (gamer == "x") {
      x++;
    } else {
      y++;
    }
  }

  var playersStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white);
  int x = 0;
  int y = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Player x",
                      style: playersStyle,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      x.toString(),
                      style: playersStyle,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Player O",
                      style: playersStyle,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      y.toString(),
                      style: playersStyle,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 42,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: InkWell(
                        onTap: () {
                          tapped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black87)),
                          child: Center(
                              child: Text(
                            oOrY[index],
                            style: TextStyle(fontSize: 34),
                          )),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
