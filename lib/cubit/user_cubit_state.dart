
import 'package:equatable/equatable.dart';

import '../model/user_model.dart';

abstract class UserCubitState extends Equatable{
  const UserCubitState();
}
class UserCubitInit extends UserCubitState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class UserCubitError extends UserCubitState{
  String msg;
  UserCubitError({required this.msg});
  @override
  // TODO: implement props
  List<Object?> get props => [msg];

}
class UserCubitLoading extends UserCubitState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class UserCubitDataLoaded extends UserCubitState{
  List<UserModel> userList=[];
  UserCubitDataLoaded({required this.userList});
  @override
  // TODO: implement props
  List<Object?> get props => [userList];

}