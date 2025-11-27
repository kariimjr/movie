import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:movie/modules/Layout/pages/home/widgets/movie_card.dart';

import '../../../../core/apis/models/movie_response.dart';
import '../../manager/layout_cubit.dart';
import '../../manager/layout_state.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Movies? movie;

  late LayoutCubit cubit;

  void initState() {
    super.initState();
    cubit = LayoutCubit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubit,
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(right: 16,left: 16,top: 24),
              child: SafeArea(
                child: Column(
                  spacing: 15,
                  children: [
                    SizedBox(
                      height:55 ,
                      width: double.infinity,
                      child: TextField(
                        style: TextStyle(fontSize: 18),
                        onTap: () {},
                        onChanged: (value) {
                          cubit.searchMovies(value);
                        },
                        decoration: InputDecoration(
                          hintText: "What are you thinking of?",
                          hintStyle: TextStyle(color: Colors.white70.withAlpha(90)),
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 10,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/search.svg",
                              fit: BoxFit.contain,
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                
                    Expanded(
                      child: state is SearchMovie
                          ? GridView.builder(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        physics: BouncingScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.7,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 12,
                                  ),
                              itemCount: cubit.searched.length,
                              itemBuilder: (context, index) {
                                final movie = cubit.searched[index];
                                return MovieCard(movie: movie);
                              },
                            )
                          :Lottie.asset("assets/json/popcorn.json"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
