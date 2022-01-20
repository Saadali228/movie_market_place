import 'package:flutter/material.dart';
import 'package:movie_market_place/account/widgets/account_grid.dart';
import 'package:movie_market_place/home_page/pages/home_page.dart';
import 'package:movie_market_place/home_page/widgets/logo_widget.dart';
import 'package:movie_market_place/home_page/widgets/size_config.dart';
import 'package:movie_market_place/utils/constants.dart';

double _tablet = 900;
double _mobile = 700;

class AddressBook extends StatelessWidget {
  static const addressBookPageRoute = '/address-book';
  const AddressBook({Key? key}) : super(key: key);
  Widget buildColumn(msg1, msg2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          msg1,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          msg2,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 60,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Address Book',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30.0),
              Container(
                height: size.height * 0.7,
                color: const Color(0xff361F41),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildColumn(
                            'Full Name',
                            'Syed Saad Ali',
                          ),
                          // const SizedBox(
                          //   width: 30,
                          // ),
                          buildColumn(
                            'Address',
                            'A300, Block N, North Nazimabad',
                          ),
                          buildColumn(
                            'Region',
                            'Sindh, Karachi, PK',
                          ),
                          buildColumn(
                            'Phone Number',
                            '03343586862',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50.0, top: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                '+Add New Address',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
