import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/news_cubit/states.dart';
import 'package:flutter_news_app/modules/business/business.dart';
import 'package:flutter_news_app/modules/science/science.dart';
import 'package:flutter_news_app/modules/sports/sports.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currnetIndex = 0;
  List<BottomNavigationBarItem> navScreen = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business, size: 22), label: 'Business'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.sports_football,
          size: 22,
        ),
        label: 'Sports'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science, size: 22), label: 'science'),
  ];
  List<Widget> screen = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];
  void changeNavBar(int index) {
    if (index == 1) getSport();
    if (index == 2) getScience();
    currnetIndex = index;
    emit(BottomNavState());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  getBusiness() async {
    if (business.isEmpty) {
      emit(BusinessNewsLoadingState());

      Dio dio = Dio();
      dio.options.baseUrl = 'http://newsapi.org/';

      await dio.get('v2/top-headlines', queryParameters: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '2a08f9d7a6764c209c87044acacf14b5',
      }).then((value) {
        business = value.data['articles'] as List;

        emit(GetBusinessNews());
      }).catchError((e) {
        emit(GetBusinessNewsError(e.toString()));
      });
    } else {
      emit(GetBusinessNews());
    }
  }

  getSport() async {
    if (sports.isEmpty) {
      emit(SportNewsLoadingState());

      Dio dio = Dio();
      dio.options.baseUrl = 'http://newsapi.org/';

      await dio.get('v2/top-headlines', queryParameters: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '2a08f9d7a6764c209c87044acacf14b5',
      }).then((value) {
        sports = value.data['articles'] as List;

        emit(GetSportNews());
      }).catchError((e) {
        emit(GetSportNewsError(e.toString()));
      });
    } else {
      emit(GetSportNews());
    }
  }

  getScience() async {
    if (science.isEmpty) {
      emit(ScienceNewsLoadingState());

      Dio dio = Dio();
      dio.options.baseUrl = 'http://newsapi.org/';

      await dio.get('v2/top-headlines', queryParameters: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '2a08f9d7a6764c209c87044acacf14b5',
      }).then((value) {
        science = value.data['articles'] as List;

        emit(GetScienceNews());
      }).catchError((e) {
        emit(GetScienceNewsError(e.toString()));
      });
    } else {
      emit(GetScienceNews());
    }
  }

  goSearch(String value) async {
    emit(SearchNewsLoadingState());

    Dio dio = Dio();
    dio.options.baseUrl = 'http://newsapi.org/';

    await dio.get('v2/everything', queryParameters: {
      'q': value,
      'apiKey': '2a08f9d7a6764c209c87044acacf14b5',
    }).then((value) {
      search = value.data['articles'] as List;

      emit(GetSearchNews());
    }).catchError((e) {
      emit(GetSearchNewsError(e.toString()));
    });
  }
}
