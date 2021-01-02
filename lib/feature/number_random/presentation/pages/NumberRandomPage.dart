import 'package:FizzBuzzTest/core/base/widget_base_state.dart';
import 'package:FizzBuzzTest/feature/number_random/presentation/bloc/number_random_bo_c_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberRandomPage extends StatefulWidget {
  @override
  _NumberRandomPageState createState() => _NumberRandomPageState();
}

class _NumberRandomPageState
    extends StateWithBloC<NumberRandomPage, NumberRandomBoCBloc> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FizzBuzz"),
      ),
      body: Container(
        child: Center(
          child: Column(
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocConsumer<NumberRandomBoCBloc, NumberRandomBoCState>(
                  builder: (c, s) {
                if (s is NumberRandomBoCLoading) {
                  return Text(
                    "Loading ...",
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (s is NumberRandomBoCLoaded) {
                  return Text(
                    s.numberRandom.getFizzBuzz(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (s is NumberRandomBoCError) {
                  return Text(
                    s.message,
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    "push the button to get a FizzBuzz",
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              }, listener: (c, s) {
                return Container();
              })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.add(GetNumberRandomBoCEvent());
        },
        tooltip: 'Increment',
        child: Icon(Icons.text_rotation_angledown),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
