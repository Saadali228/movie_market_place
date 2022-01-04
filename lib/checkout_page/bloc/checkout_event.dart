part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends CheckoutEvent {
  const NameChanged({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class NumberChanged extends CheckoutEvent {
  const NumberChanged({required this.number});

  final String number;

  @override
  List<Object> get props => [number];
}

class AddressChanged extends CheckoutEvent {
  const AddressChanged({required this.address});

  final String address;

  @override
  List<Object> get props => [address];
}

class PostalCodeChanged extends CheckoutEvent {
  const PostalCodeChanged({required this.postalCode});

  final String postalCode;

  @override
  List<Object> get props => [postalCode];
}

class CreditCardChanged extends CheckoutEvent {
  const CreditCardChanged({required this.creditCard});

  final String creditCard;

  @override
  List<Object> get props => [creditCard];
}

class CvvChanged extends CheckoutEvent {
  const CvvChanged({required this.cvv});

  final String cvv;

  @override
  List<Object> get props => [cvv];
}

class ExpiryChanged extends CheckoutEvent {
  const ExpiryChanged({required this.expiry});

  final String expiry;

  @override
  List<Object> get props => [expiry];
}

class CheckoutSubmitted extends CheckoutEvent {}