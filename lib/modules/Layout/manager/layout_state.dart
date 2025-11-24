sealed class LayoutState {}

class InitState extends LayoutState{}
class OnNavTapChanged extends LayoutState{}

class GetMoviesLoadingState extends LayoutState{}
class GetMoviesSuccessState extends LayoutState{}
class GetMoviesErrorState extends LayoutState{}


class OnCarouselChanged extends LayoutState{}

class GetMoviesGenresLoadingState extends LayoutState{}
class GetMoviesGenresSuccessState extends LayoutState{}
class GetMoviesGenresErrorState extends LayoutState{}