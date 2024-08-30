import 'package:chat_app/features/branch/screen/branch_list.dart';
import 'package:chat_app/model/branch/add_branch_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Authentication/sign_up_widget.dart';

import '../../../core/common/utils.dart';
import '../../../core/local/local.dart';
import '../../../core/pallette/pallete.dart';
import '../controller/branch_controller.dart';

class AddBranch extends ConsumerStatefulWidget {
  const AddBranch({Key? key}) : super(key: key);

  @override
  ConsumerState<AddBranch> createState() => _AddBranchState();
}

class _AddBranchState extends ConsumerState<AddBranch> {
  TextEditingController branchName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController branchAddress = TextEditingController();
  TextEditingController email = TextEditingController();
  final RegExp emailvalidator = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  List <dynamic> admins1 = [];
  addBranch(BuildContext context, BranchModel branchDetailes){
    ref.read(branchControllerProvider.notifier).addBranch(context: context,branchModel: branchDetailes);



  }
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: w*0.05,),SizedBox(height: w*0.05,),
              TextFormField(
                controller:
                branchName,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(
                      vertical:
                      w * 0.03,
                      horizontal:
                      w * 0.02),
                  hintText: "Branch Name",
                  labelText: "Branch Name",
                  hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color:
                    const Color(0xFF6F6F6F),
                  ),
                  labelStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color:
                    const Color(0xFF6F6F6F),
                  ),
                  focusColor: Color.fromRGBO(
                      111, 111, 111, 1),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xFF6F6F6F)),
                    borderRadius:
                    BorderRadius.circular(
                        w * 0.03),
                  ),
                  focusedBorder:
                  OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xFF6F6F6F)),
                    borderRadius:
                    BorderRadius.circular(
                        w * 0.03),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors
                            .red), // Customize the error border color
                    borderRadius:
                    BorderRadius.circular(
                        w * 0.03),
                  ),
                  errorStyle: const TextStyle(
                      fontSize:
                      12), // Customize the error text style
                ),
                keyboardType:
                TextInputType.text,
                autovalidateMode: AutovalidateMode
                    .onUserInteraction,
                // validator: (value) {
                //   if (value!.trim().isEmpty ||
                //       !emailvalidator.hasMatch(
                //           value.trim())) {
                //     return "Enter valid Email";
                //   } else {
                //     return null;
                //   }
                // },
              ),
              SizedBox(height: w*0.05,),
              TextFormField(
                controller:
                phoneNumber,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(
                      vertical:
                      w * 0.03,
                      horizontal:
                      w * 0.02),
                  hintText: "Phone Number",
                  labelText: "Phone Number",
                  hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color:
                    const Color(0xFF6F6F6F),
                  ),
                  labelStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color:
                    const Color(0xFF6F6F6F),
                  ),
                  focusColor: Color.fromRGBO(
                      111, 111, 111, 1),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xFF6F6F6F)),
                    borderRadius:
                    BorderRadius.circular(
                        w * 0.03),
                  ),
                  focusedBorder:
                  OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xFF6F6F6F)),
                    borderRadius:
                    BorderRadius.circular(
                        w * 0.03),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors
                            .red), // Customize the error border color
                    borderRadius:
                    BorderRadius.circular(
                        w * 0.03),
                  ),
                  errorStyle: const TextStyle(
                      fontSize:
                      12), // Customize the error text style
                ),
                keyboardType:
                TextInputType.phone,
                autovalidateMode: AutovalidateMode
                    .onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter phone number';
                  }
                  // Regular expression to validate phone numbers
                  String pattern = r'^\d{10}$';
                  RegExp regExp = new RegExp(pattern);
                  if (!regExp.hasMatch(value)) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
                // validator: (value) {
                //   if (value!.trim().isEmpty ||
                //       !emailvalidator.hasMatch(
                //           value.trim())) {
                //     return "Enter valid Email";
                //   } else {
                //     return null;
                //   }
                // },
              ),

              SizedBox(height: w*0.05,),
              TextFormField(
                controller:
                email,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(
                      vertical:
                      w * 0.03,
                      horizontal:
                      w * 0.02),
                  hintText: "Email Id",
                  labelText: "Email Id",
                  hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color:
                    const Color(0xFF6F6F6F),
                  ),
                  labelStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color:
                    const Color(0xFF6F6F6F),
                  ),
                  focusColor: Color.fromRGBO(
                      111, 111, 111, 1),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xFF6F6F6F)),
                    borderRadius:
                    BorderRadius.circular(
                        w * 0.03),
                  ),
                  focusedBorder:
                  OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xFF6F6F6F)),
                    borderRadius:
                    BorderRadius.circular(
                        w * 0.03),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors
                            .red), // Customize the error border color
                    borderRadius:
                    BorderRadius.circular(
                        w * 0.03),
                  ),
                  errorStyle: const TextStyle(
                      fontSize:
                      12), // Customize the error text style
                ),
                keyboardType:
                TextInputType.text,
                autovalidateMode: AutovalidateMode
                    .onUserInteraction,
                validator: (value) {
                  if (value!.trim().isEmpty ||
                      !emailvalidator.hasMatch(
                          value.trim())) {
                    return "Enter valid Email";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: w*0.05,),
              TextFormField(
                controller:
                branchAddress,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(
                      vertical:
                      w * 0.03,
                      horizontal:
                      w * 0.02),
                  hintText: "branch Address",
                  labelText: "branch Address",
                  hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color:
                    const Color(0xFF6F6F6F),
                  ),
                  labelStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color:
                    const Color(0xFF6F6F6F),
                  ),
                  focusColor: Color.fromRGBO(
                      111, 111, 111, 1),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xFF6F6F6F)),
                    borderRadius:
                    BorderRadius.circular(
                        w * 0.03),
                  ),
                  focusedBorder:
                  OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xFF6F6F6F)),
                    borderRadius:
                    BorderRadius.circular(
                        w * 0.03),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors
                            .red), // Customize the error border color
                    borderRadius:
                    BorderRadius.circular(
                        w * 0.03),
                  ),
                  errorStyle: const TextStyle(
                      fontSize:
                      12), // Customize the error text style
                ),
                keyboardType:
                TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode
                    .onUserInteraction,
                // validator: (value) {
                //   if (value!.trim().isEmpty ||
                //       !emailvalidator.hasMatch(
                //           value.trim())) {
                //     return "Enter valid Email";
                //   } else {
                //     return null;
                //   }
                // },
              ),
              // SizedBox(height: w*0.05,),
              // Container(
              //   child: ListView.builder(
              //       shrinkWrap: true,
              //       physics: BouncingScrollPhysics(),
              //       padding: EdgeInsets.zero,
              //       scrollDirection: Axis.vertical,
              //       itemCount: admins1.length+1,
              //       itemBuilder: (context,index){
              //         TextEditingController admin$index=TextEditingController();
              //         TextEditingController password$index=TextEditingController();
              //         admin$index.text=index==(admins1.length)?"":admins1[index];
              //         return Container(
              //           decoration: BoxDecoration(
              //             color: Colors
              //                 .transparent,
              //             // borderRadius: BorderRadius.circular(10),
              //             // border: Border.all(
              //             //   color:primarycolor,
              //             // ),
              //           ),
              //           child: Row(
              //             mainAxisSize: MainAxisSize.max,
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Expanded(
              //                 flex: 1,
              //                 child:   Container(
              //                   width: w*0.42,
              //                   height: textFormFieldHeight45,
              //                   decoration: BoxDecoration(
              //                     color: Colors.white,
              //
              //                   ),
              //                   child: Padding(
              //                     padding: const EdgeInsets
              //                         .fromLTRB(16, 0, 0, 0),
              //                     child: TextFormField(
              //                       keyboardType: TextInputType.emailAddress,
              //                       controller: admin$index,
              //                       validator: (value) {
              //                         if (value!.trim().isEmpty ||
              //                             !emailvalidator.hasMatch(
              //                                 value.trim())) {
              //                           return "Enter valid Email";
              //                         } else {
              //                           return null;
              //                         }
              //                       },
              //                       // inputFormatters: <TextInputFormatter>[
              //                       //   LengthLimitingTextInputFormatter(10),
              //                       // ],
              //                       obscureText: false,
              //                       decoration: InputDecoration(
              //                         labelText: 'Add admin email',
              //                         labelStyle: GoogleFonts.montserrat
              //                           (color: primaryColor,
              //                           fontWeight: FontWeight
              //                               .w500,),
              //
              //                         hintText:
              //                         'Admin Email',
              //                         hintStyle:GoogleFonts.montserrat( color: primaryColor,
              //                           fontWeight: FontWeight
              //                               .w500, )
              //                         ,
              //                         enabledBorder: OutlineInputBorder(
              //                           borderSide: BorderSide(
              //                             color: primaryColor,
              //
              //                           ),
              //                           borderRadius: BorderRadius.circular(12),
              //                         ),
              //                         focusedBorder: OutlineInputBorder(
              //                           borderSide: BorderSide(
              //                             color:  primaryColor,
              //
              //                           ),
              //                           borderRadius: BorderRadius.circular(12),
              //                         ),
              //                         filled: true,
              //                         fillColor: Colors.white,
              //                       ),              style:GoogleFonts.montserrat(
              //
              //                       color: primaryColor,
              //                       fontWeight: FontWeight
              //                           .w500,
              //                     ),
              //                     ),
              //                   ),
              //                 ),
              //
              //
              //
              //
              //               ),
              //               // index==(admins1.length)?Center(
              //               //   child: VerticalDivider(
              //               //     thickness: 1,
              //               //     color: primarycolor,
              //               //   ),
              //               // ):Container(),
              //
              //               IconButton(
              //                   onPressed: () async {
              //                     if(admin$index.text!=null&&admin$index.text!=''){
              //                       if(index==(admins1.length)){
              //                         admins1.add(admin$index.text);
              //
              //                         setState(()   {
              //                         });
              //                       }
              //                       else{
              //
              //                         admins1.removeAt(index);
              //                         setState(() {
              //                         });
              //                       }
              //                     }else{
              //                       showUploadMessage(context, "Please Add Admin Email");
              //                     }
              //                     setState(() {
              //                     });
              //                   },
              //                   icon: index==(admins1.length)?CircleAvatar(
              //                       radius: 20,
              //                       backgroundColor: primaryColor,
              //
              //                       child: Icon(Icons.add,color: Colors.white,)):
              //                   Icon(Icons.delete,color: primaryColor,))
              //             ],
              //           ),
              //         );
              //       }),
              // ),

              SizedBox(height: w*0.2,),
              InkWell(
                onTap: () async {
                  if(branchName.text!='' && phoneNumber.text!=''
                      &&branchAddress.text!=''
                      &&email.text!=''){
                    final pressed = await alert(context, 'Do you want to add this branch');
                    if(pressed){

                      final branchDetailes = BranchModel(
                          branchName: branchName.text.trim(),
                          date: DateTime.now(),
                          admins: [],
                          branchId: '',
                          branchAddress: branchAddress.text.trim(),
                          email: email.text.trim(),
                          block:false,
                          delete:false,
                          phoneNumber: phoneNumber.text.trim()

                      );
                      await addBranch(context, branchDetailes);
                      phoneNumber.text="";
                      branchAddress.text="";
                      branchName.text="";
                      email.text="";
                      // admins1=[];
                      showUploadMessage(context,
                          'Branch added suceesfully',);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>BranchList()));



                    }
                  }

                },
                child: Container(
                  height: textFormFieldHeight45,
                  width: w*0.9,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(21.5)),
                  child: Center(
                    child: Text(
                      "Add",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Urbanist',
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
