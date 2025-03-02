import 'package:flutter/material.dart';
import 'package:number_guess_app/main.dart';

class ResultScreen extends StatefulWidget {

  late bool result;


  ResultScreen({required this.result});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Result Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.result ? Image.asset("images/mutlu_resim.png") : Image.asset("images/uzgun_resim.png"),
            Text( widget.result ?  "Win!" : "Game Over!", style: TextStyle(color: Colors.black45, fontSize: 36.0),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                ),
                child: Text("RESTART"),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
