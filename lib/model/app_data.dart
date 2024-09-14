import 'package:get/get.dart';
import 'package:social_media/api/api_handle.dart';
import 'package:social_media/model/comment_model.dart';
import 'package:social_media/model/post_details.dart';
import 'package:social_media/model/usermodel.dart';

class DataManager {
  // Private constructor for singleton
  DataManager._privateConstructor();

  // Singleton instance
  static final DataManager _instance = DataManager._privateConstructor();

  // Public accessor for the singleton instance
  static DataManager get instance => _instance;

  // Observable lists for each data type
  var posts = <Post>[].obs;
  var comments = <Comment>[].obs;
  var users = <User>[].obs;

  // Loading states for each API call
  var isLoadingPosts = true.obs;
  var isLoadingComments = true.obs;
  var isLoadingUsers = true.obs;

  final ApiService apiService = ApiService();  // Instance of ApiService

  // Method to fetch all data
  Future<void> fetchAllData() async {
    await Future.wait([
      fetchPosts(),
      fetchComments(),
      fetchUsers(),
    ]);
  }

  // Method to fetch posts
  Future<void> fetchPosts() async {
    try {
      isLoadingPosts(true);
      var fetchedPosts = await apiService.fetchPosts();
      posts.assignAll(fetchedPosts);
    } catch (e) {
      print("Error fetching posts: $e");
    } finally {
      isLoadingPosts(false);
    }
  }

  // Method to fetch comments
  Future<void> fetchComments() async {
    try {
      isLoadingComments(true);
      var fetchedComments = await apiService.fetchComments();
      comments.assignAll(fetchedComments);
    } catch (e) {
      print("Error fetching comments: $e");
    } finally {
      isLoadingComments(false);
    }
  }

  // Method to fetch users
  Future<void> fetchUsers() async {
    try {
      isLoadingUsers(true);
      var fetchedUsers = await apiService.fetchUsers();
      users.assignAll(fetchedUsers);
    } catch (e) {
      print("Error fetching users: $e");
    } finally {
      isLoadingUsers(false);
    }
  }
}
