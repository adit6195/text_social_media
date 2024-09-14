import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/model/app_data.dart';
import 'package:social_media/model/post_details.dart';
import 'package:social_media/screens/profile.dart';

class PostDetailsScreen extends StatelessWidget {
  final int postId;
  final DataManager dataManager = DataManager.instance;

  PostDetailsScreen({required this.postId});

  @override
  Widget build(BuildContext context) {
    // Fetch post details and comments if not already fetched
    if (dataManager.posts.isEmpty) {
      dataManager.fetchPosts();
    }
    if (dataManager.comments.isEmpty) {
      dataManager.fetchComments();
    }

    // Find the post details
    final post = dataManager.posts.firstWhere((p) => p.id == postId, orElse: () => Post(id: 0, title: '', body: '', userId: 0));
    final postComments = dataManager.comments.where((c) => c.postId == postId).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
      ),
      body: Obx(() {
        // Show a loading indicator if post details or comments are being fetched
        if (dataManager.isLoadingPosts.value || dataManager.isLoadingComments.value) {
          return Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Title: "+post.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Body"+post.body),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Comments', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              ...postComments.map((comment) => ListTile(
                title: Text("Name: "+comment.name),
                subtitle: Text(comment.body),
              )),
              // Navigate to UserProfileScreen when the post's user is clicked
              ElevatedButton(
                onPressed: () {
                  // Assume that the `userId` is available within the post model
                  Get.to(() => UserProfileScreen(userId: post.userId));
                },
                child: Text('View User Profile'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
