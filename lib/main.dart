import 'package:brainupp/views/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'const/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBEn0sau6MotH3LjwXg84V_8egM4pBdkCw",
      appId: "1:501345910354:android:c969c22a0c8f85f5b9298b",
      messagingSenderId: "501345910354",
      projectId: "brainup-b5499",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //change material app to get material app cause we using getx
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: whiteColor),
              backgroundColor: Colors.transparent),
          fontFamily: regular),
      //darkTheme: ThemeData.dark(),
      home: const Splash_screen(),
    );
  }
}
