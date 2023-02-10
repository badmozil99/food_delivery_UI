import 'package:flutter/material.dart';


class ContactScreen extends StatefulWidget {


  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Colors.grey[50],
      body: Center(child:
        Text('bomb'),
      ),
    );
  }
}

