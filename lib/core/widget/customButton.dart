import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonTrans extends StatelessWidget {
  const CustomButtonTrans(
      {super.key, this.image1, this.image2, this.text, this.onPressed});
  final String? text;
  final String? image1;
  final String? image2;

  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
    //  height: 30.h,
      child: ElevatedButton(
        child:  Text(
          text!,
          style: TextStyle(fontSize: 25),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          backgroundColor: Color.fromARGB(255, 15, 136, 31),
          foregroundColor: Colors.white,
          minimumSize: const Size(0, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        onPressed: onPressed ?? () {},
      ),
    );
  }
}
