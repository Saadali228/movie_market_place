import 'package:flutter/material.dart';
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
      endDrawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
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