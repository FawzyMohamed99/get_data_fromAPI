import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traning/cubit/layout_cubit.dart';
import 'package:traning/cubit/layout_state.dart';
import 'package:traning/models/user_model.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);


   final DataCubit dataCubit = DataCubit();
  @override
  Widget build(BuildContext context) {
    List<UserModel> userModel;
    return Scaffold(
      body: BlocBuilder<DataCubit, DataState>(
        bloc: dataCubit,
        builder: (context, state) {
          if (state.items.isNotEmpty) {
            final List<UserModel> items = state.items;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return Column(
                  children: [
                    Text('${item.postId}'),
                    Text('${item.id}'),
                    Text('${item.name}'),
                    Text('${item.email}'),
                    Text('${item.body}'),
                    SizedBox(height: 10,)

                  ],
                );
              },
            );
          } else {
            dataCubit.getData(); // Trigger the API request
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
