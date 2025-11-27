import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/extensions/extension.dart';
import 'package:movie/modules/layout/manager/layout_cubit.dart';
import 'package:movie/modules/layout/manager/layout_state.dart';

import 'home/widgets/movie_card.dart';

class Browse extends StatefulWidget {
  const Browse({super.key});

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  late LayoutCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<LayoutCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await cubit.getMoviesGenres();
      cubit.selectedGenre = cubit.genres.elementAt(0);
      cubit.getFilteredMovies();
      if (cubit.movies.isEmpty) {
        await cubit.getMovies();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    cubit = context.watch<LayoutCubit>();

    return SafeArea(
      child: SingleChildScrollView(
        child: BlocBuilder<LayoutCubit, LayoutState>(
          builder: (BuildContext context, LayoutState state) {
            if(state is GetMoviesGenresLoadingState){
              return Center(child: CircularProgressIndicator(color: context.appColorTheme.primary,));
            }else if(state is GetMoviesGenresErrorState){
              return Icon(Icons.error, color: context.appColorTheme.primary,);
            }else{
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    DefaultTabController(
                      length: cubit.genres.length,
                      child: TabBar(
                        onTap: cubit.onTapBar,
                        isScrollable: true,
                        dividerColor: Colors.transparent,
                        unselectedLabelColor: context.appColorTheme.primary,
                        indicatorColor: Colors.transparent,
                        tabAlignment: TabAlignment.start,
                        labelColor: context.appColorTheme.surface,
                        labelPadding: EdgeInsets.all(8),
                        tabs: cubit.genres.map((e) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: context.appColorTheme.primary),
                              borderRadius: BorderRadius.circular(16),
                              color: cubit.selectedGenre == e
                                  ? context.appColorTheme.primary
                                  : context.appColorTheme.surface,
                            ),
                            child: Text(
                              e,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    GridView.builder(
                      clipBehavior: Clip.antiAlias,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cubit.filteredMovies.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.62,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                      ),
                      itemBuilder: (context, index) {
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(16),

                            child: MovieCard(movie: cubit.filteredMovies[index])
                        );
                      },
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
