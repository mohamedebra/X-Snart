import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_watch/features/home_screen/home_details_screen.dart';

import '../../core/constants/images.dart';
import '../../core/constants/styles.dart';
import '../../core/model/school_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                color: Colors.teal,
              ),
              height: 90.h,
              width: double.infinity,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    CircleAvatar(
                      radius: 25.r,
                      backgroundImage: AssetImage(Images.logo),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        Text('Yalla Go',style: robotoMedium.copyWith(
                            color: Colors.white,
                            fontSize: 15
                        ),),
                        Text('version: 1.0',style: robotoMedium.copyWith(
                            color: Colors.white,
                            fontSize: 11
                        ),),
                      ],
                    )
                  ],
                ),
              ),),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Get.to(HomeDetailsScreen(title: schoolList[index].title,));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(schoolList[index].title),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          width: 90.w,
                          height: 70.h,
                          child: Image.asset(
                            schoolList[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(color: Colors.grey[200],);
              },
              itemCount: schoolList.length,
            )

          ],
        ),
      ),
    );
  }
}
