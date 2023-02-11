import 'package:bringin_task/utilites/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonToolbar extends StatelessWidget implements PreferredSizeWidget {

  final VoidCallback? voidCallback;
  const CommonToolbar({
    Key? key,
    this.voidCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: InkWell(
        onTap: (){
          Get.back();
        },
          child: Image.asset(MyImage.backArrow,))

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
