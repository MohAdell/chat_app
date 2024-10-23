import 'package:chat/register/logic/register_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Contacts/logic/rooms_cubit.dart';
import 'Sign In/logic/login_cubit.dart';
import 'Profile/logic/users_cubit.dart';
import 'core/firebase/firebase_data.dart';
import 'core/firebase/firebase_options.dart';
import 'core/firebase/firebase_sevice.dart';
import 'core/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsersCubit>(
            create: (context) => UsersCubit(FireBaseDataAll())),
        BlocProvider<RoomsCubit>(
            create: (context) => RoomsCubit(FireBaseDataAll())),
        BlocProvider<RegisterCubit>(
            create: (context) => RegisterCubit(FirebaseService())),
        BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(FirebaseService())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: Routes.splashScreen,
        // home: SplashScreen(),
      ),
    );
  }
}
