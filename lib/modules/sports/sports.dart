import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/news_cubit/cubit.dart';

import '../../cubit/news_cubit/states.dart';
import '../../shared/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: ((context, state) {}),
        builder: (context, state) {
          var list=NewsCubit.get(context).sports;
        return buildArticle(list,context);
        });
  }
}