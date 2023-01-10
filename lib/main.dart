import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_news_app/cubit/news_cubit/cubit.dart';
import 'package:flutter_news_app/network/remote/dio_helper.dart';

import 'package:flutter_news_app/news_app_layout/home_layout.dart';


import 'cubit/theme_cubit/theme_cubit.dart';
import 'cubit/theme_cubit/theme_state.dart';
import 'network/local/cache_helper.dart';
import 'shared/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBool(key: 'isDark');
  runApp(MyApp(isDark!));
}

class MyApp extends StatelessWidget {
  const MyApp(this.isDark, {super.key});
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              ThemeCubit()..changeAppTheme(fromShared: isDark),
        ),
        BlocProvider(
          create: (BuildContext context) => NewsCubit()..getBusiness()..getSport()..getScience() ,
        ),
      ],
      child: BlocConsumer<ThemeCubit, ThemeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                
                theme: ThemeData(
                  textTheme: const TextTheme(
                      bodyText1: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black)),
                  scaffoldBackgroundColor: Colors.white,
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                      unselectedItemColor: Colors.grey,
                      backgroundColor: Colors.white,
                      elevation: 20,
                      selectedLabelStyle: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: mainColor),
                  appBarTheme: const AppBarTheme(
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarBrightness: Brightness.dark,
                        statusBarColor: mainColor,
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      titleTextStyle: TextStyle(
                          color: mainColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  primarySwatch: mainColor,
                ),
                darkTheme: ThemeData(
                  textTheme: const TextTheme(
                      bodyText1: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255))),
                  scaffoldBackgroundColor: const Color.fromARGB(92, 92, 90, 90),
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                      unselectedItemColor: Colors.grey,
                      backgroundColor: Color.fromARGB(92, 92, 90, 90),
                      elevation: 20,
                      selectedLabelStyle: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: mainColor),
                  appBarTheme: const AppBarTheme(
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarBrightness: Brightness.light,
                        statusBarColor: mainColor,
                      ),
                      backgroundColor: Color.fromARGB(92, 92, 90, 90),
                      elevation: 0,
                      titleTextStyle: TextStyle(
                          color: mainColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  primarySwatch: mainColor,
                ),
                themeMode: ThemeCubit.get(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: const NewsLayout());
          }),
    );
  }
}
