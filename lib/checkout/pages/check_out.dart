import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/cart/bloc/cart_bloc.dart';
import 'package:movie_market_place/checkout/widgets/checkout_item.dart';
import 'package:movie_market_place/checkout/widgets/mobile_textfield_view.dart';
import 'package:movie_market_place/checkout/widgets/web_textfield_view.dart';
import 'package:movie_market_place/home_page/pages/home_page.dart';
import 'package:movie_market_place/home_page/widgets/logo_widget.dart';
import 'package:movie_market_place/home_page/widgets/size_config.dart';
import 'package:movie_market_place/utils/constants.dart';

double _tablet = 870;
double _mobile = 550;

class CheckOutScreen extends StatelessWidget {
  static const checkOutPageRoute = '/checkout';
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mHeight = MediaQuery.of(context).size.height;
    double mWidth = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;

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
              width: mWidth,
              height: mHeight,
              color: const Color(0xff361F41),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: size.width > _mobile
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: mWidth * 0.3,
                            child: checkoutItemsList(
                                const BouncingScrollPhysics(), false, context),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: size.width > _tablet
                                      ? WebFieldsView(
                                          onTap: () => showAlertDialog(context),
                                        )
                                      : MobileFieldsView(
                                          onTap: () => showAlertDialog(context),
                                        ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : ListView(
                        padding: const EdgeInsets.all(0),
                        scrollDirection: Axis.vertical,
                        children: [
                          SizedBox(
                            width: mWidth,
                            height: mHeight * 0.35,
                            child: checkoutItemsList(
                                const ClampingScrollPhysics(), true, context),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: mWidth,
                            decoration: const BoxDecoration(
                              color: Color(0xff14141c),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: MobileFieldsView(
                                onTap: () => showAlertDialog(context),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  num subTotal(BuildContext context) {
    num ans = 0;
    for (var element in context.read<CartBloc>().state.cartList) {
      ans += element.price;
    }
    return ans;
  }

  Widget checkoutItemsList(
      ScrollPhysics physics, bool shrinkWrap, BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  itemCount: state.cartList.length,
                  scrollDirection: Axis.vertical,
                  physics: physics,
                  shrinkWrap: shrinkWrap,
                  primary: false,
                  itemBuilder: (context, index) {
                    return CheckoutItem(
                      item: state.cartList[index],
                    );
                  }),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.only(
            top: size.width < _mobile ? 0 : 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                "\$${subTotal(context).toString()}",
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
    );
  }

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
}
