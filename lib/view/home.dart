
import 'package:cubit_get_api/cubit/user_cubit.dart';
import 'package:cubit_get_api/cubit/user_cubit_state.dart';
import 'package:cubit_get_api/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePaage extends StatefulWidget {
  const HomePaage({Key? key}) : super(key: key);

  @override
  State<HomePaage> createState() => _HomePaageState();
}
class _HomePaageState extends State<HomePaage> {
  @override
  void initState() {
    context.read<UserCubit>().getAllUser();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Get Api"),
      ),
      body: BlocBuilder<UserCubit, UserCubitState>(
        builder: (context,state){
          if(state is UserCubitLoading){
            return Center(child: CircularProgressIndicator());
          }
          else if(state is UserCubitError){
            return Center(child: Text(state.msg.toString()),);
          }
          else if(state is UserCubitDataLoaded){
            return ListView.builder(itemBuilder: (context , itemIndex){
              return ListTile(
                leading: Text(state.userList[itemIndex].id.toString()),
                title: Text(state.userList[itemIndex].name.toString()),
                subtitle: Text(state.userList[itemIndex].email.toString()),
              );
            },itemCount: state.userList.length,);
          }
          else{
            return const Center(
              child: SizedBox(
                child: Text("Hello"),
              ),
            );
          }
        },
      ),
    );
  }
}
