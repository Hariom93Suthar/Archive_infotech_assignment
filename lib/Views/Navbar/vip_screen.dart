import 'package:archive_infotech_assignment/Utils/color.dart';
import 'package:flutter/material.dart';
class UserVipScreen extends StatelessWidget {
  const UserVipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackcolor,
      body: Center(
        child: Text("User Vip Screen >>>",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: AppColors.whitecolor),),
      ),
    );
  }
}
