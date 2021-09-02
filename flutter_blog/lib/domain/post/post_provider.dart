// 서버는 컴퓨터에서 실행되고 있으므로 컴퓨터의 ip를 입력
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

const host = "http://172.30.1.39:8080";

// 통신
class PostProvider extends GetConnect {
  // Promise (데이터 약속)
  Future<Response> findAll() =>
      get("$host/post", headers: {"Authorization": jwtToken ?? ""});
}
