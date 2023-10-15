import 'package:news_app/shared/domain/models/response.dart';
import 'package:news_app/shared/exceptions/http_exception.dart';

final AppException ktestAppException =
    AppException(message: '', statusCode: 0, identifier: '');

final Response ktestUserResponse =
Response(statusMessage: 'message', statusCode: 1, data: {});