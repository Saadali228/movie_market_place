import 'package:flutter/material.dart';
import 'package:movie_market_place/checkout/widgets/checkout_heading.dart';
import 'package:movie_market_place/checkout/widgets/checkout_textfield.dart';
import 'package:movie_market_place/checkout/widgets/confirm_button.dart';

class WebFieldsView extends StatelessWidget {
  const WebFieldsView({Key? key, required this.onTap}) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
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
          children: const [
            CheckoutTextField(
              name: 'Full Name',
            ),
            //const SizedBox(width: 5.0),
            CheckoutTextField(
              name: 'Phone Number',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CheckoutTextField(
              name: 'Address',
            ),
            // const SizedBox(width: 5.0),
            CheckoutTextField(
              name: 'Postal Code',
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
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CheckoutTextField(
              name: "CVV",
              obsec: true,
            ),
            //  const SizedBox(width: 5.0),
            CheckoutTextField(
              name: "Expiry",
            ),
          ],
        ),
        ConfirmButton(
          onTap: onTap,
        ),
      ],
    );
  }
}
