import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_market_place/account/pages/address_book.dart';
// import 'package:movie_market_place/account/pages/my_account.dart';
import 'package:movie_market_place/account/pages/account_page.dart';
import 'package:movie_market_place/cart/bloc/cart_bloc.dart';
import 'package:movie_market_place/cart/repository_layer/cart_repository.dart';
import 'package:movie_market_place/detail_page/data_layer/movie_detail_data_layer.dart';
import 'package:movie_market_place/detail_page/pages/detail_page.dart';
import 'package:movie_market_place/detail_page/repository_layer/movie_detail_repo_layer.dart';
import 'package:movie_market_place/home_page/data_layer/movie_data_layer.dart';
import 'package:movie_market_place/home_page/pages/home_page.dart';
import 'package:movie_market_place/home_page/repository_layer/movie_repo_layer.dart';
import 'package:movie_market_place/search/bloc/search_bloc.dart';
import 'package:movie_market_place/search/data_layer/search_data_layer.dart';
import 'package:movie_market_place/search/repository_layer/search_repo_layer.dart';
import 'package:url_strategy/url_strategy.dart';
import 'cart/data_layer/cart_data_layer.dart';
import 'checkout_page/pages/checkout_page.dart';

void main() {
  setPathUrlStrategy();
  MovieDataLayer _movieProvider = MovieDataLayer();
  MovieRepoLayer movieRepository = MovieRepoLayer(_movieProvider);
  MovieDetailDataLayer _movieDetailProvider = MovieDetailDataLayer();
  MovieDetailRepoLayer movieDetailRepository =
      MovieDetailRepoLayer(_movieDetailProvider);
  CartProvider _cartProvider = CartProvider();
  CartRepository cartRepository = CartRepository(_cartProvider);
  SearchDataLayer _searchDataLayer = SearchDataLayer();
  SearchRepoLayer searchRepository = SearchRepoLayer(_searchDataLayer);
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: movieRepository),
        RepositoryProvider.value(value: movieDetailRepository),
        RepositoryProvider.value(value: cartRepository),
        RepositoryProvider.value(value: searchRepository),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBloc(
            RepositoryProvider.of(context),
          ),
        ),
        BlocProvider(
          create: (context) => CartBloc(
            RepositoryProvider.of(context),
          ),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie Mart',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            primaryColor: const Color(0xff322043),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.mulishTextTheme(),
          ),
          initialRoute: "/",
          onGenerateRoute: (settings) {
            final settingsUri = Uri.parse(settings.name ?? "/");
            if (settingsUri.path == "/") {
              return MaterialPageRoute(
                settings: settings,
                builder: (context) => const HomeScreen(),
              );
            }
            if (settingsUri.path == "/movie") {
              int? movieId =
                  int.tryParse(settingsUri.queryParameters["id"] ?? "");
              return MaterialPageRoute(
                settings: settings,
                builder: (context) => DetailPage(id: movieId!),
              );
            }
            if (settingsUri.path == "/account") {
              return MaterialPageRoute(
                settings: settings,
                builder: (context) => const AccountPage(),
              );
            }
            // if (settingsUri.path == "/address-book") {
            //   return MaterialPageRoute(
            //     settings: settings,
            //     builder: (context) => const AddressBook(),
            //   );
            // }
            if (settingsUri.path == "/checkout") {
              return MaterialPageRoute(
                settings: settings,
                builder: (context) => const CheckOutScreen(),
              );
            }
          }
          // home: const HomePage(),
          ),
    );
  }
}
