import 'package:flutter/material.dart';

import '../another/another_model.dart';

class AnotherWidget extends StatelessWidget {

  List<Another> anotherList;
  AnotherWidget(this.anotherList);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: anotherList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.amber)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(anotherList[index].title),
                Text(anotherList[index].description),
                Text(anotherList[index].rating.rate.toString()),
                Text(anotherList[index].rating.count.toString()),


              ],
            ),
          ),
        );
      },
    );
  }
}
