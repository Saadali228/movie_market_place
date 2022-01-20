import 'package:flutter/material.dart';
import 'package:movie_market_place/account/widgets/account_grid.dart';
import 'package:movie_market_place/home_page/pages/home_page.dart';
import 'package:movie_market_place/home_page/widgets/logo_widget.dart';
import 'package:movie_market_place/home_page/widgets/size_config.dart';
import 'package:movie_market_place/utils/constants.dart';

double _tablet = 900;
double _mobile = 700;

class MyAccount extends StatelessWidget {
  static const myAccountPageRoute = '/my-account';
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double mHeight = MediaQuery.of(context).size.height;
    double mWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: backgroundGradient,
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
        body: Row(
          children: [
            Container(
              color: Colors.green,
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth! * 0.25,
            ),
            SizedBox(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth! * 0.75,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Manage My Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 20,
                      children: const [
                        AccountGrid(
                          heading: 'Personal Profile',
                          title: 'Khizr Farooqui',
                          subTitle: 'khizr_farooqui@hotmail.com',
                        ),
                        AccountGrid(
                          heading: 'Address Book',
                          title: 'Khizr Farooqui',
                          subTitle:
                              'House#B-215, Block 13D-1, Gulshan-e-Iqbal, Karachi Sindh - Karachi - Gulshan-e-Iqbal - Block 13 (+92) 3362209062',
                        ),
                        AccountGrid(
                          heading: 'Reviews',
                          title: 'Khizr Farooqui',
                          subTitle: 'No Reviews',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
