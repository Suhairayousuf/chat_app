import 'package:chat_app/Authentication/sign_up_widget.dart';
import 'package:chat_app/core/constant/images.dart';
import 'package:chat_app/features/branch/screen/branch_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Home/home_page.dart';
import '../../../core/local/local.dart';
import '../../../core/pallette/pallete.dart';
import '../../branch/screen/add_branch.dart';
import 'Login_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getMail() async {
    SharedPreferences localStorage =await SharedPreferences.getInstance();
    currentuserId=localStorage.getString('userId')!;

  }
  void initState() {
    getMail();
    // updateDoctors();



    Future.delayed(const Duration(seconds: 3)).then((value) {
      if(currentuserId==''){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoginPage(
                  // data: doctor,
                  // signWithGoogle: true,
                )));
      }else{
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BranchList(
                  // data: doctor,
                  // signWithGoogle: true,
                )));
      }



      // ref.read(authControllerProvider.notifier).keepLogin(context);
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    textFormFieldHeight45=w * 0.09;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: w * 0.4,
              height: h * 0.3,
              color: Colors.white,
              child: Lottie.asset(ImageConstants.splash),
            ),
          ),
          const CircularProgressIndicator(color: primaryColor,)
        ],
      ),
    );
  }
}
