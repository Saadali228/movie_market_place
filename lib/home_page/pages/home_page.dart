import 'package:flutter/material.dart';
import 'package:movie_market_place/cart/pages/cart_page.dart';
import 'package:movie_market_place/home_page/widgets/cart_button.dart';
import 'package:movie_market_place/home_page/widgets/home_banner.dart';
import 'package:movie_market_place/home_page/widgets/logo_widget.dart';
import 'package:movie_market_place/home_page/widgets/movie_grid.dart';
import 'package:movie_market_place/home_page/widgets/size_config.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  final PageController controller = PageController();
  static const homePageRoute = '/';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
        backgroundColor: Colors.transparent,
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
          const MovieGrid(),
        ],
      ),
    );
  }
}
