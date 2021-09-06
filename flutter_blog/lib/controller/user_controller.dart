import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; // UI가 관찰 가능한 변수 => 변경 => UI가 자동 업데이트
  final principal = User().obs;

  void logout() {
    isLogin.value = false;
    jwtToken = null;
    // Get.storage()에 담으면 휴대폰에 저장하기 때문에 로그인을 유지할 수 있음.(token 유효기간동안)
  }

  Future<int> join(String username, String password, String email) async {
    User user = await _userRepository.join(username, password, email);

    if (user.id != null) {
      return 1;
    } else {
      return -1;
    }
  }

  Future<int> login(String username, String password) async {
    User principal = await _userRepository.login(username, password);

    if (principal.id != null) {
      this.isLogin.value = true;
      this.principal.value = principal;
      return 1;
    } else {
      return -1;
    }
  }
}
