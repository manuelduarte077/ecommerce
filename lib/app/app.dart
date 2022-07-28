import 'package:ecommerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/theme/theme.dart';
import 'package:ecommerce/config/app_router.dart';

import 'package:ecommerce/screens/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WishlistBloc()..add(StartWishlist()),
        )
      ],
      child: MaterialApp(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
