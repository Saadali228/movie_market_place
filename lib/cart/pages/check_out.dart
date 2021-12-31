import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/cart/bloc/cart_bloc.dart';
import 'package:movie_market_place/cart/widgets/checkout_item.dart';
import 'package:movie_market_place/home_page/pages/home_page.dart';

double tablet = 870;
double mobile = 550;

class CheckOutScreen extends StatelessWidget {
  static const checkOutPageRoute = '/checkout';
  const CheckOutScreen({Key? key}) : super(key: key);

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("Go Back Home"),
      onPressed: () {
        context.read<CartBloc>().add(
              EmptyCart(),
            );
        Navigator.popUntil(
          context,
          ModalRoute.withName(
            HomeScreen.homePageRoute,
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
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
        const SizedBox(width: 16),
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 20,
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

  num subTotal(BuildContext context) {
    num ans = 0;
    for (var element in BlocProvider.of<CartBloc>(context).state.cartList!) {
      ans += element.price;
    }
    return ans;
  }

  @override
  Widget build(BuildContext context) {
    double mHeight = MediaQuery.of(context).size.height;
    double mWidth = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;

    var total = subTotal(context);

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xff1F0C3F),
          body: size.width > mobile
              ? Row(
                  children: [
                    Container(
                      height: mHeight,
                      width: mWidth * 0.3,
                      decoration: BoxDecoration(
                        color: const Color(0xff322043),
                        boxShadow: const [
                          BoxShadow(blurRadius: 20.0),
                        ],
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(mWidth * 0.05),
                        ),
                      ),
                      child: ListView.builder(
                          itemCount: state.cartList!.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return const CheckoutItem();
                          }),
                    ),
                  ],
                )
              : Container(),
        );
      },
    );

    // Widget createTextField(
    //   String text, [
    //   bool obsec = false,
    // ]) {
    //   return Expanded(
    //     child: Padding(
    //       padding: const EdgeInsets.only(
    //         bottom: 30,
    //       ),
    //       child: TextField(
    //         obscureText: obsec,
    //         decoration: InputDecoration(
    //           labelText: text,
    //           enabledBorder: OutlineInputBorder(
    //             borderSide: const BorderSide(
    //               width: 1,
    //               color: Colors.blue,
    //             ),
    //             borderRadius: BorderRadius.circular(
    //               10,
    //             ),
    //           ),
    //           focusedBorder: OutlineInputBorder(
    //             borderSide: const BorderSide(
    //               width: 1,
    //               color: Colors.black,
    //             ),
    //             borderRadius: BorderRadius.circular(
    //               10,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
  }
}

//     Widget showRow(
//       Widget textField1,
//       Widget textField2, [
//       bool isColumn = false,
//     ]) {
//       if (isColumn) {
//         return SizedBox(
//           height: 150,
//           width: size.width,
//           child: Column(
//             children: [
//               textField1,
//               textField2,
//             ],
//           ),
//         );
//       } else {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             textField1,
//             const SizedBox(width: 16),
//             textField2,
//           ],
//         );
//       }
//     }

//     bool isColumn = size.width < mobile;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         title: const Text(
//           'Checkout',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//             fontSize: 25,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: SizedBox(
//             width: size.width < tablet ? size.width * 0.8 : size.width * 0.5,
//             // height: MediaQuery.of(context).size.height,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 heading(
//                   '1',
//                   "User Details",
//                 ),
//                 showRow(
//                   createTextField(
//                     'Full Name',
//                   ),
//                   createTextField(
//                     'Phone Number',
//                   ),
//                   isColumn,
//                 ),
//                 showRow(
//                   createTextField(
//                     'Address 1',
//                   ),
//                   createTextField(
//                     'Address 2',
//                   ),
//                   isColumn,
//                 ),
//                 showRow(
//                   createTextField(
//                     'City',
//                   ),
//                   createTextField(
//                     'Country',
//                   ),
//                 ),
//                 heading(
//                   '2',
//                   "Payment Details",
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     createTextField(
//                       'Credit Card',
//                     ),
//                   ],
//                 ),
//                 showRow(
//                   createTextField(
//                     "CVV",
//                     true,
//                   ),
//                   createTextField(
//                     "Expiry",
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     bottom: 10.0,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         "Total Amount",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 50,
//                       ),
//                       Text(
//                         "\$$total",
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     top: 10,
//                     bottom: 30,
//                   ),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Colors.blueAccent,
//                       ),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(
//                           5.0,
//                         ),
//                       ),
//                       // color: Colors.green,
//                     ),
//                     // width: MediaQuery.of(context).size.width * 0.18,
//                     height: MediaQuery.of(context).size.height * 0.06,
//                     child: ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                           Colors.green,
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Padding(
//                             padding: EdgeInsets.only(right: 8.0),
//                             child: Icon(
//                               Icons.shopping_cart,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Text(
//                             'Confirm Payment',
//                             style: TextStyle(
//                               fontSize: 20.0,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                       onPressed: () {
//                         showAlertDialog(context);
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
