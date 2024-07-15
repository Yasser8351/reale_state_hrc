import 'package:get/get.dart';
import 'package:real_estate/utilits/app_config.dart';

validationEnterYourPhone(String value) {
  if (value.isEmpty) {
    return AppConfig.enterYourPhone.tr;
    // EnterYourNots EnterYourPhone
  }
  // if (value.length != 7) return "ادخل رقم هاتف صحيح";

  return null;
}

// validationEnterYourNots(value) {
//   if (value == null || value!.isEmpty) {
//     return AppConfig.enterYourNots.tr;
//   }
//   return null;
// }

validationEnterYourTitle(value, String text) {
  if (value == null || value!.isEmpty) {
    return text;
  }
  return null;
}

// validationConfirmPassword(value, String password, String confirmPassword) {
//   if (value == null || value!.isEmpty) {
//     return AppConfig.enterYourConfirmPassword.tr;
//   } else if (password != confirmPassword) {
//     return AppConfig.passwordNotMatch.tr;
//   }
//   return null;
// }
