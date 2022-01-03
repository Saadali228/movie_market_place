import 'package:flutter/material.dart';
import 'package:movie_market_place/checkout/widgets/checkout_heading.dart';
import 'package:movie_market_place/checkout/widgets/checkout_textfield.dart';
import 'package:movie_market_place/checkout/widgets/confirm_button.dart';

class MobileFieldsView extends StatelessWidget {
  const MobileFieldsView({Key? key, required this.onTap}) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;

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
        ),
        CheckoutTextField(
          name: 'Phone Number',
          width: mWidth,
        ),
        CheckoutTextField(
          name: 'Address',
          width: mWidth,
        ),
        CheckoutTextField(
          name: 'Postal Code',
          width: mWidth,
        ),
        const Heading(
          number: '2',
          name: "Payment Details",
        ),
        CheckoutTextField(
          name: 'Credit Card',
          width: mWidth,
        ),
        CheckoutTextField(
          name: "CVV",
          width: mWidth,
          obsec: true,
        ),
        CheckoutTextField(
          name: "Expiry",
          width: mWidth,
        ),
        ConfirmButton(
          onTap: onTap,
        ),
      ],
    );
  }
}
