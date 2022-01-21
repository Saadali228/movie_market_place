import 'package:flutter/material.dart';
import 'package:movie_market_place/account/widgets/address_book.dart';
import 'package:movie_market_place/account/widgets/my_account.dart';
import 'package:movie_market_place/account/widgets/my_profile.dart';
import 'package:movie_market_place/home_page/pages/home_page.dart';
import 'package:movie_market_place/home_page/widgets/logo_widget.dart';
import 'package:movie_market_place/home_page/widgets/size_config.dart';
import 'package:movie_market_place/utils/constants.dart';

double _mobile = 700;

class AccountPage extends StatefulWidget {
  static const accountPageRoute = '/account';
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundGradient,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NavigationRail(
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (MediaQuery.of(context).size.width < _mobile)
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 20,
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
                    child: SizeConfig.screenWidth! > _mobile
                        ? const LogoWidget()
                        : const Icon(
                            Icons.movie,
                            color: Colors.white,
                            size: 30,
                          ),
                  ),
                ],
              ),
              backgroundColor: const Color(0xff361F41),
              elevation: 1,
              extended: SizeConfig.screenWidth! > _mobile ? true : false,
              selectedIconTheme: const IconThemeData(
                color: Colors.white,
                size: 25,
                opacity: 1,
              ),
              unselectedIconTheme: const IconThemeData(
                color: Colors.white,
                size: 20,
                opacity: 0.3,
              ),
              unselectedLabelTextStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              selectedLabelTextStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.account_circle_outlined),
                  selectedIcon: Icon(Icons.account_circle),
                  label: Text('Manage My Account'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: Text('My Profile'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.place_outlined),
                  selectedIcon: Icon(Icons.place),
                  label: Text('Address Book'),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _selectedIndex == 0
                    ? const MyAccount()
                    : _selectedIndex == 1
                        ? const MyProfile()
                        : _selectedIndex == 2
                            ? const AddressBook()
                            : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
