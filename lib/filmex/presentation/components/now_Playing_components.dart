import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:filmex/core/network/api_constance.dart';
import 'package:filmex/core/utils/app_constance.dart';
import 'package:filmex/core/utils/enums.dart';
import 'package:filmex/filmex/presentation/contriller/filmex_Bloc/bloc.dart';
import 'package:filmex/filmex/presentation/contriller/filmex_Bloc/state.dart';
import 'package:filmex/filmex/presentation/screens/filmex_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingComponents extends StatelessWidget {
  const NowPlayingComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmexBloc,FilmexState>(
      buildWhen:(previous, current) => previous.nowPlayingState!=current.nowPlayingState,
      builder: (context, state) {
        switch(state.nowPlayingState){
          case RequestState.loading:
            return const SizedBox(
              height: 400,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
           return FadeIn(
             duration: const Duration(milliseconds: 500),
             child: CarouselSlider(
               options: CarouselOptions(
                 height: 400.0,
                 viewportFraction: 1.0,
                 onPageChanged: (index, reason) {},
               ),
               items: state.nowPlayingFilmex.map(
                     (item) {
                   return GestureDetector(
                     key: const Key('openFilmexMinimalDetail'),
                     onTap: () {
                       AppConstance().navigateTo(context,  FilmexDetailScreen(id: item.id), );
                     },
                     child: Stack(
                       children: [
                         ShaderMask(
                           shaderCallback: (rect) {
                             return const LinearGradient(
                               begin: Alignment.topCenter,
                               end: Alignment.bottomCenter,
                               colors: [
                                 // fromLTRB
                                 Colors.transparent,
                                 Colors.white,
                                 Colors.white,
                                 Colors.transparent,
                               ],
                               stops: [0, 0.3, 0.5, 1],
                             ).createShader(
                               Rect.fromLTRB(0, 0, rect.width, rect.height),
                             );
                           },
                           blendMode: BlendMode.dstIn,
                           child: CachedNetworkImage(
                             height: 560.0,
                             imageUrl: ApiConstance.imageUrl_(item.backdropPath),
                             fit: BoxFit.cover,
                           ),
                         ),
                         Align(
                           alignment: Alignment.bottomCenter,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(bottom: 16.0),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     const Icon(
                                       Icons.circle,
                                       color: Colors.redAccent,
                                       size: 16.0,
                                     ),
                                     const SizedBox(width: 4.0),
                                     Text(
                                       'Now Playing'.toUpperCase(),
                                       style: const TextStyle(
                                         fontSize: 16.0,
                                         color: Colors.white,
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(bottom: 16.0),
                                 child: Text(
                                   item.title,
                                   textAlign: TextAlign.center,
                                   style: const TextStyle(
                                     fontSize: 24,
                                     color: Colors.white,

                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   );
                 },
               ).toList(),
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

