import 'package:chat_app/features/branch/screen/add_branch.dart';
import 'package:chat_app/features/branch/screen/edit_branch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Authentication/sign_up_widget.dart';
import '../../../core/constant/images.dart';
import '../../../core/local/local.dart';
import '../../../core/pallette/pallete.dart';
import '../controller/branch_controller.dart';

class BranchList extends ConsumerStatefulWidget {
  const BranchList({Key? key}) : super(key: key);

  @override
  ConsumerState<BranchList> createState() => _BranchListState();
}

class _BranchListState extends ConsumerState<BranchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: primaryColor,
        elevation: 0,
        title:Text('Branches',
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
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(
                  //   userId: currentuserId,
                  // )));

                }, icon: Icon(Icons.message)),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final branchList = ref.watch(getBranchProvider);
                return branchList.when(
                  data: (data) {
                    if (data.isEmpty) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1.5, // Adjust this value to control item size
                      ),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5, // Add elevation for shadow
                            child: InkWell(
                              onTap: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditBranchWidget(
                                  branchName:data[index].branchName,
                                  branchEmail:data[index].branchName,
                                  branchAddress:data[index].branchName,
                                  phNo:data[index].branchName,
                                ),));
                              },
                              child: Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.deepPurple,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          data[index].branchName,
                                          style: GoogleFonts.poppins(
                                            color: Colors.deepPurple,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) {
                    return Text(error.toString());
                  },
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                );
              },
            ),
          ),
          Container(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddBranch()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: 45,
                      backgroundColor: primaryColor,
                      child: Image.asset(
                        ImageConstants.add,
                        color: Colors.white,
                        height: 70,
                        width: 70,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Add',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )

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
