import 'package:juno_client/Const.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


Future<List<Prefecture>> fetchPrefectures() async{
  final response =
      await http.get('${JSON_API_URL}/prefectures');

  if(response.statusCode == 200){
    Iterable list = json.decode(response.body);
    var prefectures = list.map((prefecture) => Prefecture.fromJson(prefecture)).toList();
    return prefectures;
  }else{
    print('Error!!');
    throw Exception('Failed to Load Prefectures!!');
  }
}

class Prefecture {
  final int id;
  final String prefecture_name;

  Prefecture({
    this.id,
    this.prefecture_name
  });

  factory Prefecture.fromJson(Map<String, dynamic> json){
    return Prefecture(
        id: json['id'],
        prefecture_name: json['prefecture_name']
    );
  }
}

