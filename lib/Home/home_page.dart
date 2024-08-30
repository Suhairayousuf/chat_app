import 'package:chat_app/Authentication/sign_up_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../chatScreen.dart';
import '../core/constant/images.dart';
import '../core/local/local.dart';
import '../core/pallette/pallete.dart';
// Color primaryColor= Color(0xff034a82);
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: primaryColor,
        elevation: 0,
        title:Text('Home',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 08.0),
            child: IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(
                    userId: currentuserId,
                  )));

                      }, icon: Icon(Icons.message)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0,left: 20,right: 20),
        child: Container(
          child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              children: [
                InkWell(
                  onTap: (){
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => CharityCatogoryPage()));
                  },
                  child: Container(
                    height:100,
                    width: 100,
                    decoration: BoxDecoration( color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            maxRadius: 45,
                            backgroundColor:primaryColor,
                            child: Image.asset(ImageConstants.add,color:Colors.white,height: 70,width: 70,)),
                        SizedBox(height: 10,),
                        Text('Add',style: TextStyle(fontFamily: 'Outfit',fontSize: 25,fontWeight: FontWeight.bold,color:primaryColor),)
                      ],
                    ),

                  ),
                ),




              ]

          ),
        ),
      ),
      // body: StreamBuilder<QuerySnapshot>(
      //     stream: FirebaseFirestore.instance.collection('users').snapshots(),
      //     builder: (context, snapshot) {
      //       if(!snapshot.hasData){
      //         return const CircularProgressIndicator();
      //       }
      //       var data=snapshot.data!.docs;
      //       return ListView.builder(
      //           itemCount: data.length,
      //           itemBuilder: (context, index) {
      //             return Padding(
      //               padding: const EdgeInsets.all(12.0),
      //               child: Card(
      //                 color: Colors.blue.shade50,
      //                 child: Container(
      //                   height: MediaQuery.of(context).size.height*0.09,
      //                   width: MediaQuery.of(context).size.width*0.7,
      //                   decoration: BoxDecoration(
      //                       color: Colors.blue.shade50,
      //                       // border:Border.all(color: primaryColor),
      //                       borderRadius: BorderRadius.circular(10)
      //                   ),
      //                   child: Padding(
      //                     padding: const EdgeInsets.only(left: 8.0),
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Text('Name:  '+data[index]['userName'].toString(),style: TextStyle(color: primaryColor,fontSize: 15),),
      //                         Text('PhoneNo:  '+data[index]['phNumber'].toString(),style: TextStyle(color: primaryColor),),
      //
      //
      //                       ],
      //                     ),
      //                   ),
      //
      //                 ),
      //               ),
      //             );
      //
      //           }
      //       );
      //     }
      // ),

    );
  }
}
