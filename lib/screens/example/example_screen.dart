import 'package:flutter_core/core/base/bottom_stateful_screen.dart';
import 'package:flutter_core/screens/example/views/example_lst_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';
import 'blocs/example_lst_view_bloc.dart';

class ExampleScreen extends StatefulWidget {
  @override
  _ExampleScreenState createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen>  {
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ExampleLstViewBloc>(),
      child: ExampleLstView(),
    );
  }
}
