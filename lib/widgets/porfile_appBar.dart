
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/routes/routes_name.dart';
import 'package:task_manager/style/style.dart';
import 'package:task_manager/utils/utility.dart';

class ProfileAppBar extends StatelessWidget {
   ProfileAppBar({
    super.key,
    // this.photoUrl,
    // this.firstName,
    // this.lastName,
    // this.userEmail
    this.viewProfileData
  });

  // String? photoUrl;
  // String? firstName;
  // String? lastName;
  // String? userEmail;

  Map? viewProfileData;

  @override
  Widget build(BuildContext context) {
    return Obx(
    () => 
       AppBar(
      backgroundColor: colorGreen,
      flexibleSpace: Container(
        margin: const EdgeInsets.fromLTRB(10, 40, 10, 0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 24,
              child: ClipOval(
                child: Image.memory(StoredData.ShowBase64Image(viewProfileData!['photo'])),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${viewProfileData!['firstName']} ${viewProfileData!['lastName']}',style: Head6Text(colorWhite),),
                Text('${viewProfileData!['email']}', style:  Head7Text(colorWhite),)
              ],
            )
          ],
        ),
      ),
      actions: [
        IconButton(
            onPressed: () async {
             await StoredData.RemoveToken();
             Get.offAllNamed(RoutesName.loginScreen);
            },
            icon: const Icon(Icons.output)
        )
      ],
      
        ),
    );
  }
}

class $ {
}