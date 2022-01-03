import 'package:formz/formz.dart';

enum CvvValidationError { invalid }

class Cvv extends FormzInput<String, CvvValidationError> {
  const Cvv.pure([String value = '']) : super.pure(value);
  const Cvv.dirty([String value = '']) : super.dirty(value);

  static final _cvvRegex = RegExp(
    r'(^(?:[+0]9)?[0-9]{10,12}$)',
  );

  @override
  CvvValidationError? validator(String? value) {
    return _cvvRegex.hasMatch(value ?? '')
        ? null
        : CvvValidationError.invalid;
  }
}