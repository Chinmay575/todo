import 'package:todo/app/config/prefs.dart';

class Global {
  static late UserPrefences prefs;
  static Future init() async {
    prefs = await UserPrefences().init();
  }
}
