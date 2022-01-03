import 'package:formz/formz.dart';

enum CreditCardValidationError { invalid }

class CreditCard extends FormzInput<String, CreditCardValidationError> {
  const CreditCard.pure([String value = '']) : super.pure(value);
  const CreditCard.dirty([String value = '']) : super.dirty(value);

  static final _creditCardRegex = RegExp(
    r'(^(?:[+0]9)?[0-9]{10,12}$)',
  );

  @override
  CreditCardValidationError? validator(String? value) {
    return _creditCardRegex.hasMatch(value ?? '')
        ? null
        : CreditCardValidationError.invalid;
  }
}