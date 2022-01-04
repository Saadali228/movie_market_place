import 'package:formz/formz.dart';

enum CreditCardValidationError { invalid }

class CreditCard extends FormzInput<String, CreditCardValidationError> {
  const CreditCard.pure([String value = '']) : super.pure(value);
  const CreditCard.dirty([String value = '']) : super.dirty(value);

  static final _creditCardRegex = RegExp(
    r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))',
  );

  @override
  CreditCardValidationError? validator(String? value) {
    return _creditCardRegex.hasMatch(value ?? '')
        ? null
        : CreditCardValidationError.invalid;
  }
}