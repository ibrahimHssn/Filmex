import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmex/core/network/api_constance.dart';
import 'package:filmex/core/utils/app_constance.dart';
import 'package:filmex/core/utils/enums.dart';
import 'package:filmex/filmex/presentation/contriller/filmex_Bloc/bloc.dart';
import 'package:filmex/filmex/presentation/contriller/filmex_Bloc/state.dart';
import 'package:filmex/filmex/presentation/screens/filmex_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class PopularComponents extends StatelessWidget {
  const PopularComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmexBloc,FilmexState>(
      buildWhen:(previous, current) => previous.popularState!=current.popularState,

      builder: (context, state) {

        switch(state.popularState){
          case RequestState.loading:
            return const SizedBox(
              height: 400,
              child: Center(child: CircularProgressIndicator()),
            );
            case RequestState.loaded:
            return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: 170.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: state.popularFilmex.length,
                    itemBuilder: (context, index) {
                      final filmex = state.popularFilmex[index];
                      return Container(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () {
                            AppConstance().navigateTo(context,  FilmexDetailScreen(id: filmex.id), );
                          },
                          child: ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                            child: CachedNetworkImage(
                              width: 120.0,
                              fit: BoxFit.cover,
                              imageUrl: ApiConstance.imageUrl_(filmex.backdropPath),
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Container(
                                  height: 170.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error,color: Colors.white,),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            case RequestState.error:
              return SizedBox(
                height: 400,
                child: Text(state.nowPlayingMessage,style: const TextStyle(color: Colors.red,fontSize:25,fontWeight: FontWeight.w600),),
              );
        }
      },
    );

  }
}
