import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../Home/home_page.dart';
import '../main.dart';
import 'Login_widget.dart';
String currentuserId='';

void showUploadMessage(BuildContext context, String message,
    {bool showLoading = false}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: showLoading?Duration(minutes: 30):Duration(seconds: 4),
        content: Row(
          children: [
            if (showLoading)
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: CircularProgressIndicator(),
              ),
            Text(message,style: GoogleFonts.poppins(color: Colors.blue),),
          ],
        ),
      ),
    );
}
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool? passwordVisibility1;
  TextEditingController? username;
  TextEditingController? phoneno;
  TextEditingController ?password;
  TextEditingController ?email;
  void initState(){
    super.initState();
    passwordVisibility1 = false;
    username=TextEditingController(text: '');
    phoneno=TextEditingController(text: '');
    email=TextEditingController(text: '');
    password=TextEditingController(text: '');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset('assets/images/6.jpg').image,fit: BoxFit.fill
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 5,),
              SizedBox(height: 1,),

              Padding(
                padding: const EdgeInsets.only(right: 200.0,top: 20),
                child: Text('Create \nAccount',
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),),
              ),
              SizedBox(height: 5,),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 28.0,right: 28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextFormField(
                      controller: username,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.person,color: Color(0xff165f80),),
                          hintText: 'Name',hintStyle: TextStyle(color: Color(0xff165f80), ),
                          labelText: 'Name ',labelStyle: TextStyle(color:Color(0xff165f80))
                      ),
                    ),
                    SizedBox(height: 9,),
                    TextFormField(
                      controller: phoneno,
                      validator: (value){
                        if(phoneno!.text.length<10){
                          return 'Enter valid phone number';
                        }else{
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          icon: Icon(Icons.phone_android,color: Color(0xff165f80),),
                          hintText: 'Moblie No',hintStyle: TextStyle( color:Color(0xff165f80),),
                          labelText: 'Moblie No ',labelStyle: TextStyle(color:Color(0xff165f80))
                      ),
                    ),
                    SizedBox(height: 9,),
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.email,color: Color(0xff165f80)),
                          hintText: 'Email',hintStyle: TextStyle( color:Color(0xff165f80),),
                          labelText: 'Email',labelStyle: TextStyle(color:Color(0xff165f80))
                      ),
                    ),
                    SizedBox(height: 9,),
                    TextFormField(
                      controller: password,
                      obscureText: !passwordVisibility1!,
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0xff0080ff),
                      decoration:  InputDecoration(
                        icon: Icon(Icons.lock_outline,color: Color(0xff165f80)),
                        hintText: 'Password',hintStyle: TextStyle( color:Color(0xff165f80),),
                        labelText: 'Password',labelStyle: TextStyle(color:Color(0xff165f80)),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                                () => passwordVisibility1 =
                            !passwordVisibility1!,
                          ),
                          child: Icon(
                            passwordVisibility1!
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(0xff0080ff),
                            size: 22,
                          ),
                        ),

                      ),

                    ),
                    SizedBox(height: 5,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('Forgot Password ?',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color:Colors.blue,),),
                    ),
                    SizedBox(height: 30,),
                    InkWell(
                      onTap: () {
                        if (username!.text!='' && password!.text!='' &&email!.text!='' &&phoneno!.text!=''&&email!.text.contains("@") ) {
                          FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: email!.text, password: password!.text)
                              .then((user) async {
                            currentuserId=user.user!.uid;

                              FirebaseFirestore.instance.collection('users').doc(user.user!.uid).set(
                                  {
                                    'userName':username!.text,
                                    'phNumber':phoneno!.text??'',
                                    'email':email!.text,
                                    'imgurl':'',
                                    'userId':user.user!.uid!,

                                    'created_time':FieldValue.serverTimestamp(),

                                  });

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(
                                      "user added successfully")));
                               Navigator.pop(context);
                              // print("111111111111");
                               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage(),), (route) => false);
                          });
                        }else{
                          username!.text==''? showUploadMessage(context,'Please enter username'):
                          password!.text==''?showUploadMessage(context,'Please enter password'):
                          email!.text==''?showUploadMessage(context,'Please enter emailaddress'):
                          phoneno!.text==''?showUploadMessage(context,'Please enter your phonenumber'):
                          showUploadMessage(context,'Please enter valid email id');
                        }
                      },

                      child: Container(
                        height: MediaQuery.of(context).size.height*0.052,
                        width: MediaQuery.of(context).size.width*0.75,
                        decoration: BoxDecoration(  color: Color(0xff0080ff),
                            borderRadius: BorderRadius.circular(10),
                            border:Border.all(color: Colors.white)
                        ),

                        child: Center(child: Text('Sign Up',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,),),),
                      ),
                    ),
                    SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account ?',
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0080ff)),),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage(

                            )));
                          },
                          child: Text('Log In',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color:Colors.blue,),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}

