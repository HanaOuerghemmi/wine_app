import 'package:flutter/material.dart';
import 'package:wine_app/bloc/wine_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wine_app/pages/widgets/build_card.dart';
import 'package:wine_app/pages/widgets/build_loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WineBloc _newsBloc = WineBloc();

  @override
  void initState() {
    _newsBloc.add(GetWineList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('wine'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(8.0),
          child: BlocProvider(
            create: (_) => _newsBloc,
            child: BlocListener<WineBloc, WineState>(
              listener: (context, state) {
                if (state is WineError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message!),
                    ),
                  );
                }
              },
              child:
                  BlocBuilder<WineBloc, WineState>(builder: (context, state) {
                print('++++++++++++' + state.toString());

                switch (state.runtimeType) {
                  case WineInitial:
                    return buildLoading();
                  case WineLoading:
                    return buildLoading();
                  case WineLoaded:
                    return buildCard(context, (state as WineLoaded).wineModel);
                  case WineError:
                    return Container();
                  default:
                    return Container();
                }
              }),
            ),
          ),
        ));
  }
}
