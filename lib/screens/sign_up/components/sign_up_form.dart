import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:vibra/components/custom_surfix_icon.dart';
import 'package:vibra/components/default_button.dart';
import 'package:vibra/components/form_error.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibra/screens/otp/otp_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}
  void reqPerm() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
      Permission.contacts
      //add more permission to request here.
    ].request();
  }

// mobile phone permissions
class _SignUpFormState extends State<SignUpForm> {
  initState() {
    reqPerm();
    var initState = super.initState();
  }


  final TextEditingController _phoneController = TextEditingController();
  final _names = TextEditingController();

  final _formKey = GlobalKey<FormState>();
 
  String? phoneNumber;
  String? names;
  // final String _countryCode = "+20";
  bool remember = false;
  final List<String?> errors = [];

// Start adding error on empty
  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

// end adding error on empty
// Start removing error on input
  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
// end removing error on input

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildPhoneNumberFormField(),
            SizedBox(height: getProportionateScreenHeight(40)),
            buildNameField(),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(40)),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  controller:
                  _phoneController;

                  print('${_phoneController.text}');

                  // if all are valid then go to success screen
                  Navigator.pushNamed(context, OtpScreen.routeName);
                
                }
              },
            ),
          ],
        ));
  }

// building Text field
  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }



TextFormField buildNameField() {
  return TextFormField(
    controller: _names,
    keyboardType: TextInputType.phone,
    onSaved: (newValue) => names = newValue,
    onChanged: (value) {
      if (value.isNotEmpty) {
        removeError(error: kPhoneNumberNullError);
      }
      return null;
    },
    validator: (value) {
      if (value!.isEmpty) {
        addError(error: kPhoneNumberNullError);
        return "";
      }
      return null;
    },
    // ignore: prefer_const_constructors
    decoration: InputDecoration(
      labelText: "Phone Number",
      hintText: "Enter your phone number",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
    ),
  );
}


}

