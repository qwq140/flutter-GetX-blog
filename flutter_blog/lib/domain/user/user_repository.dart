import 'package:flutter_blog/controller/dto/CMRespDto.dart';
import 'package:flutter_blog/controller/dto/LoginReqDto.dart';
import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공!! => json => Dart 오브젝트
class UserRepository {
  final UserProvider _userProvider = UserProvider(); // _ : private

  Future<User> login(String username, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(username, password);

    Response response = await _userProvider.login(loginReqDto.toJson());
    dynamic headers = response.headers;
    dynamic body = response.body;
    //print("사용자 정보 : $body");
    CMRespDto cmRespDto = CMRespDto.formJson(body);

    if (cmRespDto.code == 1) {
      User principal = User.formJson(cmRespDto.data);

      String token = headers["authorization"];

      jwtToken = token;
      print("jwtToken : $jwtToken");

      return principal;
    } else {
      return User();
    }

    // if (headers["authorization"] == null) {
    //   return "-1";
    // } else {
    //   String token = headers["authorization"];
    //   return token;
    // }
  }
}
