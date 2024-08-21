import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/ui/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'Home tab';
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<Image> adverts = [
    Image.asset('assets/images/carosal_advert_1.jpeg',),
    // Image.asset('assets/images/unsplash_PDX_a_82obo_2.png',height:200.h ,width: 400.w,),
    // Image.asset('assets/images/unsplash_kRNZiGKtz48_3.png',height:200.h ,width: 400.w,),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leadingWidth: double.infinity,
        leading: Row(
          children: [
            SizedBox(
              width: 16.w,
            ),
            SizedBox(
              child: Image.asset(
                'assets/images/route_app_title.png',
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 17.w, right: 10.w),
            child: Row(
              children: [
                SizedBox(
                  height: 50.h,
                  width: 348.w,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'What do you search for?',
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      prefixIcon: ImageIcon(
                        const AssetImage('assets/icons/icon _search.png'),
                        size: 24.sp,
                      ),
                      prefixIconColor: AppColors.primaryColor,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ///todo Add to cart logic
                  },
                  icon: const ImageIcon(
                    AssetImage('assets/icons/icon _shopping cart.png'),
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: adverts,
            options: CarouselOptions(
              enlargeCenterPage: true,
              enlargeFactor: 0.5
            ),
          )
        ],
      ),
    );
  }
}
