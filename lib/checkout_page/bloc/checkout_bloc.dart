import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:movie_market_place/checkout_page/validation/models/models.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(const CheckoutState()) {
    on<NameChanged>(_onNameChanged);
    on<NumberChanged>(_onNumberChanged);
    on<AddressChanged>(_onAddressChanged);
    on<PostalCodeChanged>(_onPostalCodeChanged);
    on<CreditCardChanged>(_onCreditCardChanged);
    on<CvvChanged>(_onCvvChanged);
    on<ExpiryChanged>(_onExpiryChanged);
    on<CheckoutSubmitted>(_onCheckoutSubmitted);
  }

  void _onNameChanged(NameChanged event, Emitter<CheckoutState> emit) {
    final name = Name.dirty(event.name);
    emit(
      state.copyWith(
        name: name.valid ? name : Name.pure(event.name),
        status: Formz.validate([
          name,
          state.number,
          state.address,
          state.postalCode,
          state.creditCard,
          state.cvv,
          state.expiry,
        ]),
      ),
    );
  }

  void _onNumberChanged(NumberChanged event, Emitter<CheckoutState> emit) {
    final number = Number.dirty(event.number);
    emit(
      state.copyWith(
        number: number.valid ? number : Number.pure(event.number),
        status: Formz.validate([
          state.name,
          number,
          state.address,
          state.postalCode,
          state.creditCard,
          state.cvv,
          state.expiry,
        ]),
      ),
    );
  }

  void _onAddressChanged(AddressChanged event, Emitter<CheckoutState> emit) {
    final address = Address.dirty(event.address);
    emit(
      state.copyWith(
        address: address.valid ? address : Address.pure(event.address),
        status: Formz.validate([
          state.name,
          state.number,
          address,
          state.postalCode,
          state.creditCard,
          state.cvv,
          state.expiry,
        ]),
      ),
    );
  }

  void _onPostalCodeChanged(
      PostalCodeChanged event, Emitter<CheckoutState> emit) {
    final postalCode = PostalCode.dirty(event.postalCode);
    emit(
      state.copyWith(
        postalCode:
            postalCode.valid ? postalCode : PostalCode.pure(event.postalCode),
        status: Formz.validate([
          state.name,
          state.number,
          state.address,
          postalCode,
          state.creditCard,
          state.cvv,
          state.expiry,
        ]),
      ),
    );
  }

  void _onCreditCardChanged(
      CreditCardChanged event, Emitter<CheckoutState> emit) {
    final creditCard = CreditCard.dirty(event.creditCard);
    emit(
      state.copyWith(
        creditCard:
            creditCard.valid ? creditCard : CreditCard.pure(event.creditCard),
        status: Formz.validate([
          state.name,
          state.number,
          state.address,
          state.postalCode,
          creditCard,
          state.cvv,
          state.expiry,
        ]),
      ),
    );
  }

  void _onCvvChanged(CvvChanged event, Emitter<CheckoutState> emit) {
    final cvv = Cvv.dirty(event.cvv);
    emit(
      state.copyWith(
        cvv: cvv.valid ? cvv : Cvv.pure(event.cvv),
        status: Formz.validate([
          state.name,
          state.number,
          state.address,
          state.postalCode,
          state.creditCard,
          cvv,
          state.expiry,
        ]),
      ),
    );
  }

  void _onExpiryChanged(ExpiryChanged event, Emitter<CheckoutState> emit) {
    final expiry = Expiry.dirty(event.expiry);
    emit(
      state.copyWith(
        expiry: expiry.valid ? expiry : Expiry.pure(event.expiry),
        status: Formz.validate([
          state.name,
          state.number,
          state.address,
          state.postalCode,
          state.creditCard,
          state.cvv,
          expiry,
        ]),
      ),
    );
  }

  void _onCheckoutSubmitted(
      CheckoutSubmitted event, Emitter<CheckoutState> emit) async {
    final name = Name.dirty(state.name.value);
    final number = Number.dirty(state.number.value);
    final address = Address.dirty(state.address.value);
    final postalCode = PostalCode.dirty(state.postalCode.value);
    final creditCard = CreditCard.dirty(state.creditCard.value);
    final cvv = Cvv.dirty(state.cvv.value);
    final expiry = Expiry.dirty(state.expiry.value);
    emit(state.copyWith(
      name: name,
      number: number,
      address: address,
      postalCode: postalCode,
      creditCard: creditCard,
      cvv: cvv,
      expiry: expiry,
      status: Formz.validate(
          [name, number, address, postalCode, creditCard, cvv, expiry]),
    ));
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }
}
