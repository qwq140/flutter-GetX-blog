import 'package:flutter_blog/controller/dto/CMRespDto.dart';
import 'package:flutter_blog/controller/dto/LoginReqDto.dart';
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:flutter_blog/util/convert_utf8.dart';
import 'package:get/get.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공!! => json => Dart 오브젝트
class PostRepository {
  final PostProvider _postProvider = PostProvider(); // _ : private

  Future<List<Post>> findAll() async {
    Response response = await _postProvider.findAll();
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.formJson(body);
    // print(cmRespDto.code);
    // print(cmRespDto.msg);
    // print(cmRespDto.data.runtimeType);

    if (cmRespDto.code == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.formJson(post)).toList();
      return posts;
    } else {
      // List<Post> hello = [];
      return <Post>[];
    }
  }
}
