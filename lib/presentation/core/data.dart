import 'package:oracle_digital/presentation/models/image_model.dart';
import 'package:oracle_digital/presentation/models/messages_model.dart';
import 'package:oracle_digital/presentation/models/message_detail_model.dart';
import 'package:oracle_digital/resources/resources.dart';

List<ImageModel> listImage = [
  ImageModel(image: AppImages.photo1),
  ImageModel(image: AppImages.photo2),
  ImageModel(image: AppImages.photo3),
  ImageModel(image: AppImages.photo4),
  ImageModel(image: AppImages.photo5),
  ImageModel(image: AppImages.photo6),
  ImageModel(image: AppImages.photo7),
  ImageModel(image: AppImages.photo8),
  ImageModel(image: AppImages.photo9),
  ImageModel(image: AppImages.photo10),
];

List<ImageModel> listPersonImage = [
  ImageModel(image: AppImages.person1),
  ImageModel(image: AppImages.person2),
  ImageModel(image: AppImages.person3),
  ImageModel(image: AppImages.person4),
  ImageModel(image: AppImages.person5),
  ImageModel(image: AppImages.person6),
];

List<MessageModel> messages = [
  MessageModel(
    name: 'James',
    message: 'Thank you! That was very helpful!',
    image: AppImages.avatar,
  ),
  MessageModel(
    name: 'Will Kenny',
    message: 'I know... I’m trying to get the funds.',
    image: AppImages.avatar,
  ),
  MessageModel(
    name: 'Beth Williams',
    message:
        'I’m looking for tips around capturing the milky way. I have a 6D with a 24-100mm...',
    image: AppImages.avatar,
  ),
  MessageModel(
    name: 'Rev Shawn',
    message:
        'Wanted to ask if you’re available for a portrait shoot next week.',
    image: AppImages.avatar,
  ),
];

List<MessageDetailModel> messageDetail = [
  MessageDetailModel(
    message:
        'Really love your most recent photo. I’ve been trying to capture the same thing for a few months and would love some tips!',
    avatar: AppImages.avatar,
    isReversed: true,
  ),
  MessageDetailModel(
    message:
        'A fast 50mm like f1.8 would help with the bokeh. I’ve been using primes as they tend to get a bit sharper images.',
    avatar: AppImages.avatar,
    isReversed: false,
  ),
  MessageDetailModel(
    message: 'Thank you! That was very helpful!',
    avatar: AppImages.avatar,
    isReversed: true,
  ),
];
