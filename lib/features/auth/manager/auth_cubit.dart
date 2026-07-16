import 'package:dio/dio.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cash/cache_helper.dart';
import 'package:depi/core/networks/remote/api_service.dart'; 
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiService apiService;
  AuthCubit(this.apiService) : super(AuthInitial());


  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      var result = await apiService.post(
        endPoint: '/api/v1/auth/signin',
        data: {
          'email': email,
          'password': password,
        },
      );
     
      String token = result['token'];
      
      await CacheHelper.saveData(key: 'token', value: token);

      emit(AuthSuccess(token: token));
    } catch (e) {
      if (e is DioException) {
        final errorMessage = e.response?.data['message'] ?? "Something went wrong";
        emit(AuthFailure(errMessage: errorMessage));
      } else {
        emit(AuthFailure(errMessage: e.toString()));
      }
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(AuthLoading());
    try {
      var result = await apiService.post(
        endPoint: '/api/v1/auth/signup',
        data: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": password, 
          "phone": phone
        },
      );

      String token = result['token'];
      await CacheHelper.saveData(key: 'token', value: token);

      emit(AuthSuccess(token: token));
    } catch (e) {
      if (e is DioException) {
        final errorMessage = e.response?.data['message'] ?? "Something went wrong";
        emit(AuthFailure(errMessage: errorMessage));
      } else {
        emit(AuthFailure(errMessage: e.toString()));
      }
    }
  }

  
  Future<void> forgotPassword({required String email}) async {
    emit(ForgotPasswordLoading());
    try {
      final data = await apiService.post(
        endPoint: '/api/v1/auth/forgotPasswords',
        data: {'email': email},
      );

      if (data['statusMsg'] == 'fail') {
         emit(ForgotPasswordFailure(data['message']));
      } else {
         emit(ForgotPasswordSuccess(data['message'] ?? "Reset code sent to your email!"));
      }
    } catch (e) {
      if (e is DioException) {
        final errorMessage = e.response?.data['message'] ?? "Something went wrong";
        emit(ForgotPasswordFailure(errorMessage));
      } else {
        emit(ForgotPasswordFailure(e.toString()));
      }
    }
  }
}