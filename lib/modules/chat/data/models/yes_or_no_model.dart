import 'package:yes_or_no_app/modules/chat/domain/entities/message.dart';

class YesOrNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesOrNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesOrNoModel.fromJson(Map<String, dynamic> json) {
    return YesOrNoModel(
      answer: json["answer"],
      forced: json["forced"],
      image: json["image"],
    );
  }

  Message toMessageEntity() {
    return Message(
      text: answer == 'yes' ? 'Sí' : 'No',
      fromWho: FromWho.him,
      imageUrl: image,
    );
  }
}
