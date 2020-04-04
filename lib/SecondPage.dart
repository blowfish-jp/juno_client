import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final int prefectureId;
  final String prefectureName;

  SecondPage({Key key, @required this.prefectureId, this.prefectureName});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('${widget.prefectureName}')),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('ようこそ。${widget.prefectureName}へ')
          ],
        )
      ),
    );
  }
}
