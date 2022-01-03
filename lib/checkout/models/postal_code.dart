import 'package:formz/formz.dart';

enum PostalCodeValidationError { invalid }

class PostalCode extends FormzInput<String, PostalCodeValidationError> {
  const PostalCode.pure([String value = '']) : super.pure(value);
  const PostalCode.dirty([String value = '']) : super.dirty(value);

  static final _postalCodeRegex = RegExp(
    r'(^(?:[+0]9)?[0-9]{10,12}$)',
  );

  @override
  PostalCodeValidationError? validator(String? value) {
    return _postalCodeRegex.hasMatch(value ?? '')
        ? null
        : PostalCodeValidationError.invalid;
  }
}