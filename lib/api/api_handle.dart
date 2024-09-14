import 'package:dio/dio.dart';
import 'package:social_media/model/comment_model.dart';
import 'package:social_media/model/post_details.dart';
import 'package:social_media/model/usermodel.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));

  // Fetch posts
  Future<List<Post>> fetchPosts() async {
    try {
      Response response = await _dio.get('/posts');
      return (response.data as List).map((json) => Post.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching posts: $e');
      return [];
    }
  }

  // Fetch comments
  Future<List<Comment>> fetchComments() async {
    try {
      Response response = await _dio.get('/comments');
      return (response.data as List).map((json) => Comment.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching comments: $e');
      return [];
    }
  }

  // Fetch users
  Future<List<User>> fetchUsers() async {
    try {
      Response response = await _dio.get('/users');
      return (response.data as List).map((json) => User.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching users: $e');
      return [];
    }
  }
}