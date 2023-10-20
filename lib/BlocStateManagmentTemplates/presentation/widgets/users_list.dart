import 'package:flutter/material.dart';

import '../../data/models/user_model.dart';

class UsersList extends StatelessWidget {
  final List<UserModel> users;
  const UsersList({
    required this.users,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text("${users[index].name}"),
              subtitle: Text("${users[index].email}"),
            ),
            Divider(),
          ],
        );
      },
    );
  }
}
