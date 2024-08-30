import 'package:chat_app/Authentication/sign_up_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Home/home_page.dart';
import '../controller/auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key ?key}) : super(key: key);
  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends ConsumerState<LoginPage> {
  final RegExp emailvalidator =
  RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  // Future Login() async {
  //   if(username!.text!=''&&password!.text!=''){
  //
  //     final user = await auth.signInWithEmailAndPassword(
  //       email: username!.text,
  //       password: password!.text,
  //     );
  //     if (user == null) {
  //       return;
  //     }else{
  //       SharedPreferences preferences =await SharedPreferences.getInstance();
  //       preferences.setString('email', username!.text,);
  //       preferences.setString('password', password!.text,);
  //       currentuserId=user.user!.uid;
  //       await Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => HomePage(),
  //         ),
  //             (r) => false,
  //       );
  //     }
  //   }
  //
  // }
  bool ?passwordVisibility1;
  TextEditingController ?username;
  TextEditingController ?password;
  final auth = FirebaseAuth.instance;
  void initState(){
    super.initState();
    passwordVisibility1 = false;
    username=TextEditingController(text: '');
    password=TextEditingController(text: '');
  }
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff034a82),
      appBar: AppBar(
        backgroundColor: Color(0xff034a82),
        elevation: 0,
        title: Center(child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 25),)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15,top: 100),
              child: Container(
                  height: MediaQuery.of(context).size.height*.6,
                  decoration: BoxDecoration(
                      color: Colors.white,borderRadius: BorderRadius.circular(30)
                  ),

                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text('LOGIN',
                          style: TextStyle(fontSize: 25, color: Color(0xff034a82),fontWeight: FontWeight.bold),),
                      ),

                      SizedBox(height: 50,),
                      Padding(
                        padding:  EdgeInsets.only(left:w*0.07,right: w*0.07,bottom: 20),
                        child: Container(
                          color: Colors.white,
                          height: h*0.055,
                          width: w*0.8,
                          child: TextFormField(
                            controller: username,
                            cursorColor: Color(0xff034a82),
                            keyboardType: TextInputType.emailAddress,
                            decoration:  InputDecoration(hintText: 'user name',
                              labelText:'user name' ,
                              floatingLabelStyle: TextStyle(
                                  color:Color(0xff034a82)),
                              hoverColor: Color(0xff034a82),
                              focusColor: Color(0xff034a82),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff034a82),width: 2)
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left:w*0.07,right: w*0.07,bottom: 10),
                        child: Container(
                          height: h*0.055,
                          width: w*0.8,
                          child: TextFormField(
                            controller: password,
                            obscureText: !passwordVisibility1!,
                            cursorColor: Color(0xff034a82),
                            keyboardType: TextInputType.text,
                            decoration:  InputDecoration(hintText: 'Password',
                              labelText:'Password' ,
                              floatingLabelStyle: TextStyle(
                                  color: Color(0xff034a82)),
                              hoverColor: Color(0xff034a82),
                              focusColor: Color(0xff034a82),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff034a82),width: 2),
                              ),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                      () => passwordVisibility1 =
                                  !passwordVisibility1!,
                                ),
                                child: Icon(
                                  passwordVisibility1!
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                  size: 22,
                                ),
                              ),
                            ),

                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          if (username?.text!='' && password!.text!='') {
                            ref.read(authControllerProvider.notifier)
                                .loginUser(username!.text

                                .trim(),
                                password!
                                    .text
                                    .trim(),
                                context);
                          }
                          // Login();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.05,
                            width: MediaQuery.of(context).size.width*0.5,
                            decoration: BoxDecoration(color: Color(0xff034a82),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(child: Text('LOGIN',style: TextStyle(color: Colors.white,fontSize: 14),)),
                          ),
                        ),
                      )
                    ],

                  )
              ),
            )


          ],
        ),
      ),
    );
  }
}
