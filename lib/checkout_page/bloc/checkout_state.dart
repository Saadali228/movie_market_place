part of 'checkout_bloc.dart';

class CheckoutState extends Equatable {
  const CheckoutState({
    this.status = FormzStatus.pure,
    this.name = const Name.pure(),
    this.number = const Number.pure(),
    this.address = const Address.pure(),
    this.postalCode = const PostalCode.pure(),
    this.creditCard = const CreditCard.pure(),
    this.cvv = const Cvv.pure(),
    this.expiry = const Expiry.pure(),
  });

  final FormzStatus status;
  final Name name;
  final Number number;
  final Address address;
  final PostalCode postalCode;
  final CreditCard creditCard;
  final Cvv cvv;
  final Expiry expiry;

  CheckoutState copyWith({
    FormzStatus? status,
    Name? name,
    Number? number,
    Address? address,
    PostalCode? postalCode,
    CreditCard? creditCard,
    Cvv? cvv,
    Expiry? expiry,
  }) {
    return CheckoutState(
      status: status ?? this.status,
      name: name ?? this.name,
      number: number ?? this.number,
      address: address ?? this.address,
      postalCode: postalCode ?? this.postalCode,
      creditCard: creditCard ?? this.creditCard,
      cvv: cvv ?? this.cvv,
      expiry: expiry ?? this.expiry,
    );
  }

  @override
  List<Object> get props =>
      [status, name, number, address, postalCode, creditCard, cvv, expiry];
}
