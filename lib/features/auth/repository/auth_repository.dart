import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Authentication/sign_up_widget.dart';
import '../../../core/common/failure.dart';
import '../../../core/firebase_providers/firebase_providers.dart';
import '../../../core/local/local.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(firestore: ref.watch(firestoreProvider),
    auth: ref.watch(authprovider),
    // googleSignIn: ref.watch(googleprovider)
));

class AuthRepository{
    final FirebaseFirestore _firestore;
    final FirebaseAuth _auth;
    AuthRepository({required FirebaseFirestore firestore, required FirebaseAuth auth,
    }) :        _firestore = firestore, _auth = auth;


    Future loginUser({required String username, required String password}  ) async {
        try{
            if(username!=''&&password!=''){

                final user = await _auth.signInWithEmailAndPassword(
                    email: username,
                    password: password,
                );
                if (user == null) {
                    return;
                }else{
                    SharedPreferences preferences =await SharedPreferences.getInstance();
                    preferences.setString('email', username,);
                    preferences.setString('password', password,);
                    preferences.setString('userId', user.user!.uid,);
                    currentuserId=user.user!.uid;
                    // await Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => HomePage(),
                    //     ),
                    //         (r) => false,
                    // );

                }

            }
            return right(username);
        }on FirebaseException catch (e) {
            throw e.message ?? '';
        } catch (e) {
            return left(Failure(""));
        }


    }

}