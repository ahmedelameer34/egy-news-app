abstract class NewsStates {}

class NewsInitial extends NewsStates {}

class BottomNavState extends NewsStates {}

class BusinessNewsLoadingState extends NewsStates {}

class GetBusinessNews extends NewsStates {}

class GetBusinessNewsError extends NewsStates {
  final String? error;

  GetBusinessNewsError(this.error);
}

class SportNewsLoadingState extends NewsStates {}

class GetSportNews extends NewsStates {}

class GetSportNewsError extends NewsStates {
  final String? error;

  GetSportNewsError(this.error);
}

class ScienceNewsLoadingState extends NewsStates {}

class GetScienceNews extends NewsStates {}

class GetScienceNewsError extends NewsStates {
  final String? error;

  GetScienceNewsError(this.error);
}

class SearchNewsLoadingState extends NewsStates {}

class GetSearchNews extends NewsStates {}

class GetSearchNewsError extends NewsStates {
  final String? error;

  GetSearchNewsError(this.error);
}
