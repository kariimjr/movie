import 'dart:ui';

class OnboardingData {
  String title;
  String description;
  String images;
  Color color;
  OnboardingData({
    required this.title,
    required this.description,
    required this.images,
    required this.color
  });

  static List<OnboardingData> onboardingData = [
    OnboardingData(
      title: 'Find Your Next\nFavorite Movie Here',
      description:
          'Get access to a huge library of movies\nto suit all tastes. You will surely like it.',
      images: 'assets/images/onboarding_image1.png',
      color: Color(0xff121312),
    ),
    OnboardingData(
      title: 'Discover Movies',
      description:
          'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
      images: 'assets/images/onboarding_image2.png',
      color: Color(0xff084250),
    ),
    OnboardingData(
      title: 'Explore All Genres',
      description:
          'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
      images: 'assets/images/onboarding_image3.png',
      color: Color(0xff85210E),
    ),
    OnboardingData(
      title: 'Create Watchlists',
      description:
          'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
      images: 'assets/images/onboarding_image4.png',
      color: Color(0xff4C2471),
    ),
    OnboardingData(
      title: 'Rate, Review, and Learn',
      description: 'Share your thoughts on the movies you\'ve watched. Dive deep into film details and help others discover great movies with your reviews.',
      images: 'assets/images/onboarding_image5.png',
      color: Color(0xff601321),
    ),
    OnboardingData(
      title: 'Start Watching Now',
      description: '',
      images: 'assets/images/onboarding_image6.png',
      color: Color(0xff2A2C30),
    ),
  ];
}
