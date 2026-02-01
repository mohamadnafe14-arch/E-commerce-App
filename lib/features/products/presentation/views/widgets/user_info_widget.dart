import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(user.photoURL!),
          radius: 20.r,
        ),
        SizedBox(width: 10.w),
        Column(
          children: [
            Text(
              user.displayName!,
              style: TextStyles.textStyle16Regular(Colors.black),
            ),
            Text(
              user.email!,
              style: TextStyles.textStyle14Regular(Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}
