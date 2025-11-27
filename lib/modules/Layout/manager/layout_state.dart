sealed class LayoutState {}

class InitState extends LayoutState{}
class OnNavTapChanged extends LayoutState{}

class GetMoviesLoadingState extends LayoutState{}
class GetMoviesSuccessState extends LayoutState{}
class GetMoviesErrorState extends LayoutState{}
class GetSimilarLoading extends LayoutState{}


class OnCarouselChanged extends LayoutState{}
class OnMarkChange extends LayoutState{}
class GetSimilarSuccess extends LayoutState{}

class SearchMovie extends LayoutState{}



class GetMoviesGenresLoadingState extends LayoutState{}
class GetMoviesGenresSuccessState extends LayoutState{}
class GetMoviesGenresErrorState extends LayoutState{}

class GetMovieDetailsErrorState extends LayoutState{}
class GetMovieDetailsSuccessState extends LayoutState{}
class GetMovieDetailsLoadingState extends LayoutState{}

class GetFilteredMovies extends LayoutState{}
class OnTapBarChange extends LayoutState{}