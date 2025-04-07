import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../constants/dimensions.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Center(
            child: SizedBox(
              // width: Dimensions.webMaxWidth,
              child:  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: Dimensions.paddingSizeSmall),
        
                      Shimmer(
                        duration: const Duration(seconds: 2),
                        enabled: true,
                        child: Container(
                          padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            // Container(
                            //   height: 30, width: 30,
                            //   decoration: BoxDecoration(
                            //     color: Theme.of(context).cardColor,
                            //     borderRadius: BorderRadius.circular(50),
                            //   ),
                            // ),
                            const SizedBox(height: Dimensions.paddingSizeExtraLarge),
        
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
        
                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
                            ]),
                            const SizedBox(height: Dimensions.paddingSizeSmall),
        
        
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
        
                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
                            ]),
                            const SizedBox(height: Dimensions.paddingSizeSmall),
        
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
        
                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
                            ]),
                            const SizedBox(height: Dimensions.paddingSizeSmall),
        
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
        
                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
                            ]),
                            const SizedBox(height: Dimensions.paddingSizeSmall),
        
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
        
                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
                            ]),
        
                          ]),
                        ),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeSmall),
        
                      Shimmer(
                        duration: const Duration(seconds: 2),
                        enabled: true,
                        child: Container(
                          padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          child: Column(children: [
                            Row(children: [
        
                              Container(
                                height: 15, width: 80,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
                              const Spacer(),
        
                              Container(
                                height: 15, width: 80,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
                              const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                              Icon(Icons.add, color: Theme.of(context).cardColor),
                            ]),
                            const SizedBox(height: Dimensions.paddingSizeSmall),
        
                            Container(
                              height: 60,
                              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                              ),
                              child: Row(children: [
        
                                Icon(Icons.countertops, color: Theme.of(context).cardColor),
                                const SizedBox(width: Dimensions.paddingSizeSmall),
        
                                Container(
                                  height: 10, width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
                                const Spacer(),
        
                                Container(
                                  height: 40, width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                                  ),
                                ),
                              ]),
                            ),
                          ]),
                        ),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeSmall),
        
                      Shimmer(
                        duration: const Duration(seconds: 2),
                        enabled: true,
                        child: Container(
                          padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 15, width: 120,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
                              const SizedBox(height: Dimensions.paddingSizeSmall),
        
                              Container(
                                height: 120, width: context.width,
                                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
                              const SizedBox(height: Dimensions.paddingSizeSmall),
        
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
        
                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
                              ]),
                              const SizedBox(height: Dimensions.paddingSizeSmall),
        
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
        
                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
                              ]),
                              const SizedBox(height: Dimensions.paddingSizeSmall),
        
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
        
                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
                              ]),
                              const SizedBox(height: Dimensions.paddingSizeSmall),
        
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
        
                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
                              ]),
                              const SizedBox(height: Dimensions.paddingSizeSmall),
        
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
        
                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
                              ]),
                              const SizedBox(height: Dimensions.paddingSizeSmall),
        
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
        
                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
                              ]),
                              const SizedBox(height: Dimensions.paddingSizeSmall),
        
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeSmall),

                      Shimmer(
                        duration: const Duration(seconds: 2),
                        enabled: true,
                        child: Container(
                          padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            // Container(
                            //   height: 30, width: 30,
                            //   decoration: BoxDecoration(
                            //     color: Theme.of(context).cardColor,
                            //     borderRadius: BorderRadius.circular(50),
                            //   ),
                            // ),
                            const SizedBox(height: Dimensions.paddingSizeExtraLarge),

                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),

                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
                            ]),
                            const SizedBox(height: Dimensions.paddingSizeSmall),


                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),

                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
                            ]),
                            const SizedBox(height: Dimensions.paddingSizeSmall),

                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),

                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
                            ]),
                            const SizedBox(height: Dimensions.paddingSizeSmall),

                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),

                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
                            ]),
                            const SizedBox(height: Dimensions.paddingSizeSmall),

                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),

                              Container(
                                height: 15, width: 150,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
                            ]),

                          ]),
                        ),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeSmall),

                      Shimmer(
                        duration: const Duration(seconds: 2),
                        enabled: true,
                        child: Container(
                          padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          child: Column(children: [
                            Row(children: [

                              Container(
                                height: 15, width: 80,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
                              const Spacer(),

                              Container(
                                height: 15, width: 80,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
                              const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                              Icon(Icons.add, color: Theme.of(context).cardColor),
                            ]),
                            const SizedBox(height: Dimensions.paddingSizeSmall),

                            Container(
                              height: 60,
                              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                              ),
                              child: Row(children: [

                                Icon(Icons.countertops, color: Theme.of(context).cardColor),
                                const SizedBox(width: Dimensions.paddingSizeSmall),

                                Container(
                                  height: 10, width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
                                const Spacer(),

                                Container(
                                  height: 40, width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                                  ),
                                ),
                              ]),
                            ),
                          ]),
                        ),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeSmall),

                      Shimmer(
                        duration: const Duration(seconds: 2),
                        enabled: true,
                        child: Container(
                          padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 15, width: 120,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
                              const SizedBox(height: Dimensions.paddingSizeSmall),

                              Container(
                                height: 120, width: context.width,
                                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                ),
                              ),
                              const SizedBox(height: Dimensions.paddingSizeSmall),

                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),

                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
                              ]),
                              const SizedBox(height: Dimensions.paddingSizeSmall),

                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),

                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
                              ]),
                              const SizedBox(height: Dimensions.paddingSizeSmall),

                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),

                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
                              ]),
                              const SizedBox(height: Dimensions.paddingSizeSmall),

                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),

                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
                              ]),
                              const SizedBox(height: Dimensions.paddingSizeSmall),

                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),

                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
                              ]),
                              const SizedBox(height: Dimensions.paddingSizeSmall),

                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),

                                Container(
                                  height: 15, width: 150,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
                              ]),
                              const SizedBox(height: Dimensions.paddingSizeSmall),

                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeSmall),

                    ],
                  ),
                ),
        
              ]),
            ),
          ),
        ),
      ),
    );
  }



}


class LoadingHomeScreen extends StatelessWidget {
  const LoadingHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            height: 160.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Shimmer(
                      duration: const Duration(seconds: 2),
                      enabled: true,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 70.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      height: 15,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class LoadingHomeScreenTransports extends StatelessWidget {
  const LoadingHomeScreenTransports({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Shimmer(
                        duration: const Duration(seconds: 2),
                        enabled: true,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 120.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        height: 15,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class LoadingOfferScreen extends StatelessWidget {
  const LoadingOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5),
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        child: Center(
          child: SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Shimmer(
                        duration: const Duration(seconds: 2),
                        enabled: true,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      height: 15,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
