import 'package:flutter/material.dart';
import 'package:oracle_digital/presentation/theme/app_colors.dart';
import 'package:oracle_digital/presentation/widgets/person_info_widget.dart';

class PhotoOpenScreen extends StatelessWidget {
  const PhotoOpenScreen(
      {super.key,
      required this.image,
      required this.avatar,
      required this.lastName,
      required this.firstName,
      required this.login});

  final String image;
  final String firstName;
  final String lastName;
  final String login;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    left: 0,
                    child: PersonInfoWidget(
                        avavar: avatar,
                        name: '$lastName $firstName',
                        social: login,
                        color: AppColor.white),
                  ),
                  Positioned(
                      top: 50,
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: AppColor.white,
                        ),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
