
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
        equal++;
      } else if (!xAndY && oOrY[index] == "") {
        oOrY[index] = 'x';
        equal++;
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
    if(oOrY[2]==oOrY[4]&&oOrY[2]==oOrY[6]&&oOrY[2]!=''){
      showEndGame(context, oOrY[2]);
    }
    else if(equal==9){
      showEqualGame(context);
    }
  }

  void startPLay() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        oOrY[i] = '';
      }
      equal = 0;
    });

    Navigator.of(context).pop();
  }
  void showEqualGame(BuildContext context,) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("O'yin durang"),
            actions: [
              TextButton(
                  onPressed: () {
                    startPLay();
                  },
                  child: Text("Boshidan boshlash"))
            ],
          );
        });

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
      TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white);
  int x = 0;
  int y = 0;
  int equal = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 120),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
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
                  ),
                  Expanded(
                    child: Column(
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
                  ),
                ],
              ),
              SizedBox(
                height: 16,
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
                                border: Border.all(color: Colors.white,width: 1.5)),
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
              Text("X va O ",style: TextStyle(fontSize: 22,color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}
