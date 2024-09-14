import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/model/app_data.dart';
import 'package:social_media/model/usermodel.dart';

class UserProfileScreen extends StatelessWidget {
  final int userId;
  final DataManager dataManager = DataManager.instance;

  UserProfileScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    // Fetch users if they are not already fetched
    if (dataManager.users.isEmpty) {
      dataManager.fetchUsers();
    }

    // Find the user details
    final user = dataManager.users.firstWhere((u) => u.id == userId, orElse: () => User(
    id: 0,
    name: '',
    email: '',
    phone: '',
    website: '',
    zipcode: '',  // Add all required fields with default values
    lng: '',
    companyName: '',
    catchPhrase: '',
    bs: '', username: '', street: '', suite: '', city: '', lat: '',
  ),
);

    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Obx(() {
        // Show a loading indicator if users are being fetched
        if (dataManager.isLoadingUsers.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Email: ${user.email}'),
              Text('Phone: ${user.phone}'),
              Text('Website: ${user.website}'),
            ],
          ),
        );
      }),
    );
  }
}
