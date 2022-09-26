

import 'package:demojson3/widget/user_widget.dart';
import 'package:flutter/material.dart';

import '../user/root_model.dart';
import '../user/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RootWidget extends StatefulWidget {
  List<Root> roots;
  RootWidget(this.roots);

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int count = 0;

  Future<List<User>> fetchUserData(http.Client client) async {
    var url = ('https://api.storerestapi.com/users/$count');
    var response =await http.get(Uri.parse(url));
    print(response.statusCode);
    return parseUser(response.body);
  }

  List<User> parseUser(String responseString) {
    final parseAnother = convert.jsonDecode(responseString);
    return parseAnother.map<User>((json) => Root.fromJson(json)).toList();
  }
  void addCount(){
    count++;
}

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: widget.roots.length,
      itemBuilder: (context, index) {
        return FutureBuilder<List<User>>(
            future: fetchUserData(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                child: Text('An error has occurred!'),
                );
              } else if (snapshot.hasData) {
                  return UserWidget(snapshot.data!, addCount);
              } else {
                  return const Center(
                  child: CircularProgressIndicator(),);
              }
            });
      },
    );
  }
}
