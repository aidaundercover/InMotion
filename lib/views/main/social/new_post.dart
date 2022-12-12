import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';


class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  TextEditingController _title = TextEditingController();
  TextEditingController _content = TextEditingController();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 60,
          centerTitle: true,
          title: Text(
            'Создать пост',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined, size: 25, ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],),
      )
    );
  }
}
