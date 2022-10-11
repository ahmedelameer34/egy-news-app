import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/news_cubit/cubit.dart';
import 'package:flutter_news_app/cubit/news_cubit/states.dart';
import 'package:flutter_news_app/shared/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(color: Colors.grey),
                child: defTextFormField(
                    context: context,
                    onSubmit: () {},
                    onTap: () {},
                    onChange: (value) {
                      NewsCubit.get(context).goSearch(value);
                    },
                    controller: searchController,
                    textType: TextInputType.text,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'search must not be empty ';
                      }
                      return null;
                    },
                    label: 'Search',
                    prefix: Icons.search),
              ),
              Expanded(child: buildArticle(list, context, isSearch: true))
            ],
          ),
        );
      },
    );



    
    
  }

}