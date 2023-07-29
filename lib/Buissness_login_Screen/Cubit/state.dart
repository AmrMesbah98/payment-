abstract class paymentState {}

class paymentInitalstate extends paymentState{}

class paymentAuthLoudingstate extends paymentState{}
class paymentAuthSucessstate extends paymentState{}
class paymentAuthErrorstate extends paymentState{}


class paymentGetOrderRegistrationIdLoadingState extends paymentState{}
class paymentGetOrderRegistrationIdSucessState extends paymentState{}
class paymentGetOrderRegistrationIdErrorState extends paymentState{}


class paymentGetPaymentRequestLoadingState extends paymentState{}
class paymentGetPaymentRequestSucessState extends paymentState{}
class paymentGetPaymentRequestErrorState extends paymentState{}


class paymentRefCodeLoadingState extends paymentState{}
class paymentRefCodeSucessState extends paymentState{}
class paymentRefCodeErrorState extends paymentState{}




