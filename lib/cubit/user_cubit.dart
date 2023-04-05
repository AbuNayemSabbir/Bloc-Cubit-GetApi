


import 'package:cubit_get_api/cubit/user_cubit_state.dart';
import 'package:cubit_get_api/service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user_model.dart';

class UserCubit extends Cubit<UserCubitState>{
   List<UserModel> userList=[];
   ApiService apiService;

   UserCubit({required this.apiService}) : super(UserCubitInit());

   void getAllUser() async{
     try{
       emit(UserCubitLoading());
       userList=await apiService.getApi();
       emit(UserCubitDataLoaded(userList: userList));

   }catch(e){
emit(UserCubitError(msg: e.toString()));
     }
   }


}