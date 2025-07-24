import 'package:firebase_csplash_login/widgets/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final postController= TextEditingController();
  bool loading=false;
  // taking as a database instance where Post called as node act like a table in sql
  final databaseRef=FirebaseDatabase.instance.ref('Post');
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
        padding: const EdgeInsets.symmetric(horizontal: 20, ),
        child: Column(
          children: [
            SizedBox(height: 30,),
            TextFormField(
              controller: postController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'What\'s in your Mind?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 30,),
            RoundButton(title: 'Add', loading: loading, onTap: (){
              setState(() {
                loading=true;
              });
              // we can add a subchild as well in the Post node.
              databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
                'title': postController.text,
                'id': DateTime.now().millisecondsSinceEpoch.toString(),
                // 'id':3,

              }).then((value) {
                setState(() {
                  loading=false;
                });
                Utils.showErrorToast('Post Successfully Added'.toString());
              }).onError((error, stackTrace) {
                setState(() {
                  loading=false;
                });
                Utils.showErrorToast(error.toString());
              });


            }),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
