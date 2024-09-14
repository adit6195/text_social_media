import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/model/app_data.dart';
import 'package:social_media/screens/post_details.dart';

class HomeScreen extends StatelessWidget {
  final DataManager dataManager = DataManager.instance;

  @override
  Widget build(BuildContext context) {
    // Fetch posts if they are not already fetched
    if (dataManager.posts.isEmpty) {
      dataManager.fetchPosts();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Obx(() {
        // Show a loading indicator if posts are being fetched
        if (dataManager.isLoadingPosts.value) {
          return Center(child: CircularProgressIndicator());
        }

        // Display the list of posts
        return ListView.builder(
          itemCount: dataManager.posts.length,
          itemBuilder: (context, index) {
            final post = dataManager.posts[index];
            return ListTile(
              title: Text("Title: "+post.title),
              subtitle: Text("Body:"+post.body),
              onTap: () {
                // Navigate to PostDetailsScreen
                Get.to(() => PostDetailsScreen(postId: post.id));
              },
            );
          },
        );
      }),
    );
  }
}