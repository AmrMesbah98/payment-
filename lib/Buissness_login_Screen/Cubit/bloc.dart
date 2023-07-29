import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Buissness_login_Screen/Cubit/state.dart';
import 'package:payment/Constant/const.dart';
import 'package:payment/Helper/helper.dart';

import '../../DataLayer_screen/Model/auth_request_model.dart';
import '../../DataLayer_screen/Model/payment_request_model.dart';
import '../../DataLayer_screen/Model/registertion_model.dart';

class paymentcubit extends Cubit<paymentState> {
  paymentcubit() : super(paymentInitalstate());

  static paymentcubit get(context) => BlocProvider.of(context);

  AuthenticationRequestModel? authTokenModel;

  Future<void> getAuthTaken() async {
    emit(paymentAuthLoudingstate());
    DioHelper.postData(url: Constant.getAuth, data: {
      "api_key": Constant.paymentApiKey,
    }).then((value) {
      authTokenModel = AuthenticationRequestModel.fromJson(value.data);
      Constant.paymentFirstToken = authTokenModel!.token;
      print("the token is ${Constant.paymentFirstToken}");
      emit(paymentAuthSucessstate());
    }).catchError((error) {
      emit(paymentAuthErrorstate());
      print(error);
    });
  }

  Future<void> getOrderRegistrationId({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    emit(paymentGetOrderRegistrationIdSucessState());
    DioHelper.postData(url: Constant.getOrderId, data: {
      "auth_token": Constant.paymentFirstToken,
      "delivery_needed": false,
      "amount_cents": price,
      "country": "EGY",
    }).then((value) {
      OrderRegistrationModel orderRegistrationModel =
      OrderRegistrationModel.fromJson(value.data);
      Constant.paymentOrderId = orderRegistrationModel.id.toString();
      getPaymentRequest(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        price: price,
      );
      print(Constant.paymentOrderId);
      emit(paymentGetOrderRegistrationIdSucessState());
    }).catchError((error) {
      print(error.toString());
      paymentGetOrderRegistrationIdErrorState();
    });
  }

  Future<void> getPaymentRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    emit(paymentGetPaymentRequestLoadingState());
    DioHelper.postData(url: Constant.getOrderId, data: {
      "auth_token": Constant.paymentFirstToken,
      "amount_cents": price,
      "order_id": Constant.paymentOrderId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": Constant.intrgraionIdCart,
      "lock_order_when_paid": "false"
    }).then((value) {
      PaymentRequestModel paymentRequestModel =
      PaymentRequestModel.fromJson(value.data);
      Constant.finalToken = paymentRequestModel.token;
      print('final token is ${Constant.finalToken}');
      emit(paymentGetPaymentRequestSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(paymentGetPaymentRequestErrorState());
    });
  }




  Future getRefCode() async {
    DioHelper.postData(
      url: Constant.getRefCode,
      data: {
        "source": {
          "identifier": "AGGREGATOR",
          "subtype": "AGGREGATOR",
        },
        "payment_token": Constant.finalToken,
      },
    ).then((value) {
      Constant.refCode = value.data['id'].toString();
      print('The ref code 🍅${Constant.refCode}');
      emit(paymentRefCodeSucessState());
    }).catchError((error) {
      print("Error in ref code 🤦‍♂️");
      emit(paymentRefCodeErrorState());
    });
  }
}
