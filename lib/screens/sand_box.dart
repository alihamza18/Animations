import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  const SandBox({super.key});

  @override
  State<SandBox> createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {

  double _margin=0;
   double _opacity=1;
   double width=200;
  Color _color=Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        width: width,
        margin:  EdgeInsets.all(_margin),
        color: _color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
              setState(() {
                _margin=50;
              });
              }, child: Text("Animate Margin")),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    _color=Colors.purple;
                  });
                }, child: Text("Animate color")),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    width=300;

                  });
                }, child: Text("Animate width")),
          ],
        ),
      ),

    );
  }
}
