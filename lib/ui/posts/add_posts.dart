import 'package:firebase_csplash_login/widgets/round_button.dart';
import 'package:flutter/material.dart';
class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Add Post", style: TextStyle(
            fontSize: 22, color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'What is in your Mind?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 30,),
            RoundButton(title: 'Add', onTap: (){
// herer we have to perform special tast for addition of post of max 4 lines
            }),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
