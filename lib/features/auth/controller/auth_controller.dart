import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Home/home_page.dart';
import '../../../core/common/utils.dart';
import '../repository/auth_repository.dart';

// final authControllerProvider = StateNotifierProvider<AuthController, bool>((ref) {
//   return AuthController(
//     authRepository: ref.watch(authRepositoryProvider),
//     ref: ref,
//   );
// });
final authControllerProvider = StateNotifierProvider<AuthController, bool>(
      (ref) => AuthController(authRepository: ref.watch(authRepositoryProvider), ref: ref,),);

final nicknameProvider = StateProvider((ref) => "");

class AuthController  extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;

  AuthController({required AuthRepository authRepository, required Ref ref,})
      : _authRepository = authRepository,
        _ref = ref,
        super(false);

  Future<void> loginUser(String username,
      String password,
      BuildContext context,) async {
    state = true;

    try {
      // final usermodel = UserModel(
      //   email: email,
      //   password: password,
      // );
      final res = await _authRepository.loginUser(
          username: username, password: password);

      // _ref.read(userproviders.notifier).update((state) => usermodel);

      res.fold((l) {
        state = false;
        showSnackBarMsg(context, l.message);
      }, (user) async {

        print(user);
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString("id", usermodel.id!);

        // _ref
        //     .read(nicknameProvider.notifier)
        //     .state = user.nickName.toString();

        state = false;
        showSnackBarMsg(context, 'Login Successfully Completed');
        // if (((user.verified ?? false) == true)) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
                  (route) => false);
        // }
      });
    } catch (e) {
      state = false;

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login Error")));
    }
  }
}