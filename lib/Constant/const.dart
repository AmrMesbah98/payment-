class Constant {
  //  https://accept.paymob.com/api/auth/tokens
  // https://accept.paymob.com/api/ecommerce/orders
  // https://accept.paymob.com/api/acceptance/payment_keys
  static const String baseUrl = 'https://accept.paymob.com/api';
  static const String getAuth = '/auth/tokens';
  static const String paymentApiKey =
      'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TWpreE5UazFMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuU2JBYTJ4TXdjc0V0dWhrN0VLLTFHYUlITnJieDdINkNQcDFHRi1PdlREaExHV2ZaMUswX2l5VFVRRndOVUVZWmdsSE5Ec1dZZ21NU0pzSWNNUU42aWc=';
  static const String getOrderId = '/ecommerce/orders';
  static String visaUrl =
      'https://accept.paymob.com/api/acceptance/iframes/581238?payment_token=$finalToken';
  static const String getPaymentId = '/acceptance/payment_keys';
  static const String getRefCode = '/acceptance/payments/pay';

  static String paymentFirstToken = '';
  static String paymentOrderId = '';
  static String finalToken = '';
  static String refCode = '';

  static String intrgraionIdKiosk = '3799696';
  static String intrgraionIdCart = '3791471';
}
