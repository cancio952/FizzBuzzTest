import 'package:FizzBuzzTest/di/inyector.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class StateWithBloC<W extends StatefulWidget, B extends Bloc>
    extends State<W> {
  B bloc;

  @override
  void initState() {
    bloc = di.instance<B>();

    print('initState $this');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: buildWidget(context),
    );
  }

  @override
  void dispose() {
    print('dispose $this');

    super.dispose();
  }

  ///Use this one instead of [build]
  Widget buildWidget(BuildContext context);
}
