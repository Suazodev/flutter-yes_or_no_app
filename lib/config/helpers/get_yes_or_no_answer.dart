import 'package:dio/dio.dart';
import 'package:yes_or_no_app/modules/chat/data/models/yes_or_no_model.dart';
import 'package:yes_or_no_app/modules/chat/domain/entities/message.dart';

class GetYesOrNoAnswer {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://yesno.wtf/api',
    ),
  );

  Future<Message> getYesOrNoAnswer() async {
    final response = await _dio.get('/');
    final yesNoModel = YesOrNoModel.fromJson(response.data);
    return yesNoModel.toMessageEntity();
  }
}
