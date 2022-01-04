import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/checkout_page/bloc/checkout_bloc.dart';
import 'package:movie_market_place/checkout_page/widgets/checkout_heading.dart';
import 'package:movie_market_place/checkout_page/widgets/checkout_textfield.dart';
import 'package:movie_market_place/checkout_page/widgets/confirm_button.dart';

class MobileFieldsView extends StatelessWidget {
  const MobileFieldsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Heading(
              number: '1',
              name: "User Details",
            ),
            CheckoutTextField(
              name: 'Full Name',
              width: mWidth,
              initialValue: state.name.value,
              error: state.name.invalid ? 'Name can not be empty!' : null,
              onChanged: (value) {
                context.read<CheckoutBloc>().add(NameChanged(name: value));
              },
            ),
            CheckoutTextField(
              name: 'Phone Number',
              width: mWidth,
              initialValue: state.number.value,
              error: state.number.invalid
                  ? 'Please ensure the Number entered is valid!'
                  : null,
              onChanged: (value) {
                context.read<CheckoutBloc>().add(NumberChanged(number: value));
              },
            ),
            CheckoutTextField(
              name: 'Address',
              width: mWidth,
              initialValue: state.address.value,
              error: state.address.invalid ? 'Address can not be empty!' : null,
              onChanged: (value) {
                context
                    .read<CheckoutBloc>()
                    .add(AddressChanged(address: value));
              },
            ),
            CheckoutTextField(
              name: 'Postal Code',
              width: mWidth,
              initialValue: state.postalCode.value,
              error: state.postalCode.invalid
                  ? 'Please ensure the Postal Code entered is valid!'
                  : null,
              onChanged: (value) {
                context
                    .read<CheckoutBloc>()
                    .add(PostalCodeChanged(postalCode: value));
              },
            ),
            const Heading(
              number: '2',
              name: "Payment Details",
            ),
            CheckoutTextField(
              name: 'Credit Card',
              width: mWidth,
              initialValue: state.creditCard.value,
              error: state.creditCard.invalid
                  ? 'Please ensure the Credit Card Number entered is valid!'
                  : null,
              onChanged: (value) {
                context
                    .read<CheckoutBloc>()
                    .add(CreditCardChanged(creditCard: value));
              },
            ),
            CheckoutTextField(
              name: "CVV",
              width: mWidth,
              obsecure: true,
              initialValue: state.cvv.value,
              error: state.cvv.invalid
                  ? 'Please ensure the CVV entered is valid!'
                  : null,
              onChanged: (value) {
                context.read<CheckoutBloc>().add(CvvChanged(cvv: value));
              },
            ),
            CheckoutTextField(
              name: "Expiry",
              width: mWidth,
              initialValue: state.expiry.value,
              error: state.expiry.invalid
                  ? 'Expiry Date can not be empty!'
                  : null,
              onChanged: (value) {
                context.read<CheckoutBloc>().add(ExpiryChanged(expiry: value));
              },
            ),
            const ConfirmButton(),
          ],
        );
      },
    );
  }
}
