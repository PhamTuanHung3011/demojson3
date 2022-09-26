import 'package:flutter/material.dart';

import '../user/user_model.dart';

class UserWidget extends StatelessWidget {
  List<User> userList;
  Function() addcount;
  UserWidget(this.userList, this.addcount);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: userList.length,
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
                Text(userList[index].role),
                Text(userList[index].id),
                Text(userList[index].name),
                Text(userList[index].number.toString()),
              ],
            ),
          ),
        );
      },
    );
  }
}
