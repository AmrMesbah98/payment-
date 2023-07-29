import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/presentation_screen/screens/ref_code_screen.dart';
import 'package:payment/presentation_screen/screens/visaScreen.dart';

import '../../Buissness_login_Screen/Cubit/bloc.dart';
import '../../Buissness_login_Screen/Cubit/state.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => paymentcubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Toogle Screen '),
          centerTitle: true,
        ),
        body: BlocConsumer<paymentcubit, paymentState>(
          listener: (context, state) {
            if (state is paymentRefCodeSucessState) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ReferenceScreen()));
            }
          },
          builder: (context, state) {
            var cubit = paymentcubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      cubit.getRefCode();
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 2.0)),
                      child: Image(
                        image: AssetImage('assets/images/refcode.png'),
                      ),
                    ),
                  )),
                  const SizedBox(height: 20),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> VisaScreen() ));
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 2.0)),
                      child: Image(
                        image: AssetImage('assets/images/visa.jpg'),
                      ),
                    ),
                  )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
