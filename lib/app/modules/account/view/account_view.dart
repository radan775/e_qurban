import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display profile picture if available
            Obx(() {
              if (controller.user.value?.photoURL != null) {
                return CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(controller.user.value!.photoURL!),
                );
              } else {
                return const CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.account_circle, size: 50),
                );
              }
            }),

            const SizedBox(height: 16),

            // Display user's name
            Obx(() {
              return Text(
                controller.user.value?.displayName ?? "Guest",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              );
            }),

            const SizedBox(height: 8),

            // Display user's email
            Obx(() {
              return Text(
                controller.user.value?.email ?? "",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              );
            }),

            const SizedBox(height: 32),

            // Edit Profile Button
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text("Edit Profile"),
              onPressed: () {
              },
            ),

            const Spacer(),

            // Logout Button
            ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set color to red for logout
              ),
              onPressed: () {
                controller.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
