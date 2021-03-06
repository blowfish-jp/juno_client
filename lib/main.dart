import 'package:flutter/material.dart';
import 'package:juno_client/SecondPage.dart';
import 'package:juno_client/models/Prefecture.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('都道府県'),
      ),
      body: Center(
        child: FutureBuilder<List<Prefecture>>(
          future: fetchPrefectures(),
          builder: (BuildContext context, AsyncSnapshot <List<Prefecture>> snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))
                    ),
                    child: ListTile(
                      title: Text(snapshot.data[index].prefecture_name),
                      onTap:(){
                        print ("${snapshot.data[index].prefecture_name} is Tapped!!");
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              SecondPage(prefectureId: snapshot.data[index].id,
                                         prefectureName: snapshot.data[index].prefecture_name,)));
                      },
                    ),
                  );
                },

              );
            }else if(snapshot.hasError){
              return Text('Failed Get JSON Data!!!');
            }
            return CircularProgressIndicator();
          }
        ),
      ),
    );
  }
}
