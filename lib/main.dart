import 'package:app_liffe_task_flutter/app.dart';
import 'package:app_liffe_task_flutter/common/cubit/dark_mode_cubit.dart';
import 'package:app_liffe_task_flutter/common/cubit/navigator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  // AppDependencyInjection().setup();
  WidgetsFlutterBinding.ensureInitialized();
  // AppThemeConfig.colorThemeEnum = ColorThemeEnum.tecnologico;
  runApp(const Main());
}

final GetIt getItApp = GetIt.instance;

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DarkModeCubit()),
        BlocProvider(create: (context) => NavigationCubit()),
      ],
      child: const SafeArea(
        child: MyApp(),
      ),
    );
  }
}
