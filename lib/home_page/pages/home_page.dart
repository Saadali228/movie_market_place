import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_market_place/account/pages/account_page.dart';
import 'package:movie_market_place/cart/bloc/cart_bloc.dart';
import 'package:movie_market_place/cart/pages/cart_page.dart';
import 'package:movie_market_place/home_page/bloc/movie_bloc.dart';
import 'package:movie_market_place/home_page/widgets/account_button.dart';
import 'package:movie_market_place/home_page/widgets/cart_button.dart';
import 'package:movie_market_place/home_page/widgets/home_banner.dart';
import 'package:movie_market_place/home_page/widgets/logo_widget.dart';
import 'package:movie_market_place/home_page/widgets/movie_grid.dart';
import 'package:movie_market_place/home_page/widgets/search_button.dart';
import 'package:movie_market_place/home_page/widgets/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  static const homePageRoute = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController();

  @override
  void initState() {
    controller.addListener(() {
      setState(() {});
    });
    BlocProvider.of<CartBloc>(context).add(
      UpdateCartCount(),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => MovieBloc(
        RepositoryProvider.of(context),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff1F0C3F),
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(
                width: 3 * SizeConfig.blockSizeHorizontal!,
              ),
              const LogoWidget(),
            ],
          ),
          actions: [
            controller.hasClients && controller.page != 0
                ? Container()
                : SearchButton(
                    onTap: () => controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    ),
                  ),
            SizedBox(
              width: 1 * SizeConfig.blockSizeHorizontal!,
            ),
            AccountButton(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AccountPage.accountPageRoute,
                );
              },
            ),
            SizedBox(
              width: 1 * SizeConfig.blockSizeHorizontal!,
            ),
            Builder(builder: (context) {
              return CartButton(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            }),
            SizedBox(
              width: 3 * SizeConfig.blockSizeHorizontal!,
            ),
          ],
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: controller.hasClients && controller.page == 1
              ? const Color(0xff1F0C3F)
              : Colors.transparent,
          elevation: 0,
        ),
        endDrawer: const CartDrawer(),
        extendBodyBehindAppBar: true,
        body: PageView(
          controller: controller,
          scrollDirection: Axis.vertical,
          children: [
            HomeBanner(
              controller: controller,
            ),
            MovieGrid(
              pageController: controller,
            ),
          ],
        ),
      ),
    );
  }
}
