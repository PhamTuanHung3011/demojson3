import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../movie/popular/results_model.dart';

class PopularWidget extends StatelessWidget {
  List<Result> results;

  PopularWidget(this.results);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    results.length,
                        (index) => Container(
                          width: 200,
                          height: 275,
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(8),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(results[index].poster_path.toString().replaceAll(RegExp(r'/'), 'https://image.tmdb.org/t/p/w500/'),fit: BoxFit.cover,)),
                        )),
              ),
            ),
          ],
        ));
  }
}

// Image.network(results[index].backdrop_path.toString().replaceAll(RegExp(r'/'), 'https://image.tmdb.org/t/p/w500/'),fit: BoxFit.cover,),