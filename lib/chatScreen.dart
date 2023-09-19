import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Authentication/sign_up_widget.dart';
import 'Home/home_page.dart';


class ChatScreen extends StatefulWidget {
  final String userId;
  const ChatScreen({Key ?key, required this.userId,}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController? message;
  List msgList=[];
  String name='';
  // updateSeen() async {
  //   FirebaseFirestore.instance.collection('feedback').
  //   doc(widget.userId).snapshots().listen((event) {
  //     msgList=event.get('chat');
  //     name=event.get('userName');
  //
  //
  //
  //     for(var item in msgList){
  //       if(item['sender']==0 && item['seen']==false){
  //
  //         item['seen']=true;
  //         FirebaseFirestore.instance.collection('feedback').doc(widget.userId).update({
  //
  //           'chat':msgList,
  //           // item['seen']:true,
  //           //'adress': deliveryAddress,
  //         });
  //       }
  //     }
  //     if(mounted){
  //       setState(() {
  //
  //       });
  //     }
  //   });
  //
  //
  // }
  @override
  void initState() {
    message = TextEditingController(text: '');

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // updateSeen();
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor:primaryColor,
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.82,
            child: ListView(
              reverse: true,
              children: [
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('messages').snapshots(),
                    builder: (context, snapshot) {

                      if(!snapshot.hasData){
                        return  Center(child: CircularProgressIndicator());
                      }
                      var data=snapshot.data!.docs;
                      if(data.length==0){
                        return const Center(
                          child: Text('No messages found',),
                        );
                      }
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (context, index) {

                            return data[index]['userId'] == currentuserId?
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 10,
                                  top: 5,
                                  bottom: 5),
                              child: Align(
                                alignment: Alignment.centerRight,

                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade50,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      )
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                    child: Text(data[index]['msg'],style: GoogleFonts.poppins(color: primaryColor),),
                                  ),
                                ),
                              ),
                            ):  Padding(
                              padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 10,
                                  top: 5,
                                  bottom: 5),
                              child: Align(
                                alignment: Alignment.centerLeft,

                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade50,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      )
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                    child: Text(data[index]['msg'],style: GoogleFonts.poppins(color: primaryColor),),
                                  ),
                                ),
                              ),
                            );
                          }
                      );
                    }
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.74,
                  height: MediaQuery.of(context).size.height*0.055,
                  decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.6,
                          height: MediaQuery.of(context).size.height*0.05,
                          child: TextFormField(
                            controller: message,
                            cursorColor: Color(0xff034a82),
                            keyboardType: TextInputType.text,
                            decoration:  InputDecoration(hintText: 'Message',


                              floatingLabelStyle: TextStyle(
                                  color:Color(0xff034a82)),
                              hoverColor: Color(0xff034a82),
                              focusColor: Color(0xff034a82),

                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 60,),

              InkWell(

                onTap: () async {


                  if(message!.text!='')
                  {
                    FirebaseFirestore.instance.collection('messages').add({
                      'image':'',
                      'msg':message!.text,
                      'time':DateTime.now(),
                      'userId':currentuserId

                    });

                    setState(() {
                    });
                    // NotificationApi.showNotification(
                    //   title:'hi',
                    //   body:'iam okay',
                    //   payload:'test',
                    // );

                    message!.clear();

                  }else{
                    showUploadMessage(context,'Please enter your message');
                  }
                },

                child: CircleAvatar(
                    radius:23
                    ,child: Icon(Icons.send,size: 30,)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

