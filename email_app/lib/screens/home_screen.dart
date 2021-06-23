import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final List<String> messages = const [
    'My first message'
        'My second message'
        'My Third message'
        'My Fouth message'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        title,
      )),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(),
            title: Text('Title $index'),
            subtitle: Text(
                'Incididunt eu dolore eu Lorem id aliqua officia magna tempor id id.'),
          );
        },
        itemCount: messages.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}
