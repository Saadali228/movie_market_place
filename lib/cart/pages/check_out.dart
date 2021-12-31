import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/cart/bloc/cart_bloc.dart';
import 'package:movie_market_place/cart/widgets/checkout_item.dart';
import 'package:movie_market_place/home_page/pages/home_page.dart';
import 'package:movie_market_place/home_page/widgets/logo_widget.dart';
import 'package:movie_market_place/home_page/widgets/size_config.dart';
import 'package:movie_market_place/utils/constants.dart';

double _tablet = 870;
double _mobile = 550;

class CheckOutScreen extends StatelessWidget {
  static const checkOutPageRoute = '/checkout';
  const CheckOutScreen({Key? key}) : super(key: key);

  showAlertDialog(BuildContext context) {
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
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(fontSize: 15, color: Colors.black),
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
              color: Colors.white,
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

    Widget createTextField(
      String text, [
      bool obsec = false,
      double? width,
    ]) {
      return SizedBox(
        height: 80,
        width: width ?? mWidth * 0.22,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 30,
          ),
          child: TextField(
            style: const TextStyle(
              color: Colors.white,
            ),
            obscureText: obsec,
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                color: Colors.white,
              ),
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
              labelText: text,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.deepPurple,
                ),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.purple,
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

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                SizedBox(
                  width: 3 * SizeConfig.blockSizeHorizontal!,
                ),
                if (MediaQuery.of(context).size.width < _mobile)
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                InkWell(
                  onTap: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      Navigator.of(context)
                          .pushReplacementNamed(HomeScreen.homePageRoute);
                    }
                  },
                  child: const LogoWidget(),
                ),
              ],
            ),
            centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
          body: Stack(children: [
            Container(
              decoration: backgroundGradient,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 78.0,
                left: 48.0,
                right: 48.0,
                bottom: 48.0,
              ),
              child: Material(
                elevation: 6.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: const Color(0xff361F41),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: size.width > _mobile
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: mWidth * 0.3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Movie',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'Price',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                          padding: const EdgeInsets.only(
                                            top: 10.0,
                                          ),
                                          itemCount: state.cartList!.length,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, index) {
                                            return CheckoutItem(
                                              item: state.cartList![index],
                                            );
                                          }),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Total Amount:',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "\$${total.toString()}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: size.width < _tablet
                                    ? size.width * 0.4
                                    : size.width * 0.5,
                                decoration: const BoxDecoration(
                                  color: Color(0xff14141c),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: size.width > _tablet
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                heading(
                                                  '1',
                                                  "User Details",
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    createTextField(
                                                      'Full Name',
                                                    ),
                                                    //const SizedBox(width: 5.0),
                                                    createTextField(
                                                      'Phone Number',
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    createTextField(
                                                      'Address 1',
                                                    ),
                                                    // const SizedBox(width: 5.0),
                                                    createTextField(
                                                      'Address 2',
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    createTextField(
                                                      'City',
                                                    ),
                                                    //  const SizedBox(width: 5.0),
                                                    createTextField(
                                                      'Country',
                                                    ),
                                                  ],
                                                ),
                                                heading(
                                                  '2',
                                                  "Payment Details",
                                                ),
                                                createTextField(
                                                  'Credit Card',
                                                  false,
                                                  mWidth,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    createTextField(
                                                      "CVV",
                                                      true,
                                                    ),
                                                    //  const SizedBox(width: 5.0),
                                                    createTextField(
                                                      "Expiry",
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 10,
                                                    bottom: 30,
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color:
                                                            Colors.blueAccent,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(
                                                          5.0,
                                                        ),
                                                      ),
                                                      // color: Colors.green,
                                                    ),
                                                    // width: MediaQuery.of(context).size.width * 0.18,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                          Colors.deepPurple,
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: const [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 8.0),
                                                            child: Icon(
                                                              Icons
                                                                  .shopping_cart,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Confirm Payment',
                                                            style: TextStyle(
                                                              fontSize: 20.0,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      onPressed: () {
                                                        showAlertDialog(
                                                            context);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                heading(
                                                  '1',
                                                  "User Details",
                                                ),
                                                createTextField(
                                                  'Full Name',
                                                  false,
                                                  mWidth,
                                                ),
                                                createTextField(
                                                  'Phone Number',
                                                  false,
                                                  mWidth,
                                                ),
                                                createTextField(
                                                  'Address 1',
                                                  false,
                                                  mWidth,
                                                ),
                                                createTextField(
                                                  'Address 2',
                                                  false,
                                                  mWidth,
                                                ),
                                                createTextField(
                                                  'City',
                                                  false,
                                                  mWidth,
                                                ),
                                                createTextField(
                                                  'Country',
                                                  false,
                                                  mWidth,
                                                ),
                                                heading(
                                                  '2',
                                                  "Payment Details",
                                                ),
                                                createTextField(
                                                  'Credit Card',
                                                  false,
                                                  mWidth,
                                                ),
                                                createTextField(
                                                  "CVV",
                                                  true,
                                                  mWidth,
                                                ),
                                                createTextField(
                                                  "Expiry",
                                                  false,
                                                  mWidth,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 10,
                                                    bottom: 30,
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color:
                                                            Colors.blueAccent,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(
                                                          5.0,
                                                        ),
                                                      ),
                                                    ),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                          Colors.deepPurple,
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: const [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 8.0),
                                                            child: Icon(
                                                              Icons
                                                                  .shopping_cart,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Confirm Payment',
                                                            style: TextStyle(
                                                              fontSize: 20.0,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      onPressed: () {
                                                        showAlertDialog(
                                                            context);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        : Container(),
                  ),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
