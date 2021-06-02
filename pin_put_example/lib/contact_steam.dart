import 'package:flutter/material.dart';
import 'package:pin_put_example/contact_manager.dart';

import 'models/contact.dart';

class ContactStream extends StatefulWidget {
  @override
  _ContactStreamState createState() => _ContactStreamState();
}

class _ContactStreamState extends State<ContactStream> {
  ContactManager manager = ContactManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: [
          StreamBuilder<int>(
              stream: manager.contactCounter,
              builder: (context, snapshot) {
                return Chip(
                  label: Text(
                    (snapshot.data ?? 0).toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }),
        ],
      ),
      body: StreamBuilder<List<Contact>>(
        stream: manager.contactListView,
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          List<Contact> contacts = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.done:
              return ListView.separated(
                  padding: const EdgeInsets.only(top: 20),
                  itemBuilder: (BuildContext context, int index) {
                    Contact _contact = contacts[index];
                    return ListTile(
                      leading: CircleAvatar(),
                      title: Text(_contact.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_contact.email),
                          Text(_contact.phone),
                        ],
                      ),
                    );
                  },
                  itemCount: contacts.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  });
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
