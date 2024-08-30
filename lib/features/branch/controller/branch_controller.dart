

import 'package:chat_app/core/common/typeDefs.dart';
import 'package:chat_app/features/branch/repository/branch_repository.dart';
import 'package:chat_app/model/branch/add_branch_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final branchControllerProvider = StateNotifierProvider<BranchController, bool>((ref) {
//   return BranchController(
//     branchRepository: ref.watch(branchRepositoryProvider),
//     ref: ref,
//   );
// });


final branchControllerProvider = StateNotifierProvider((ref) {
  return BranchController(branchRepository: ref.watch(branchRepositoryProvider), ref: ref);
});

final getBranchProvider= StreamProvider.autoDispose((ref) {
  final getRepBranch=ref.watch(branchControllerProvider.notifier);
  return getRepBranch.getBranch();
} );
class BranchController extends StateNotifier<bool>{
  final BranchRepository _branchRepository;
  final Ref _ref;

  BranchController({required BranchRepository branchRepository, required Ref ref})
      :_branchRepository = branchRepository, _ref = ref, super(false);

  addBranch(  {required BuildContext context, required BranchModel branchModel}){
 _branchRepository.addBranch( context: context,branchModel: branchModel,);


  }
  Stream<List<BranchModel>>getBranch(){
    // final shopId=currentshopId;
    return
      // ref.watch(productRepositoryProvider).getProducts();
      _branchRepository.getBranch();
  }


}