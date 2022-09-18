import 'app_exceptions.exceptions.dart';

class BadRequestExceptions extends AppExceptions {
  BadRequestExceptions([String? message]) : super(message, "Invalid Request");
}
