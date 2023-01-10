import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/theme_cubit/theme_state.dart';
import 'package:flutter_news_app/network/local/cache_helper.dart';

class ThemeCubit extends Cubit<ThemeState> {
 ThemeCubit() : super(InitialAppTheme());

  static ThemeCubit get(context) => BlocProvider.of(context);
  
   bool isDark=false;
       
      
      void changeAppTheme( {bool? fromShared}){

        if (fromShared!=null)
        {isDark=fromShared;
         emit(ChangeAppTheme());
        
        }
        else {
          isDark=!isDark;
     
          CacheHelper.putBool(key: 'isDark',value: isDark).then((value) {
            emit(ChangeAppTheme());
          });}
    
          
      }
  
  }