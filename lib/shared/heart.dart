import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin{
  bool isFav=false;
  AnimationController? _controller;
  Animation? _colorAnimation;
  Animation<double>? _sizeAnimation;
  Animation<double>? _curve;


  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(
      duration: Duration(milliseconds: 1000),
        vsync: this,
    );

    _curve=CurvedAnimation(parent: _controller!, curve: Curves.slowMiddle);

    _colorAnimation=ColorTween(begin: Colors.grey,end: Colors.red)
      .animate(_curve!);

    _sizeAnimation=TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween:  Tween<double>(begin: 30, end: 50),
          weight: 50,
        ),
        TweenSequenceItem<double>(
          tween:  Tween<double>(begin: 50, end: 30),
          weight: 50,
        ),
      ]
    ).animate(_curve!);
    


    _controller?.addListener((){
      print(_controller?.value);
      print(_colorAnimation?.value);
    });

    _controller?.addStatusListener((status){
       if (status == AnimationStatus.completed){
         setState(() {
           isFav=true;
         });
       }
       if (status == AnimationStatus.dismissed){
         setState(() {
           isFav=false;
         });
       }
    });
  }
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (BuildContext context,_){
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color:  _colorAnimation?.value,
            size: _sizeAnimation?.value,
          ),
          onPressed: () {
            isFav ? _controller?.reverse(): _controller?.forward();
          },
        );
      },

    );
  }
}
