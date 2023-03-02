import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac/pages/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("O'skanov Xondamir"),
            Text(
              "X va O",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            AvatarGlow(
              child: Material(
                shape: CircleBorder(),
                elevation: 8,
                child: CircleAvatar(
                  radius: 60,
                  child: Image.asset(
                    "assets/images/tic_tac.png",

                  ),
                ),
              ),
              endRadius: 150,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text(
                "O'yini boshlash",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
