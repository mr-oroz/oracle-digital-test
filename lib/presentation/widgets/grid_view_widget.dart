import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:oracle_digital/presentation/models/new_today_model.dart';
import 'package:oracle_digital/presentation/screens/photo_open_screen/photo_open_screen.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.list,
    required this.firstHeightThreshold,
    required this.secondHeightThreshold,
  });

  final List<NewTodayModel> list;
  final int firstHeightThreshold;
  final int secondHeightThreshold;

  double getHeightForIndex(
    int index,
    int length,
    int firstHeightThreshold,
    int secondHeightThreshold,
  ) {
    int cycleLength = length - 1;
    int modIndex = index % cycleLength;

    if (modIndex == 0) {
      return 220;
    } else if (modIndex >= 1 && firstHeightThreshold <= secondHeightThreshold) {
      return 310;
    } else if (modIndex >= firstHeightThreshold + 1 &&
        modIndex <= secondHeightThreshold) {
      return 220;
    } else {
      return 310;
    }
  }

  @override
  Widget build(BuildContext context) {
  
    return MasonryGridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      crossAxisSpacing: 9,
      mainAxisSpacing: 9,
      itemBuilder: (context, index) {
        double height = getHeightForIndex(
          index,
          list.length,
          firstHeightThreshold,
          secondHeightThreshold,
        );
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhotoOpenScreen(
                  image: list[index].image.toString(),
                  avatar: list[index].avatar.toString(),
                  lastName: list[index].lastName.toString(),
                  firstName: list[index].firstName.toString(),
                  login: list[index].login.toString(),
                ),
              ),
            );
          },
          child: Image.network(
            list[index].image.toString(),
            fit: BoxFit.cover,
            height: height.h,
          ),
        );
      },
    );
  }
}
