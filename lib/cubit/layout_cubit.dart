import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:traning/api_service.dart';
import 'package:traning/cubit/layout_state.dart';
import 'package:http/http.dart' as http;
import 'package:traning/models/user_model.dart';


class DataCubit extends Cubit<DataState> {
  final ApiService apiService = ApiService();

  DataCubit() : super(DataState(items: []));

  Future<void> getData() async {
    try {
      final List<UserModel> items = await apiService.getItems();
      emit(DataState(items: items));
    } catch (e) {
      // Handle the error
    }
  }
}