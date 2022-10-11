import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/news_cubit/cubit.dart';
import 'package:flutter_news_app/cubit/news_cubit/states.dart';
import 'package:flutter_news_app/shared/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: ((context, state) {}),
        builder: (context, state) {
          var list=NewsCubit.get(context).business;
          return buildArticle(list,context);
        });
  }
}
