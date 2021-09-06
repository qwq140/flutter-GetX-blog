// 서버는 컴퓨터에서 실행되고 있으므로 컴퓨터의 ip를 입력
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

const host = "http://172.30.1.39:8080";

// 통신
class PostProvider extends GetConnect {
  // Promise (데이터 약속)
  Future<Response> findAll() =>
      get("$host/post", headers: {"Authorization": jwtToken ?? ""});

  Future<Response> findById(int id) =>
      get("$host/post/$id", headers: {"Authorization": jwtToken ?? ""});

  Future<Response> deleteById(int id) =>
      delete("$host/post/$id", headers: {"Authorization": jwtToken ?? ""});

  Future<Response> updateById(int id, Map data) =>
      put("$host/post/$id", data, headers: {"Authorization": jwtToken ?? ""});

  Future<Response> save(Map data) =>
      post("$host/post", data, headers: {"Authorization": jwtToken ?? ""});
}
