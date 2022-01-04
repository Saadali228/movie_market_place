import 'package:formz/formz.dart';

enum ExpiryValidationError { empty }

class Expiry extends FormzInput<String, ExpiryValidationError> {
  const Expiry.pure([String value = '']) : super.pure(value);
  const Expiry.dirty([String value = '']) : super.dirty(value);

  @override
  ExpiryValidationError? validator(String value) {
    return value.isNotEmpty == true ? null : ExpiryValidationError.empty;
  }
}
