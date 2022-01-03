import 'package:formz/formz.dart';

enum NumberValidationError { invalid }

class Number extends FormzInput<String, NumberValidationError> {
  const Number.pure([String value = '']) : super.pure(value);
  const Number.dirty([String value = '']) : super.dirty(value);

  static final _numberRegex = RegExp(
    r'(^(?:[+0]9)?[0-9]{10,12}$)',
  );

  @override
  NumberValidationError? validator(String? value) {
    return _numberRegex.hasMatch(value ?? '')
        ? null
        : NumberValidationError.invalid;
  }
}