import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter_app_std/core/function/api_services.dart';
import 'package:flutter_app_std/views/product_details/logic/rate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'product_detals_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetalsInitial());

  final ApiServices _apiServices = ApiServices();
  String userId = Supabase.instance.client.auth.currentUser!.id;

  List<Rate> rates = [];
  double averageRate = 0;

  Future<void> getRates({required String productId}) async {
    emit(GetRateLoading());

    try {
      rates.clear(); // ✅ مهم جدًا
      averageRate = 0;

      Response response = await _apiServices.getData(
        "rats_table?select=*&for_product=eq.$productId",
      );

      for (var item in response.data) {
        rates.add(Rate.fromJson(item));
      }

      if (rates.isNotEmpty) {
        int total = 0;

        for (var r in rates) {
          total += r.rate ?? 0;
        }

        averageRate = total / rates.length;
      }
      bool _isUserRateExist({required String productId}) {
        for (var rate in rates) {
          if ((rate.forUser == userId) && (rate.forProduct == productId)) {
            return true;
          }
        }
        return false;
      }

      Future<void> addOrUpdateUserRate(
          {required String productId,
          required Map<String, dynamic> data}) async {
        // user rate exist ==> update for user rate
        // user doesn't exist ==> add rate
        String path =
            "rates_table?select=*&for_user=eq.$userId&for_product=eq.$productId";
        emit(AddOrUpdateRateLoading());
        try {
          if (_isUserRateExist(productId: productId)) {
            // user rate exist ==> update for user rate
            // patch data
            await _apiServices.patchData(path, data);
          } else {
            // post rate
            await _apiServices.postData(path, data);
          }

          emit(AddOrUpdateRateSuccess());
        } catch (e) {
          log(e.toString());
          emit(AddOrUpdateRateError());
        }
      }

      emit(GetRateSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetRateError());
    }
  }
}







//   void _getUserRate() {
  //   List<Rate> userRates = rates.where((Rate rate) {
  //     return rate.forUser == userId;
  //   }).toList();
  //   if (userRates.isNotEmpty) {
  //     userRate = userRates[0].rate!; // user rate
  //   }
  // }
  