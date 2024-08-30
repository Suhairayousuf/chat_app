import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/common/failure.dart';
import '../../../core/common/typeDefs.dart';
import '../../../core/constant/firebase_constants/firebase_Constants.dart';
import '../../../core/firebase_providers/firebase_providers.dart';
import '../../../model/branch/add_branch_model.dart';

final branchRepositoryProvider = Provider((ref) => BranchRepository(firestore: ref.watch(firestoreProvider),
    )
);
class BranchRepository{
    final FirebaseFirestore _firestore;


  BranchRepository({required FirebaseFirestore firestore, }) : _firestore = firestore;
  CollectionReference get _branch =>
      _firestore.collection(FirebaseConstants.branch);


  // FutureVoid addBranch({required BranchModel branchModel,})
  // async {try {
  //   print('branchModel');
  //   print(branchModel);
  //
  //     return right(_branch.add(branchModel.toJson()).then((value) {
  //
  //       value.update({
  //         'branchId': value.id,
  //       });
  //       // Navigator.pushReplacement(
  //       //     context,
  //       //     MaterialPageRoute(
  //       //         builder: (context) =>
  //       //             AddMembersPage(bookData: bookModel.copyWith(bookId: value.id))));
  //     }));
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //     throw e.message!;
  //   } catch (e) {
  //     print(e);
  //     return left(Failure(e.toString()));
  //   }
  // }
    addBranch({required BuildContext context,required BranchModel branchModel}) {
      try {
        print(branchModel.email);
        print("branchModel.email");
        return right(
            _branch.add(branchModel.toJson())
                .then((value) {

              value.update({
                'branchId': value.id,
              });
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             AddMembersPage(bookData: bookModel.copyWith(bookId: value.id))));
            }));

      } on FirebaseException catch (e) {
        throw e.message!;
      } catch (e) {
        return left(Failure(e.toString()));
      }
    }
    Stream<List<BranchModel>> getBranch() {
      return  _firestore.collection(FirebaseConstants.branch)
          .snapshots()
          .map((event) =>
          event.docs.map((e) => BranchModel.fromJson(e.data() )).toList());



    }
}

