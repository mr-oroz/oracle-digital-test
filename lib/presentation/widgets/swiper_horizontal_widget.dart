import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_digital/presentation/models/new_today_model.dart';
import 'package:oracle_digital/presentation/screens/photo_open_screen/photo_open_screen.dart';
import 'package:oracle_digital/presentation/theme/app_colors.dart';
import 'package:oracle_digital/presentation/widgets/person_info_widget.dart';

class SwiperHorizontalWidget extends StatelessWidget {
  const SwiperHorizontalWidget({
    super.key,
    required this.list,
  });

  final List<NewTodayModel> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 390.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final item = list[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoOpenScreen(
                      image:item.image.toString(),
                      avatar: item.avatar.toString(),
                      lastName: item.lastName.toString(),
                      firstName: item.firstName.toString(),
                      login: item.login.toString(),
                    ),
                  ),
                );
              },
              child: SizedBox(
                height: 387.h,
                width: 343.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      item.image.toString(),
                      width: 343.w,
                      height: 343.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 16.h),
                    PersonInfoWidget(
                      avavar: item.avatar.toString(),
                      name:
                          '${item.lastName.toString()} ${item.firstName.toString()}',
                      social: item.login.toString(),
                      color: AppColor.black,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 16.w),
          itemCount: list.length),
    );
  }
}
