import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oracle_digital/presentation/firebase/firebase_service.dart';

MultiRepositoryProvider buildAppProviders(Widget child) {
  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => FirebaseService(),
      ),
    ],
    child: child,
  );
}
