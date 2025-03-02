import 'dart:math';

import 'package:flutter/material.dart';
import 'package:number_guess_app/result_screen.dart';

class GuessScreen extends StatefulWidget {
  const GuessScreen({super.key});

  @override
  State<GuessScreen> createState() => _GuessScreenState();
}

class _GuessScreenState extends State<GuessScreen> {

  var tfGuess = TextEditingController();
  int randomNumber = 0;
  int rights = 5;
  String clue = "";

  @override
  void initState() {
    super.initState();
    randomNumber = Random().nextInt(101); // 0-100
    print("Random Number : $randomNumber");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Guess Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Remaining rights : $rights", style: TextStyle(color: Colors.pink, fontSize: 30.0),),
            Text("Help : $clue", style: TextStyle(color: Colors.lightBlue, fontSize: 24.0),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfGuess,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Guess",
                  labelStyle: TextStyle(color: Colors.pink),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),

                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                ),
                onPressed: (){

                  setState(() {
                    rights -= 1;
                  });
                  int guess = int.parse(tfGuess.text);

                  if(guess == randomNumber) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultScreen(result: true,)));
                    return;
                  }

                  if(guess > randomNumber) {
                    setState(() {
                      clue = "You should lower your guess";
                    });
                  }

                  if(guess < randomNumber) {
                    setState(() {
                      clue = "You should upper your guess";
                    });
                  }

                  if(rights == 0) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultScreen(result: false,)));
                  }

                  tfGuess.text = "";


                },
                child: Text("GUESS"),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
