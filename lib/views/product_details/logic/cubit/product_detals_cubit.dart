import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/function/api_services.dart';
import 'package:flutter_app_std/views/product_details/logic/rate.dart';
import 'package:meta/meta.dart';

part 'product_detals_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetalsInitial());
  final ApiServices apiServices = ApiServices();
  List<Rate> rates = [];

  Future<void> getRates({required String productId}) async {
    emit(GetRateLoading());
    try {
      Response response = await apiServices
          .getData("rats_table?select=*&for_product=eq.$productId");
      for (var rate in response.data) {
        rates.add(Rate.fromJson(rate));
      }
      emit(GetRateSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetRateError());
    }
  }
}
