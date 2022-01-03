import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/checkout_page/bloc/checkout_bloc.dart';
import 'package:movie_market_place/checkout_page/widgets/checkout_heading.dart';
import 'package:movie_market_place/checkout_page/widgets/checkout_textfield.dart';
import 'package:movie_market_place/checkout_page/widgets/confirm_button.dart';

class WebFieldsView extends StatelessWidget {
  const WebFieldsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Heading(
              number: '1',
              name: "User Details",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CheckoutTextField(
                  name: 'Full Name',
                  initialValue: state.name.value,
                  error: state.name.invalid ? 'Name can not be empty!' : null,
                  onChanged: (value) {
                    context.read<CheckoutBloc>().add(NameChanged(name: value));
                  },
                ),
                CheckoutTextField(
                  name: 'Phone Number',
                  initialValue: state.number.value,
                  error: state.number.invalid
                      ? 'Please ensure the Number entered is valid!'
                      : null,
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(NumberChanged(number: value));
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CheckoutTextField(
                  name: 'Address',
                  initialValue: state.address.value,
                  error: state.address.invalid
                      ? 'Address can not be empty!'
                      : null,
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(AddressChanged(address: value));
                  },
                ),
                CheckoutTextField(
                  name: 'Postal Code',
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
              ],
            ),
            const Heading(
              name: 'Payment Details',
              number: '2',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CheckoutTextField(
                  name: "CVV",
                  obsec: true,
                  initialValue: state.cvv.value,
                  error: state.cvv.invalid
                      ? 'Please ensure the CVV entered is valid!'
                      : null,
                  onChanged: (value) {
                    context.read<CheckoutBloc>().add(CvvChanged(cvv: value));
                  },
                ),
                //  const SizedBox(width: 5.0),
                CheckoutTextField(
                  name: "Expiry",
                  initialValue: state.expiry.value,
                  error: state.expiry.invalid
                      ? 'Please ensure the Expiry entered is valid!'
                      : null,
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(ExpiryChanged(expiry: value));
                  },
                ),
              ],
            ),
            const ConfirmButton(),
          ],
        );
      },
    );
  }
}
