import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:http/http.dart' as http;

import '../pallette/pallete.dart';

void showSnackBarMsg(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
}

void snackbarDialouge(
    {required BuildContext context,
    required String text,
    required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Stack(clipBehavior: Clip.none, children: [
      Container(
        padding: EdgeInsets.all(12),
        child: Row(children: [
          SizedBox(
            width: 48,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "success",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Spacer(),
              Text(
                text,
                style: TextStyle(fontSize: 18, color: Colors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ))
        ]),
        height: 80,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      Positioned(
          left: 20,
          top: 30,
          child: Icon(
            Icons.circle,
            size: 24,
            color: color,
          )),
      Positioned(
          left: 0,
          top: -20,
          child: Icon(
            Icons.circle,
            size: 40,
            color: Colors.red[400],
          )),
      Positioned(
          left: 8,
          top: -12,
          child: Icon(
            Icons.close,
            size: 24,
            color: Colors.white,
          ))
    ]),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
  ));
}

// Future<FilePickerResult?> pickImage() async {
//   final image = await FilePicker.platform.pickFiles(type: FileType.image);
//
//   return image;
// }
///  alert dailouge
Future<bool> alert(BuildContext context, String message,) async {
  bool result=  await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0)
        ),
        title: const Text('Are you sure ?'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: (){
              Navigator.of(context, rootNavigator: true).pop(false);
            },
            child: const Text(
                'No',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                )
            ),
          ),
          TextButton(
            onPressed: (){
              Navigator.of(context, rootNavigator: true).pop(true);
            },
            child: const Text(
                'Yes',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                )
            ),
          )
        ],
      )
  );
  return result;
}



setSearchParam(String caseNumber) {
  List<String> caseSearchList = <String>[];
  String temp = "";

  List<String> nameSplits = caseNumber.split(" ");
  for (int i = 0; i < nameSplits.length; i++) {
    String name = "";

    for (int k = i; k < nameSplits.length; k++) {
      name = "$name${nameSplits[k]} ";
    }
    temp = "";

    for (int j = 0; j < name.length; j++) {
      temp = temp + name[j];
      caseSearchList.add(temp.toUpperCase());
    }
  }
  return caseSearchList;
}

void showUploadMessage(BuildContext context, String message,
    {bool showLoading = false}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration:
            showLoading ? const Duration(minutes: 30) : Duration(seconds: 4),
        content: Row(
          children: [
            if (showLoading)
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              ),
            Text(message),
          ],
        ),
      ),
    );
}


/// MAIL CONTENTS

String mailConfirmationFormat({
  required String user,
  required String otp,
}) {
  String html = '<!DOCTYPE html>'
      '<html>'
      '<head>'
      '<title>Login confirmation OTP for Soulknob</title>'
      '<style>'
      'body {'
      'font-family: sans-serif;'
      '}'
      'h1 {'
      'font-size: 24px;'
      'font-weight: bold;'
      '}'
      'p {'
      'font-size: 16px;'
      '}'
      ' {'
      'olor: blue;'
      'ext-decoration: none;'
      '}'
      '</style>'
      '</head>'
      '<body>'
      '<h1>Login confirmation OTP for Soulknob</h1>'
      '<p>Hi $user,</p>'
      '<p>To confirm your login for Soulknob, please enter the following one-time password (OTP):</p>'
      '<p><strong>$otp</strong></p>'
      '<p>This OTP is valid for 15 minutes.</p>'
      '<p>If you did not request this OTP, please do not enter it and contact us immediately at <a href="mailto:info@soulknob.com">customer Service</a>.</p>'
      '<p>Thanks,</p>'
      '<p>The Soulknob Team</p>'
      '</body>'
      '</html>';

  return html;
}

sendOtp(String phone, String otp) async {
  Uri? url = Uri.tryParse(
      'https://control.msg91.com/api/v5/otp?template_id=653227b9d6fc05157a307432&mobile=91${phone}&otp=${otp}');

  final data = await http.post(url!, headers: {
    'accept': 'application/json',
    'authkey': '407631ATKWEENIGa6524fac5P1',
    'content-type': 'application/json'
  });

  print(
      '"""""""""""""""""""""""""""""""""""""data.body"""""""""""""""""""""""""""""""""""""');
  print(data.body);
  // curl --request POST \
  // --url 'https://control.msg91.com/api/v5/otp?template_id=653227b9d6fc05157a307432&mobile=918089410846&otp=525858' \
  // --header 'accept: application/json' \
  // --header 'authkey: 407631ATKWEENIGa6524fac5P1' \
  // --header 'content-type: application/json' \
  // --data '
  // {
  // "Param1": "value1",
  // "Param2": "value2",
  // "Param3": "value3"
  // }
  // '
}

String sendAppointmentConfirmation(
    {required String fullName,
    required String lastName,
    required String date,
    required String time}) {
  String mailFormat = ' <!DOCTYPE html>'
      '<html>'
      '<head>'
      ' <title>Appointment Confirmation</title>'
      '</head>'
      '<body>'
      '<table style="width: 100%; border-collapse: collapse; max-width: 600px; margin: 0 auto;">'
      '<tr>'
      '<td>'
      '<h1>Appointment Confirmation </h1>'
      '<p>Dear Dr. $lastName,</p>'
      '<p>I hope this message finds you well. We would like to confirm your upcoming appointment at Soulknob for a medical consultation.</p>'
      ' <h2>Appointment Details:</h2>'
      '<ul>'
      '<li>Date: $date</li>'
      '<li>Time: $time</li>'
      '</ul>'
      '<p>Your expertise and dedication in the field of medicine are highly valued, and we greatly appreciate your commitment to providing our employees with healthcare services.</p>'
      '<p>Please ensure your availability on the specified date and time. If, for any reason, you are unable to make it, kindly inform us as soon as possible so that we can make the necessary adjustments to our schedule.</p>'
      ' <p>We look forward to your time and appreciate your continued support in maintaining the health and well-being of our team.</p>'
      '<p>Sincerely,</p>'
      '<p>Soulknob<br>'
      '</td>'
      '</tr>'
      ' </table>'
      '</body>'
      '</html>';

  return mailFormat;
}
