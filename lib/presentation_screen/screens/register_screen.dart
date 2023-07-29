import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/presentation_screen/screens/toggel_Screen.dart';
import 'package:payment/presentation_screen/widgets/Default_Botton.dart';
import 'package:payment/presentation_screen/widgets/textformfield.dart';

import '../../Buissness_login_Screen/Cubit/bloc.dart';
import '../../Buissness_login_Screen/Cubit/state.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  GlobalKey<FormState> privateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => paymentcubit()..getAuthTaken(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Payment integration'),
          ),
          body: BlocConsumer<paymentcubit, paymentState>(
            listener: (context, state) {
              if (state is paymentGetPaymentRequestSucessState) {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return ToggleScreen();
                }));
              }
            },
            builder: (context, state) {
              var cubit = paymentcubit.get(context);
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Image(
                        image: AssetImage('assets/images/Delivery.png'),
                        width: double.infinity,
                        height: 300,
                      ),
                      const SizedBox(height: 20),
                      Form(
                        key: privateKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: DefaultTextFormField(
                                      type: TextInputType.text,
                                      hintText: "First Name",
                                      prefix: Icons.person,
                                      controller: firstNameController,
                                      validate: (dynamic value) {
                                        if (value!.isEmpty) {
                                          return 'pls enter first name';
                                        }
                                        return null;
                                      }),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: DefaultTextFormField(
                                      type: TextInputType.text,
                                      hintText: "last Name",
                                      prefix: Icons.person,
                                      controller: lastNameController,
                                      validate: (dynamic value) {
                                        if (value!.isEmpty) {
                                          return 'pls enter last name';
                                        }
                                        return null;
                                      }),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            DefaultTextFormField(
                                type: TextInputType.emailAddress,
                                hintText: "Email",
                                prefix: Icons.email,
                                controller: emailController,
                                validate: (dynamic value) {
                                  if (value!.isEmpty) {
                                    return 'pls enter email ';
                                  }
                                  return null;
                                }),
                            const SizedBox(height: 20.0),
                            DefaultTextFormField(
                                type: TextInputType.number,
                                hintText: "phone",
                                prefix: Icons.phone,
                                controller: phoneController,
                                validate: (dynamic value) {
                                  if (value!.isEmpty) {
                                    return 'pls enter Phone';
                                  }
                                  return null;
                                }),
                            const SizedBox(height: 20.0),
                            DefaultTextFormField(
                                type: TextInputType.number,
                                hintText: "price",
                                prefix: Icons.attach_money_outlined,
                                controller: priceController,
                                validate: (dynamic value) {
                                  if (value!.isEmpty) {
                                    return 'pls enter price';
                                  }
                                  return null;
                                }),
                            const SizedBox(height: 30.0),
                            DefaultButton(
                              buttonWidget: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 1.7),
                              ),
                              function: () {
                                if (privateKey.currentState!.validate()) {
                                  cubit.getOrderRegistrationId(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    price: priceController.text,
                                  );
                                }
                              },
                              radius: 15,
                              backgroundColor: Colors.purple.shade300,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
