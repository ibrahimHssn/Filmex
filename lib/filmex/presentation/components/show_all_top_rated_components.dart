import 'package:animate_do/animate_do.dart';
import 'package:filmex/core/network/api_constance.dart';
import 'package:filmex/core/utils/App_String.dart';
import 'package:filmex/core/utils/app_constance.dart';
import 'package:filmex/core/utils/enums.dart';
import 'package:filmex/filmex/presentation/contriller/filmex_Bloc/bloc.dart';
import 'package:filmex/filmex/presentation/contriller/filmex_Bloc/state.dart';
import 'package:filmex/filmex/presentation/screens/filmex_detail_screen.dart';
import 'package:filmex/filmex/presentation/screens/show_all_filmex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
int numberOfPages=1;
class ShowAllTopRatedComponents extends StatelessWidget {
  const ShowAllTopRatedComponents({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmexBloc, FilmexState>(
      builder: (context, state) {
        switch(state.topRatedState){

          case RequestState.loading:
            return const SizedBox(
              height: 400,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
            return ListView.separated(
              shrinkWrap: true,
              itemCount: state.topRatedFilmex.length + 1, // Add 1 for the "Load More" button
              itemBuilder: (context, index) {
                if (index == state.topRatedFilmex.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            numberOfPages++;
                            AppConstance().navigateTo(context, ShowAllFilmex(pageNumbering: numberOfPages, nameScreen: AppString.topRatedFilmex,));
                          },
                        ),
                        const Spacer(),
                        numberOfPages>1? IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            numberOfPages--;
                            AppConstance().navigateTo(context, ShowAllFilmex(pageNumbering: numberOfPages, nameScreen: AppString.topRatedFilmex,));                      },
                        ):const SizedBox.shrink(),
                      ],
                    ),
                  );
                } else {
                  final filmex = state.topRatedFilmex[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                    child: InkWell(
                      onTap: () => AppConstance().navigateTo(context,  FilmexDetailScreen(id: filmex.id), ),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[850],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 4),
                              child: Image(
                                height: MediaQuery.of(context).size.height / 5.2,
                                width: 130,
                                image: NetworkImage(
                                  ApiConstance.imageUrl_(filmex.backdropPath),
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, top: 25),
                                child: FadeInUp(
                                  from: 20,
                                  duration: const Duration(milliseconds: 500),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        filmex.title,
                                        style: GoogleFonts.poppins(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.2,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 2.0,
                                              horizontal: 8.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[800],
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            child: Text(
                                              filmex.releaseDate.split('-')[0],
                                              style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 16.0),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 20.0,
                                              ),
                                              const SizedBox(width: 4.0),
                                              Text(
                                                (filmex.voteAverage / 2).toStringAsFixed(1),
                                                style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 1.2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20.0),
                                      Text(
                                        filmex.overview,
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.2,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
              separatorBuilder: (context, index) => const SizedBox(height: 4),
            );
          case RequestState.error:
          return SizedBox(
            height: 400,
            child: Text(state.topRatedMessage,style: const TextStyle(color: Colors.red,fontSize:25,fontWeight: FontWeight.w600),),
          );
        }

      },
    );
  }
}
