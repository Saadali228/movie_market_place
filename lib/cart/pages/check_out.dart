import 'package:flutter/material.dart';
import 'package:movie_market_place/cart/bloc/cart_bloc.dart';
import 'package:movie_market_place/home_page/pages/home_page.dart';
import 'package:provider/src/provider.dart';

class CheckOutScreen extends StatelessWidget {
  static const checkOutPageRoute = '/checkout';
  const CheckOutScreen({Key? key}) : super(key: key);

  Widget createTextField(
    String text,
    bool obsec,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        bottom: 30,
      ),
      child: SizedBox(
        height: 40,
        width: 300,
        child: TextField(
          obscureText: obsec,
          decoration: InputDecoration(
            labelText: text,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget displayPriceRow(
    String name,
    String price,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              // left: 50.0,
              ),
          child: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          price,
        ),
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("Explore More!"),
      onPressed: () {
        context.read<CartBloc>().add(
              EmptyCart(),
            );
        Navigator.popUntil(
          context,
          ModalRoute.withName(
            HomePage.homePageRoute,
          ),
        );
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text(
        "Order Placed",
      ),
      content: const Text(
        "Thanks for ordering",
      ),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget heading(
    String number,
    String name,
  ) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            bottom: 20,
            top: 20,
          ),
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 20,
            left: 10,
          ),
          child: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Checkout',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heading(
                '1',
                "User Details",
              ),
              Row(
                children: [
                  createTextField(
                    'Full Name',
                    false,
                  ),
                  createTextField(
                    'Phone Number',
                    false,
                  ),
                ],
              ),
              Row(
                children: [
                  createTextField(
                    'Address',
                    false,
                  ),
                  createTextField(
                    'Country',
                    false,
                  ),
                ],
              ),
              Row(
                children: [
                  createTextField(
                    'Address',
                    false,
                  ),
                  createTextField(
                    'Country',
                    false,
                  ),
                ],
              ),
              heading(
                '2',
                "Payment Details",
              ),
              Row(
                children: [
                  createTextField(
                    "Credit Card Number",
                    false,
                  ),
                  createTextField(
                    "CVV",
                    true,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 200.0,
                  top: 30,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueAccent,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        5.0,
                      ),
                    ),
                    color: Colors.green,
                  ),
                  width: MediaQuery.of(context).size.width * 0.18,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: TextButton(
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Confirm Payment',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      showAlertDialog(context);
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 150.0,
              top: 20,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .3,
              child: Column(
                children: [
                  const Text(
                    "Price Distribution",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  displayPriceRow("Total Price", '\$100'),
                  const SizedBox(
                    height: 20,
                  ),
                  displayPriceRow('Total Gst', '\$13'),
                  const SizedBox(
                    height: 20,
                  ),
                  displayPriceRow('Shipping Charges', '\$10'),
                  const SizedBox(
                    height: 20,
                  ),
                  displayPriceRow('Discount', '\$0.00'),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Total Amount",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "\$123",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
