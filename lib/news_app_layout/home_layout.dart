import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_news_app/cubit/news_cubit/cubit.dart';
import 'package:flutter_news_app/cubit/news_cubit/states.dart';
import 'package:flutter_news_app/shared/components.dart';

import '../cubit/theme_cubit/theme_cubit.dart';
import '../news_search/news_search.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (BuildContext context, state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(
          body: cubit.screen[cubit.currnetIndex],
          appBar: AppBar(
            title: Text("${cubit.navScreen[cubit.currnetIndex].label}"),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 34,
                  )),
              IconButton(
                  onPressed: () {
                    ThemeCubit.get(context).changeAppTheme();
                  },
                  icon: const Icon(
                    Icons.brightness_4_outlined,
                    color: Colors.grey,
                    size: 30,
                  ))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.navScreen,
            currentIndex: cubit.currnetIndex,
            onTap: (index) {
              cubit.changeNavBar(index);
            },
          ),
        );
      },
      listener: (BuildContext context, state) {},
    );
  }
}
