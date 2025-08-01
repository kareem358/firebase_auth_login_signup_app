import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_csplash_login/ui/auth/login_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import 'add_posts.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth =FirebaseAuth.instance;
  //final ref=FirebaseDatabase.instance.ref('Post');
  //final searchFilter= TextEditingController();
  final editController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepPurple,
        title: Text("Post Screen",style: TextStyle(
          fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold,)),
        centerTitle: true,
        actions: [

            IconButton(

              onPressed: () {
                auth.signOut().then((value){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen(),));
                }).onError((error,stackTrace){
                  Utils.showErrorToast(error.toString());
                });
                },
               icon: Icon(Icons.logout, color: Colors.white,),
               ),
        ],
      ) ,

        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPostScreen()),
            );
          },
          label: Text(
            "Add Post",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          icon: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.deepPurple,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      body:Column(

        children: [
          SizedBox(height: 10,),
       /*   Padding(
       //this code is written for the search filter so  I commented it for now
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              controller: searchFilter,
              decoration: InputDecoration(
                hintText: "search",
                border: OutlineInputBorder(

                ),
              ),
              onChanged: (String value){
                setState(() {

                });
              },
            ),
          ),*/
          // fetching firebase data using stream builder
          /*Expanded(
              child: StreamBuilder(
                stream: ref.onValue,
            builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if(!snapshot.hasData){
                    return Text("No Data Found");
                  }else
                    {

                    Map<dynamic,dynamic> map=snapshot.data!.snapshot.value as dynamic;
                    List<dynamic> list=[];
                    list.clear();
                    list=map.values.toList();

                    return ListView.builder(
                        itemCount: snapshot.data!.snapshot.children.length,
                        itemBuilder: (context, index) {
                          var item = list[index] as Map?;
                          return ListTile(

                        *//*    title: Text(list[index]['title']),
                            subtitle: Text(list[index]['id']),*//*
                               title: Text(item?['title']?.toString() ?? 'No Title'),
                              subtitle: Text(item?['id']?.toString() ?? 'No ID'),


                          );
                        });
                  }

            }

          )),*/
          Expanded(
            child: FirebaseAnimatedList(

                query: ref,
                defaultChild: Text("Loading "),
                itemBuilder:
                    ( context,  snapshot,  animation, int index) {

                  final title=snapshot.child('title').value.toString();
                  if(searchFilter.text.isEmpty){
                    return ListTile(
                      title: Text(snapshot.child('title').value.toString()),
                      subtitle: Text(snapshot.child('id').value.toString()),
                      // list title always have to be a widget and trailing is optional
                      trailing: PopupMenuButton(
                        icon: Icon(Icons.more_vert),
                        itemBuilder:(context)=>[

                          PopupMenuItem(
                            value: 2,
                            child: ListTile(
                              leading: Icon(Icons.delete),
                              title: Text("Delete"),
                              onTap: (){
                                Navigator.pop(context);
                                ref.child(snapshot.child('id').value.toString()).remove();
                              },
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Tooltip(
                              message: 'Edit this item',
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  showMyDialog(title, snapshot.child('id').value.toString());
                                },
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                              ),
                            ),
                          ),

                        ]
                      )
                    );
                  }else if(title.toLowerCase().contains(searchFilter.text.toLowerCase())){

                    return ListTile(
                      title: Text(snapshot.child('title').value.toString()),
                      subtitle: Text(snapshot.child('id').value.toString()),
                    );

                  } else {
                    return Container();
                  }
            

                    }
            
            ),
          ),

        ],
      ),
    );
  }
  Future <void> showMyDialog(String title, String id ) async{
    editController.text=title;

    return showDialog(
        context: context,
      builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Update"),
            content: Container(
              child: TextField(
                maxLines: 2,
                controller: editController,
                decoration: InputDecoration(
                  hintText: "Update your post",
                  border: OutlineInputBorder(

                  )
                ),
              ),
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Cancel")),
              TextButton(onPressed: (){
                ref.child(id).update({
                  'title': editController.text.toLowerCase(),
                }).then((value) {
                  Utils.showErrorToast("Updated Successfully");
                }).onError((error, stackTrace) {
                  Utils.showErrorToast(error.toString());
                });
                Navigator.pop(context);
              }, child: Text("Update")),
            ],
          );
      },


    );
  }
}
