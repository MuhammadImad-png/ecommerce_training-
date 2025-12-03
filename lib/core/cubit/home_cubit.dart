import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/function/api_services.dart';
import 'package:flutter_app_std/core/model/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitial());

  final ApiServices _apiServices = ApiServices();

  // 🔥 هنا بنضيف المتغير اللي UI هيستخدمه
  List<ProductModel> products = [];

  Future<void> getproducts() async {
    emit(GetDataLoading());

    try {
      Response response = await _apiServices.getData(
        "Products_table?select=*,Favorite_product(*),purchase_table(*)",
      );
      products.clear();
      for (var product in response.data as List) {
        products.add(ProductModel.fromJson(product));
      }

      // log(response.toString());

      // نخزن الداتا اللي جاية من API
      // products = response as List<ProductModel> ;

      emit(GetDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetDataError());
    }
  }
}
