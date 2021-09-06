import 'package:flutter_blog/controller/dto/CMRespDto.dart';
import 'package:flutter_blog/controller/dto/LoginReqDto.dart';
import 'package:flutter_blog/controller/dto/UpdateReqDto.dart';
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:flutter_blog/util/convert_utf8.dart';
import 'package:get/get.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공!! => json => Dart 오브젝트
class PostRepository {
  final PostProvider _postProvider = PostProvider(); // _ : private

  Future<Post> updateById(int id, String title, String content) async {
    UpdateReqDto updateReqDto = UpdateReqDto(title, content);
    Response response =
        await _postProvider.updateById(id, updateReqDto.toJson());
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.formJson(body);

    if (cmRespDto.code == 1) {
      Post post = Post.formJson(cmRespDto.data);
      return post;
    } else {
      return Post();
    }
  }

  Future<int> deleteById(int id) async {
    Response response = await _postProvider.deleteById(id);
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.formJson(body);

    return cmRespDto.code!;
  }

  Future<Post> findById(int id) async {
    Response response = await _postProvider.findById(id);
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.formJson(body);

    if (cmRespDto.code == 1) {
      Post post = Post.formJson(cmRespDto.data);
      return post;
    } else {
      return Post();
    }
  }

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
