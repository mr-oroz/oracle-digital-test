import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oracle_digital/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:oracle_digital/presentation/bloc/news_bloc/news_bloc.dart';
import 'package:oracle_digital/presentation/bloc/person_bloc/person_bloc.dart';
import 'package:oracle_digital/presentation/firebase/firebase_service.dart';

MultiBlocProvider buildAppBlocProviders(BuildContext context, Widget child) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<PersonBloc>(
        create: (context) =>
            PersonBloc(store: RepositoryProvider.of<FirebaseService>(context)),
      ),
      BlocProvider<NewsBloc>(
        create: (context) =>
            NewsBloc(store: RepositoryProvider.of<FirebaseService>(context)),
      ),
      BlocProvider<AuthBloc>(
        create: (context) =>
            AuthBloc(auth: RepositoryProvider.of<FirebaseService>(context)),
      ),
    ],
    child: child,
  );
}
