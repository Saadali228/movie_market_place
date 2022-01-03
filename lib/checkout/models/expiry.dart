import 'package:formz/formz.dart';

enum ExpiryValidationError { invalid }

class Expiry extends FormzInput<String, ExpiryValidationError> {
  const Expiry.pure([String value = '']) : super.pure(value);
  const Expiry.dirty([String value = '']) : super.dirty(value);

  static final _expiryRegex = RegExp(
    r'(^(?:[+0]9)?[0-9]{10,12}$)',
  );

  @override
  ExpiryValidationError? validator(String? value) {
    return _expiryRegex.hasMatch(value ?? '')
        ? null
        : ExpiryValidationError.invalid;
  }
}