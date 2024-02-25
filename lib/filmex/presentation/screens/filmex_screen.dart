import 'package:filmex/core/services/services_locator.dart';
import 'package:filmex/core/utils/App_String.dart';
import 'package:filmex/core/utils/app_constance.dart';
import 'package:filmex/filmex/presentation/components/now_Playing_components.dart';
import 'package:filmex/filmex/presentation/components/popular_components.dart';
import 'package:filmex/filmex/presentation/components/top_rated_components.dart';
import 'package:filmex/filmex/presentation/contriller/filmex_Bloc/bloc.dart';
import 'package:filmex/filmex/presentation/contriller/filmex_Bloc/event.dart';
import 'package:filmex/filmex/presentation/screens/show_all_filmex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FilmexScreen extends StatelessWidget {
  const FilmexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FilmexBloc>()..add(GetNowPlayingFilmexEvent())..add(const GetPopularFilmexEvent(pageNumbering: 1) )..add(const GetTopRatedFilmexEvent(pageNumbering: 1)),
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('filmexScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponents(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.popular,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: Colors.white,

                      ),
                    ),
                    InkWell(
                      onTap: () => AppConstance().navigateTo(context, ShowAllFilmex(pageNumbering: 1, nameScreen: AppString.popularFilmex)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(AppString.seeMore,style: TextStyle(
                              color: Colors.white,
                            )),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularComponents(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.topRated,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: Colors.white,

                      ),
                    ),
                    InkWell(
                      onTap: () => AppConstance().navigateTo(context, ShowAllFilmex(pageNumbering: 1, nameScreen: AppString.topRatedFilmex)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(AppString.seeMore,style: TextStyle(
                              color: Colors.white,

                            ),),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedComponents(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
