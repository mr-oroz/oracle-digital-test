import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:oracle_digital/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.avatar).existsSync(), isTrue);
    expect(File(AppImages.homeImage).existsSync(), isTrue);
    expect(File(AppImages.image1).existsSync(), isTrue);
    expect(File(AppImages.image2).existsSync(), isTrue);
    expect(File(AppImages.image3).existsSync(), isTrue);
    expect(File(AppImages.image4).existsSync(), isTrue);
    expect(File(AppImages.logo).existsSync(), isTrue);
    expect(File(AppImages.person1).existsSync(), isTrue);
    expect(File(AppImages.person2).existsSync(), isTrue);
    expect(File(AppImages.person3).existsSync(), isTrue);
    expect(File(AppImages.person4).existsSync(), isTrue);
    expect(File(AppImages.person5).existsSync(), isTrue);
    expect(File(AppImages.person6).existsSync(), isTrue);
    expect(File(AppImages.personAvatar).existsSync(), isTrue);
    expect(File(AppImages.photo1).existsSync(), isTrue);
    expect(File(AppImages.photo10).existsSync(), isTrue);
    expect(File(AppImages.photo2).existsSync(), isTrue);
    expect(File(AppImages.photo3).existsSync(), isTrue);
    expect(File(AppImages.photo4).existsSync(), isTrue);
    expect(File(AppImages.photo5).existsSync(), isTrue);
    expect(File(AppImages.photo6).existsSync(), isTrue);
    expect(File(AppImages.photo7).existsSync(), isTrue);
    expect(File(AppImages.photo8).existsSync(), isTrue);
    expect(File(AppImages.photo9).existsSync(), isTrue);
  });
}
