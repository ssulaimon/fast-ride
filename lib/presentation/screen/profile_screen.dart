import 'package:fastride/constant/colors.dart';
import 'package:fastride/domain/firebase_email_auth.dart';
import 'package:fastride/domain/upload_profile_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = FirebaseEmailAuth.userName;
    String email = FirebaseEmailAuth.email;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.transparent,
        elevation: 0.0,
        title: const Text(
          "My Profile",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: MyColors.grey,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () async {
                      await ProfileImageUpload.uploadImage(context: context);
                    },
                    icon: const Icon(
                      Icons.photo_camera,
                      size: 30,
                      color: MyColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            leading: const Icon(
              Icons.person_2_outlined,
              color: MyColors.primary,
            ),
            title: Text(
              userName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.email_outlined,
              color: MyColors.primary,
            ),
            title: Text(
              email,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.lock_reset,
              color: MyColors.primary,
            ),
            title: const Text(
              "Reset Password",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.receipt_long,
              color: MyColors.primary,
            ),
            title: const Text(
              "Transactions",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.security,
              color: MyColors.primary,
            ),
            title: const Text(
              "Security Question",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
