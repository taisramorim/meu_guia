import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meu_guia/blocs/motel_bloc/motel_bloc.dart';
import 'package:meu_guia/repositories/motel_repository.dart';
import 'package:meu_guia/screens/motel_list_screen.dart';
import 'package:meu_guia/simple_bloc_observer.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final motelRepository = MotelRepository();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu guia',
      home: MultiProvider(
      providers: [
        Provider<MotelRepository>(create: (_) => motelRepository),
        BlocProvider<MotelBloc>(
          create: (_) => MotelBloc(motelRepository)..add(FetchMoteis()),
        ),
      ],
      child: MotelListScreen(),
    ),

    );
  }
}
