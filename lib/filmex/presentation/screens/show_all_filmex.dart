
import 'package:filmex/core/services/services_locator.dart';
import 'package:filmex/core/utils/App_String.dart';
import 'package:filmex/filmex/presentation/components/show_all_popular_components.dart';
import 'package:filmex/filmex/presentation/components/show_all_top_rated_components.dart';
import 'package:filmex/filmex/presentation/contriller/filmex_Bloc/bloc.dart';
import 'package:filmex/filmex/presentation/contriller/filmex_Bloc/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowAllFilmex extends StatelessWidget {
  int pageNumbering;
  String nameScreen;
   ShowAllFilmex({super.key,required this.pageNumbering,required this.nameScreen});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final event = nameScreen == AppString.popularFilmex
            ? GetPopularFilmexEvent(pageNumbering: pageNumbering)
            : GetTopRatedFilmexEvent(pageNumbering: pageNumbering);
            return sl<FilmexBloc>()..add(event);

            },

      child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(nameScreen),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

      ),
      body:  Container(
        color:const Color(0x252A2B7C),
        child: _getInitialWidget(nameScreen: nameScreen),
      ),
    ),
);
  }
}

Widget _getInitialWidget({required  String nameScreen}) {

  if (AppString.popularFilmex==nameScreen) {
    return const ShowAllPopularComponents();
  } else {
    return const ShowAllTopRatedComponents();
  }
}