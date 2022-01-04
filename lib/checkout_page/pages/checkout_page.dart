import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:movie_market_place/cart/bloc/cart_bloc.dart';
import 'package:movie_market_place/checkout_page/bloc/checkout_bloc.dart';
import 'package:movie_market_place/checkout_page/widgets/checkout_item.dart';
import 'package:movie_market_place/checkout_page/widgets/checkout_total.dart';
import 'package:movie_market_place/checkout_page/widgets/mobile_textfield_view.dart';
import 'package:movie_market_place/checkout_page/widgets/web_textfield_view.dart';
import 'package:movie_market_place/home_page/pages/home_page.dart';
import 'package:movie_market_place/home_page/widgets/logo_widget.dart';
import 'package:movie_market_place/home_page/widgets/size_config.dart';
import 'package:movie_market_place/utils/constants.dart';

double _tablet = 900;
double _mobile = 700;

class CheckOutScreen extends StatelessWidget {
  static const checkOutPageRoute = '/checkout';
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mHeight = MediaQuery.of(context).size.height;
    double mWidth = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => CheckoutBloc(),
      child: Scaffold(
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
              top: 50.0,
              left: 25.0,
              right: 25.0,
              bottom: 25.0,
            ),
            child: Material(
              elevation: 6.0,
              child: Container(
                width: mWidth,
                height: mHeight,
                color: const Color(0xff361F41),
                child: BlocListener<CheckoutBloc, CheckoutState>(
                  listener: (context, state) {
                    if (state.status.isSubmissionSuccess) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      showAlertDialog(context);
                    }
                    if (state.status.isSubmissionInProgress) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(content: Text('Submitting...')),
                        );
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 35.0,
                      horizontal: size.width > _mobile ? 75.0 : 50.0,
                    ),
                    child: size.width > _mobile
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: SizedBox(
                                  width: mWidth * 0.3,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: RawScrollbar(
                                          thumbColor: const Color(0xff14141c),
                                          radius: const Radius.circular(25),
                                          isAlwaysShown: true,
                                          thickness: 8,
                                          child: CustomScrollView(
                                            slivers: checkoutItemsList(context),
                                          ),
                                        ),
                                      ),
                                      const CheckoutTotal(),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width < _tablet
                                    ? size.width * 0.4
                                    : size.width * 0.45,
                                decoration: const BoxDecoration(
                                  color: Color(0xff14141c),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SingleChildScrollView(
                                    primary: false,
                                    child: Center(
                                      child: size.width > _tablet
                                          ? const WebFieldsView()
                                          : const MobileFieldsView(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        : CustomScrollView(
                            slivers: [
                              ...checkoutItemsList(context),
                              const SliverToBoxAdapter(
                                child: CheckoutTotal(),
                              ),
                              SliverToBoxAdapter(
                                child: Container(
                                  width: mWidth,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff14141c),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: MobileFieldsView(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  List<Widget> checkoutItemsList(BuildContext context) {
    return [
      SliverToBoxAdapter(
        child: Row(
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
      ),
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return SliverPadding(
            padding: const EdgeInsets.only(
              top: 20.0,
              right: 15,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return CheckoutItem(
                    item: state.cartList[index],
                  );
                },
                childCount: state.cartList.length,
              ),
            ),
          );
        },
      ),
    ];
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
