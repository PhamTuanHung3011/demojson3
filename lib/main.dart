import 'package:demojson3/user/root_model.dart';
import 'package:demojson3/user/user_model.dart';
import 'package:demojson3/widget/another_widget.dart';
import 'package:demojson3/widget/popular_widget.dart';
import 'package:demojson3/widget/root_widget.dart';
import 'package:demojson3/widget/user_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'another/another_model.dart';
import 'movie/popular/popular_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Future<List<Another>> fetchAnotherData(http.Client client) async {
  //   var url = ('https://fakestoreapi.com/products');
  //   var response =await http.get(Uri.parse(url));
  //   print(response.statusCode);
  //    return parseAnother(response.body);
  // }
  //
  // List<Another> parseAnother(String responseString) {
  //   final parseAnother = convert.jsonDecode(responseString);
  //  return parseAnother.map<Another>((json) => Another.fromJson(json)).toList();
  // }


  // Future<Root> fetchRootData(http.Client client) async {
  //   var url = ('https://api.storerestapi.com/users');
  //   var response =await http.get(Uri.parse(url));
  //   print(response.statusCode);
  //   return parseRoot(response.body);
  // }
  //
  // Root parseRoot(String responseString) {
  //   return Root.fromJson(convert.jsonDecode(responseString) as Map<String, dynamic>);
  // }

  Future<Popular> featchPopularData(http.Client client) async {
    var url = 'https://api.themoviedb.org/3/movie/popular?api_key=14dbedbaac4a6e340bed37178a051c56&language=en-US&page=1';
    var response = await http.get(Uri.parse(url));
    return parsePopular(response.body);

  }
Popular parsePopular (String stringJson) {
   return   Popular.fromJson(convert.jsonDecode(stringJson) as Map<String, dynamic>);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: FutureBuilder<Popular>(
        future: featchPopularData(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('===== ${snapshot.error}');
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PopularWidget(snapshot.data?.results ?? []);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

    );
  }
}
