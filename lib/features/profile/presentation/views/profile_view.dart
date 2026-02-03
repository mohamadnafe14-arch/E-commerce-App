import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final User? currentUser = FirebaseAuth.instance.currentUser;

  String _formatDate(DateTime? dateTime) {
    if (dateTime == null) return 'Not available';
    final local = dateTime.toLocal();
    final yyyy = local.year.toString().padLeft(4, '0');
    final mm = local.month.toString().padLeft(2, '0');
    final dd = local.day.toString().padLeft(2, '0');
    final hh = local.hour.toString().padLeft(2, '0');
    final min = local.minute.toString().padLeft(2, '0');
    return '$yyyy-$mm-$dd  $hh:$min';
  }

  @override
  Widget build(BuildContext context) {
    final displayName = currentUser?.displayName ?? 'Guest User';
    final email = currentUser?.email ?? 'No email available';
    final phone =
        (currentUser?.phoneNumber != null &&
            currentUser!.phoneNumber!.trim().isNotEmpty)
        ? currentUser!.phoneNumber!
        : 'Not available';
    final photoUrl = currentUser?.photoURL;
    final creationTime = _formatDate(currentUser?.metadata.creationTime);
    final lastSignIn = _formatDate(currentUser?.metadata.lastSignInTime);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 36.r,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: photoUrl == null
                        ? null
                        : NetworkImage(photoUrl),
                    child: photoUrl == null
                        ? Icon(Icons.person, size: 36.r, color: Colors.grey)
                        : null,
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          displayName,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          email,
                          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text('Phone'),
                    subtitle: Text(phone),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: const Text('Member Since'),
                    subtitle: Text(creationTime),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.login),
                    title: const Text('Last Sign In'),
                    subtitle: Text(lastSignIn),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            if (currentUser == null)
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.orange.shade200),
                ),
                child: Text(
                  'You are browsing as a guest. Sign in to view full profile details.',
                  style: TextStyle(fontSize: 14.sp, color: Colors.orange[800]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
