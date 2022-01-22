import 'package:flutter/material.dart';
import 'package:instagram_clone/follows/services/database.dart';

class FollowCardButton extends StatelessWidget {
  const FollowCardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // child: StreamBuilder(
        //   stream: FollowsDatabase.isIFollowQuery(userId: userId)
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     return Container(
        //       child: child,
        //     );
        //   },
        // ),,
        );
  }
}
