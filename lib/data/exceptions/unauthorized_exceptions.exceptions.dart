import 'app_exceptions.exceptions.dart';

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? message])
      : super(message, "Unauthorised Request");
}
