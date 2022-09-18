import 'app_exceptions.exceptions.dart';

class InvalidInputExceptions extends AppExceptions {
  InvalidInputExceptions([String? message]) : super(message, "Invalid Input");
}
