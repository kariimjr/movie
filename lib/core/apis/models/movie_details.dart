/// status : "ok"
/// status_message : "Query was successful"
/// data : {"movie":{"id":15,"url":"https://yts.lt/movies/16-blocks-2006","imdb_code":"tt0450232","title":"16 Blocks","title_english":"16 Blocks","title_long":"16 Blocks (2006)","slug":"16-blocks-2006","year":2006,"rating":6.6,"runtime":102,"genres":["Action","Crime","Drama","Thriller"],"like_count":54,"description_intro":"\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294","description_full":"\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294","yt_trailer_code":"55nKvGV0APA","language":"en","mpa_rating":"","background_image":"https://yts.lt/assets/images/movies/16_Blocks_2006/background.jpg","background_image_original":"https://yts.lt/assets/images/movies/16_Blocks_2006/background.jpg","small_cover_image":"https://yts.lt/assets/images/movies/16_Blocks_2006/small-cover.jpg","medium_cover_image":"https://yts.lt/assets/images/movies/16_Blocks_2006/medium-cover.jpg","large_cover_image":"https://yts.lt/assets/images/movies/16_Blocks_2006/large-cover.jpg","medium_screenshot_image1":"https://yts.lt/assets/images/movies/16_Blocks_2006/medium-screenshot1.jpg","medium_screenshot_image2":"https://yts.lt/assets/images/movies/16_Blocks_2006/medium-screenshot2.jpg","medium_screenshot_image3":"https://yts.lt/assets/images/movies/16_Blocks_2006/medium-screenshot3.jpg","large_screenshot_image1":"https://yts.lt/assets/images/movies/16_Blocks_2006/large-screenshot1.jpg","large_screenshot_image2":"https://yts.lt/assets/images/movies/16_Blocks_2006/large-screenshot2.jpg","large_screenshot_image3":"https://yts.lt/assets/images/movies/16_Blocks_2006/large-screenshot3.jpg","cast":[{"name":"Tom Wlaschiha","character_name":"Bus Passenger","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0937239.jpg","imdb_code":"0937239"},{"name":"Bruce Willis","character_name":"Det. Jack Mosley","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0000246.jpg","imdb_code":"0000246"},{"name":"Peter McRobbie","character_name":"Mike Sheehan","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0574513.jpg","imdb_code":"0574513"},{"name":"Tig Fong","character_name":"Briggs","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0284609.jpg","imdb_code":"0284609"}],"torrents":[{"url":"https://yts.lt/torrent/download/8619B57A3F39F1B49A1A698EA5400A883928C0A2","hash":"8619B57A3F39F1B49A1A698EA5400A883928C0A2","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":2,"peers":1,"size":"702.04 MB","size_bytes":736142295,"date_uploaded":"2015-10-31 20:47:35","date_uploaded_unix":1446320855},{"url":"https://yts.lt/torrent/download/2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","hash":"2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":24,"peers":1,"size":"1.40 GB","size_bytes":1503238554,"date_uploaded":"2015-10-31 20:47:38","date_uploaded_unix":1446320858}],"date_uploaded":"2015-10-31 20:47:35","date_uploaded_unix":1446320855}}
/// @meta : {"server_time":1764191108,"server_timezone":"CET","api_version":2,"execution_time":"0 ms"}

class MovieDetails {
  MovieDetails({
    String? status,
    String? statusMessage,
    Data? data,
    Meta? meta,}){
    _status = status;
    _statusMessage = statusMessage;
    _data = data;
    _meta = meta;
  }

  MovieDetails.fromJson(dynamic json) {
    _status = json['status'];
    _statusMessage = json['status_message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _meta = json['@meta'] != null ? Meta.fromJson(json['@meta']) : null;
  }
  String? _status;
  String? _statusMessage;
  Data? _data;
  Meta? _meta;

  MovieDetails copyWith({  String? status,
    String? statusMessage,
    Data? data,
    Meta? meta,
  }) => MovieDetails(  status: status ?? _status,
    statusMessage: statusMessage ?? _statusMessage,
    data: data ?? _data,
    meta: meta ?? _meta,
  );
  String? get status => _status;
  String? get statusMessage => _statusMessage;
  Data? get data => _data;
  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['status_message'] = _statusMessage;
    if (_data != null) {
      map['data'] = _data!.toJson();
    }
    if (_meta != null) {
      map['@meta'] = _meta!.toJson();
    }
    return map;
  }
}

/// server_time : 1764191108
/// server_timezone : "CET"
/// api_version : 2
/// execution_time : "0 ms"

class Meta {
  Meta({
    num? serverTime,
    String? serverTimezone,
    num? apiVersion,
    String? executionTime,}){
    _serverTime = serverTime;
    _serverTimezone = serverTimezone;
    _apiVersion = apiVersion;
    _executionTime = executionTime;
  }

  Meta.fromJson(dynamic json) {
    _serverTime = json['server_time'];
    _serverTimezone = json['server_timezone'];
    _apiVersion = json['api_version'];
    _executionTime = json['execution_time'];
  }
  num? _serverTime;
  String? _serverTimezone;
  num? _apiVersion;
  String? _executionTime;

  Meta copyWith({  num? serverTime,
    String? serverTimezone,
    num? apiVersion,
    String? executionTime,
  }) => Meta(  serverTime: serverTime ?? _serverTime,
    serverTimezone: serverTimezone ?? _serverTimezone,
    apiVersion: apiVersion ?? _apiVersion,
    executionTime: executionTime ?? _executionTime,
  );
  num? get serverTime => _serverTime;
  String? get serverTimezone => _serverTimezone;
  num? get apiVersion => _apiVersion;
  String? get executionTime => _executionTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['server_time'] = _serverTime;
    map['server_timezone'] = _serverTimezone;
    map['api_version'] = _apiVersion;
    map['execution_time'] = _executionTime;
    return map;
  }
}

/// movie : {"id":15,"url":"https://yts.lt/movies/16-blocks-2006","imdb_code":"tt0450232","title":"16 Blocks","title_english":"16 Blocks","title_long":"16 Blocks (2006)","slug":"16-blocks-2006","year":2006,"rating":6.6,"runtime":102,"genres":["Action","Crime","Drama","Thriller"],"like_count":54,"description_intro":"\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294","description_full":"\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294","yt_trailer_code":"55nKvGV0APA","language":"en","mpa_rating":"","background_image":"https://yts.lt/assets/images/movies/16_Blocks_2006/background.jpg","background_image_original":"https://yts.lt/assets/images/movies/16_Blocks_2006/background.jpg","small_cover_image":"https://yts.lt/assets/images/movies/16_Blocks_2006/small-cover.jpg","medium_cover_image":"https://yts.lt/assets/images/movies/16_Blocks_2006/medium-cover.jpg","large_cover_image":"https://yts.lt/assets/images/movies/16_Blocks_2006/large-cover.jpg","medium_screenshot_image1":"https://yts.lt/assets/images/movies/16_Blocks_2006/medium-screenshot1.jpg","medium_screenshot_image2":"https://yts.lt/assets/images/movies/16_Blocks_2006/medium-screenshot2.jpg","medium_screenshot_image3":"https://yts.lt/assets/images/movies/16_Blocks_2006/medium-screenshot3.jpg","large_screenshot_image1":"https://yts.lt/assets/images/movies/16_Blocks_2006/large-screenshot1.jpg","large_screenshot_image2":"https://yts.lt/assets/images/movies/16_Blocks_2006/large-screenshot2.jpg","large_screenshot_image3":"https://yts.lt/assets/images/movies/16_Blocks_2006/large-screenshot3.jpg","cast":[{"name":"Tom Wlaschiha","character_name":"Bus Passenger","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0937239.jpg","imdb_code":"0937239"},{"name":"Bruce Willis","character_name":"Det. Jack Mosley","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0000246.jpg","imdb_code":"0000246"},{"name":"Peter McRobbie","character_name":"Mike Sheehan","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0574513.jpg","imdb_code":"0574513"},{"name":"Tig Fong","character_name":"Briggs","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0284609.jpg","imdb_code":"0284609"}],"torrents":[{"url":"https://yts.lt/torrent/download/8619B57A3F39F1B49A1A698EA5400A883928C0A2","hash":"8619B57A3F39F1B49A1A698EA5400A883928C0A2","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":2,"peers":1,"size":"702.04 MB","size_bytes":736142295,"date_uploaded":"2015-10-31 20:47:35","date_uploaded_unix":1446320855},{"url":"https://yts.lt/torrent/download/2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","hash":"2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":24,"peers":1,"size":"1.40 GB","size_bytes":1503238554,"date_uploaded":"2015-10-31 20:47:38","date_uploaded_unix":1446320858}],"date_uploaded":"2015-10-31 20:47:35","date_uploaded_unix":1446320855}

class Data {
  Data({
    Movie? movie,}){
    _movie = movie;
  }

  Data.fromJson(dynamic json) {
    _movie = json['movie'] != null ? Movie.fromJson(json['movie']) : null;
  }
  Movie? _movie;

  Data copyWith({  Movie? movie,
  }) => Data(  movie: movie ?? _movie,
  );
  Movie? get movie => _movie;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_movie != null) {
      map['movie'] = _movie!.toJson();
    }
    return map;
  }
}

/// id : 15
/// url : "https://yts.lt/movies/16-blocks-2006"
/// imdb_code : "tt0450232"
/// title : "16 Blocks"
/// title_english : "16 Blocks"
/// title_long : "16 Blocks (2006)"
/// slug : "16-blocks-2006"
/// year : 2006
/// rating : 6.6
/// runtime : 102
/// genres : ["Action","Crime","Drama","Thriller"]
/// like_count : 54
/// description_intro : "\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294"
/// description_full : "\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294"
/// yt_trailer_code : "55nKvGV0APA"
/// language : "en"
/// mpa_rating : ""
/// background_image : "https://yts.lt/assets/images/movies/16_Blocks_2006/background.jpg"
/// background_image_original : "https://yts.lt/assets/images/movies/16_Blocks_2006/background.jpg"
/// small_cover_image : "https://yts.lt/assets/images/movies/16_Blocks_2006/small-cover.jpg"
/// medium_cover_image : "https://yts.lt/assets/images/movies/16_Blocks_2006/medium-cover.jpg"
/// large_cover_image : "https://yts.lt/assets/images/movies/16_Blocks_2006/large-cover.jpg"
/// medium_screenshot_image1 : "https://yts.lt/assets/images/movies/16_Blocks_2006/medium-screenshot1.jpg"
/// medium_screenshot_image2 : "https://yts.lt/assets/images/movies/16_Blocks_2006/medium-screenshot2.jpg"
/// medium_screenshot_image3 : "https://yts.lt/assets/images/movies/16_Blocks_2006/medium-screenshot3.jpg"
/// large_screenshot_image1 : "https://yts.lt/assets/images/movies/16_Blocks_2006/large-screenshot1.jpg"
/// large_screenshot_image2 : "https://yts.lt/assets/images/movies/16_Blocks_2006/large-screenshot2.jpg"
/// large_screenshot_image3 : "https://yts.lt/assets/images/movies/16_Blocks_2006/large-screenshot3.jpg"
/// cast : [{"name":"Tom Wlaschiha","character_name":"Bus Passenger","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0937239.jpg","imdb_code":"0937239"},{"name":"Bruce Willis","character_name":"Det. Jack Mosley","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0000246.jpg","imdb_code":"0000246"},{"name":"Peter McRobbie","character_name":"Mike Sheehan","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0574513.jpg","imdb_code":"0574513"},{"name":"Tig Fong","character_name":"Briggs","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0284609.jpg","imdb_code":"0284609"}]
/// torrents : [{"url":"https://yts.lt/torrent/download/8619B57A3F39F1B49A1A698EA5400A883928C0A2","hash":"8619B57A3F39F1B49A1A698EA5400A883928C0A2","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":2,"peers":1,"size":"702.04 MB","size_bytes":736142295,"date_uploaded":"2015-10-31 20:47:35","date_uploaded_unix":1446320855},{"url":"https://yts.lt/torrent/download/2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","hash":"2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":24,"peers":1,"size":"1.40 GB","size_bytes":1503238554,"date_uploaded":"2015-10-31 20:47:38","date_uploaded_unix":1446320858}]
/// date_uploaded : "2015-10-31 20:47:35"
/// date_uploaded_unix : 1446320855

class Movie {
  Movie({
    num? id,
    String? url,
    String? imdbCode,
    String? title,
    String? titleEnglish,
    String? titleLong,
    String? slug,
    num? year,
    num? rating,
    num? runtime,
    List<String>? genres,
    num? likeCount,
    String? descriptionIntro,
    String? descriptionFull,
    String? ytTrailerCode,
    String? language,
    String? mpaRating,
    String? backgroundImage,
    String? backgroundImageOriginal,
    String? smallCoverImage,
    String? mediumCoverImage,
    String? largeCoverImage,
    String? mediumScreenshotImage1,
    String? mediumScreenshotImage2,
    String? mediumScreenshotImage3,
    String? largeScreenshotImage1,
    String? largeScreenshotImage2,
    String? largeScreenshotImage3,
    List<Cast>? cast,
    List<Torrents>? torrents,
    String? dateUploaded,
    num? dateUploadedUnix,}){
    _id = id;
    _url = url;
    _imdbCode = imdbCode;
    _title = title;
    _titleEnglish = titleEnglish;
    _titleLong = titleLong;
    _slug = slug;
    _year = year;
    _rating = rating;
    _runtime = runtime;
    _genres = genres;
    _likeCount = likeCount;
    _descriptionIntro = descriptionIntro;
    _descriptionFull = descriptionFull;
    _ytTrailerCode = ytTrailerCode;
    _language = language;
    _mpaRating = mpaRating;
    _backgroundImage = backgroundImage;
    _backgroundImageOriginal = backgroundImageOriginal;
    _smallCoverImage = smallCoverImage;
    _mediumCoverImage = mediumCoverImage;
    _largeCoverImage = largeCoverImage;
    _mediumScreenshotImage1 = mediumScreenshotImage1;
    _mediumScreenshotImage2 = mediumScreenshotImage2;
    _mediumScreenshotImage3 = mediumScreenshotImage3;
    _largeScreenshotImage1 = largeScreenshotImage1;
    _largeScreenshotImage2 = largeScreenshotImage2;
    _largeScreenshotImage3 = largeScreenshotImage3;
    _cast = cast;
    _torrents = torrents;
    _dateUploaded = dateUploaded;
    _dateUploadedUnix = dateUploadedUnix;
  }

  Movie.fromJson(dynamic json) {
    _id = json['id'];
    _url = json['url'];
    _imdbCode = json['imdb_code'];
    _title = json['title'];
    _titleEnglish = json['title_english'];
    _titleLong = json['title_long'];
    _slug = json['slug'];
    _year = json['year'];
    _rating = json['rating'];
    _runtime = json['runtime'];
    _genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    _likeCount = json['like_count'];
    _descriptionIntro = json['description_intro'];
    _descriptionFull = json['description_full'];
    _ytTrailerCode = json['yt_trailer_code'];
    _language = json['language'];
    _mpaRating = json['mpa_rating'];
    _backgroundImage = json['background_image'];
    _backgroundImageOriginal = json['background_image_original'];
    _smallCoverImage = json['small_cover_image'];
    _mediumCoverImage = json['medium_cover_image'];
    _largeCoverImage = json['large_cover_image'];
    _mediumScreenshotImage1 = json['medium_screenshot_image1'];
    _mediumScreenshotImage2 = json['medium_screenshot_image2'];
    _mediumScreenshotImage3 = json['medium_screenshot_image3'];
    _largeScreenshotImage1 = json['large_screenshot_image1'];
    _largeScreenshotImage2 = json['large_screenshot_image2'];
    _largeScreenshotImage3 = json['large_screenshot_image3'];
    if (json['cast'] != null) {
      _cast = [];
      json['cast'].forEach((v) {
        _cast!.add(Cast.fromJson(v));
      });
    }
    if (json['torrents'] != null) {
      _torrents = [];
      json['torrents'].forEach((v) {
        _torrents!.add(Torrents.fromJson(v));
      });
    }
    _dateUploaded = json['date_uploaded'];
    _dateUploadedUnix = json['date_uploaded_unix'];
  }
  num? _id;
  String? _url;
  String? _imdbCode;
  String? _title;
  String? _titleEnglish;
  String? _titleLong;
  String? _slug;
  num? _year;
  num? _rating;
  num? _runtime;
  List<String>? _genres;
  num? _likeCount;
  String? _descriptionIntro;
  String? _descriptionFull;
  String? _ytTrailerCode;
  String? _language;
  String? _mpaRating;
  String? _backgroundImage;
  String? _backgroundImageOriginal;
  String? _smallCoverImage;
  String? _mediumCoverImage;
  String? _largeCoverImage;
  String? _mediumScreenshotImage1;
  String? _mediumScreenshotImage2;
  String? _mediumScreenshotImage3;
  String? _largeScreenshotImage1;
  String? _largeScreenshotImage2;
  String? _largeScreenshotImage3;
  List<Cast>? _cast;
  List<Torrents>? _torrents;
  String? _dateUploaded;
  num? _dateUploadedUnix;

  Movie copyWith({  num? id,
    String? url,
    String? imdbCode,
    String? title,
    String? titleEnglish,
    String? titleLong,
    String? slug,
    num? year,
    num? rating,
    num? runtime,
    List<String>? genres,
    num? likeCount,
    String? descriptionIntro,
    String? descriptionFull,
    String? ytTrailerCode,
    String? language,
    String? mpaRating,
    String? backgroundImage,
    String? backgroundImageOriginal,
    String? smallCoverImage,
    String? mediumCoverImage,
    String? largeCoverImage,
    String? mediumScreenshotImage1,
    String? mediumScreenshotImage2,
    String? mediumScreenshotImage3,
    String? largeScreenshotImage1,
    String? largeScreenshotImage2,
    String? largeScreenshotImage3,
    List<Cast>? cast,
    List<Torrents>? torrents,
    String? dateUploaded,
    num? dateUploadedUnix,
  }) => Movie(  id: id ?? _id,
    url: url ?? _url,
    imdbCode: imdbCode ?? _imdbCode,
    title: title ?? _title,
    titleEnglish: titleEnglish ?? _titleEnglish,
    titleLong: titleLong ?? _titleLong,
    slug: slug ?? _slug,
    year: year ?? _year,
    rating: rating ?? _rating,
    runtime: runtime ?? _runtime,
    genres: genres ?? _genres,
    likeCount: likeCount ?? _likeCount,
    descriptionIntro: descriptionIntro ?? _descriptionIntro,
    descriptionFull: descriptionFull ?? _descriptionFull,
    ytTrailerCode: ytTrailerCode ?? _ytTrailerCode,
    language: language ?? _language,
    mpaRating: mpaRating ?? _mpaRating,
    backgroundImage: backgroundImage ?? _backgroundImage,
    backgroundImageOriginal: backgroundImageOriginal ?? _backgroundImageOriginal,
    smallCoverImage: smallCoverImage ?? _smallCoverImage,
    mediumCoverImage: mediumCoverImage ?? _mediumCoverImage,
    largeCoverImage: largeCoverImage ?? _largeCoverImage,
    mediumScreenshotImage1: mediumScreenshotImage1 ?? _mediumScreenshotImage1,
    mediumScreenshotImage2: mediumScreenshotImage2 ?? _mediumScreenshotImage2,
    mediumScreenshotImage3: mediumScreenshotImage3 ?? _mediumScreenshotImage3,
    largeScreenshotImage1: largeScreenshotImage1 ?? _largeScreenshotImage1,
    largeScreenshotImage2: largeScreenshotImage2 ?? _largeScreenshotImage2,
    largeScreenshotImage3: largeScreenshotImage3 ?? _largeScreenshotImage3,
    cast: cast ?? _cast,
    torrents: torrents ?? _torrents,
    dateUploaded: dateUploaded ?? _dateUploaded,
    dateUploadedUnix: dateUploadedUnix ?? _dateUploadedUnix,
  );
  num? get id => _id;
  String? get url => _url;
  String? get imdbCode => _imdbCode;
  String? get title => _title;
  String? get titleEnglish => _titleEnglish;
  String? get titleLong => _titleLong;
  String? get slug => _slug;
  num? get year => _year;
  num? get rating => _rating;
  num? get runtime => _runtime;
  List<String>? get genres => _genres;
  num? get likeCount => _likeCount;
  String? get descriptionIntro => _descriptionIntro;
  String? get descriptionFull => _descriptionFull;
  String? get ytTrailerCode => _ytTrailerCode;
  String? get language => _language;
  String? get mpaRating => _mpaRating;
  String? get backgroundImage => _backgroundImage;
  String? get backgroundImageOriginal => _backgroundImageOriginal;
  String? get smallCoverImage => _smallCoverImage;
  String? get mediumCoverImage => _mediumCoverImage;
  String? get largeCoverImage => _largeCoverImage;
  String? get mediumScreenshotImage1 => _mediumScreenshotImage1;
  String? get mediumScreenshotImage2 => _mediumScreenshotImage2;
  String? get mediumScreenshotImage3 => _mediumScreenshotImage3;
  String? get largeScreenshotImage1 => _largeScreenshotImage1;
  String? get largeScreenshotImage2 => _largeScreenshotImage2;
  String? get largeScreenshotImage3 => _largeScreenshotImage3;
  List<Cast>? get cast => _cast;
  List<Torrents>? get torrents => _torrents;
  String? get dateUploaded => _dateUploaded;
  num? get dateUploadedUnix => _dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['url'] = _url;
    map['imdb_code'] = _imdbCode;
    map['title'] = _title;
    map['title_english'] = _titleEnglish;
    map['title_long'] = _titleLong;
    map['slug'] = _slug;
    map['year'] = _year;
    map['rating'] = _rating;
    map['runtime'] = _runtime;
    map['genres'] = _genres;
    map['like_count'] = _likeCount;
    map['description_intro'] = _descriptionIntro;
    map['description_full'] = _descriptionFull;
    map['yt_trailer_code'] = _ytTrailerCode;
    map['language'] = _language;
    map['mpa_rating'] = _mpaRating;
    map['background_image'] = _backgroundImage;
    map['background_image_original'] = _backgroundImageOriginal;
    map['small_cover_image'] = _smallCoverImage;
    map['medium_cover_image'] = _mediumCoverImage;
    map['large_cover_image'] = _largeCoverImage;
    map['medium_screenshot_image1'] = _mediumScreenshotImage1;
    map['medium_screenshot_image2'] = _mediumScreenshotImage2;
    map['medium_screenshot_image3'] = _mediumScreenshotImage3;
    map['large_screenshot_image1'] = _largeScreenshotImage1;
    map['large_screenshot_image2'] = _largeScreenshotImage2;
    map['large_screenshot_image3'] = _largeScreenshotImage3;
    if (_cast != null) {
      map['cast'] = _cast!.map((v) => v.toJson()).toList();
    }
    if (_torrents != null) {
      map['torrents'] = _torrents!.map((v) => v.toJson()).toList();
    }
    map['date_uploaded'] = _dateUploaded;
    map['date_uploaded_unix'] = _dateUploadedUnix;
    return map;
  }
}

/// url : "https://yts.lt/torrent/download/8619B57A3F39F1B49A1A698EA5400A883928C0A2"
/// hash : "8619B57A3F39F1B49A1A698EA5400A883928C0A2"
/// quality : "720p"
/// type : "bluray"
/// is_repack : "0"
/// video_codec : "x264"
/// bit_depth : "8"
/// audio_channels : "2.0"
/// seeds : 2
/// peers : 1
/// size : "702.04 MB"
/// size_bytes : 736142295
/// date_uploaded : "2015-10-31 20:47:35"
/// date_uploaded_unix : 1446320855

class Torrents {
  Torrents({
    String? url,
    String? hash,
    String? quality,
    String? type,
    String? isRepack,
    String? videoCodec,
    String? bitDepth,
    String? audioChannels,
    num? seeds,
    num? peers,
    String? size,
    num? sizeBytes,
    String? dateUploaded,
    num? dateUploadedUnix,}){
    _url = url;
    _hash = hash;
    _quality = quality;
    _type = type;
    _isRepack = isRepack;
    _videoCodec = videoCodec;
    _bitDepth = bitDepth;
    _audioChannels = audioChannels;
    _seeds = seeds;
    _peers = peers;
    _size = size;
    _sizeBytes = sizeBytes;
    _dateUploaded = dateUploaded;
    _dateUploadedUnix = dateUploadedUnix;
  }

  Torrents.fromJson(dynamic json) {
    _url = json['url'];
    _hash = json['hash'];
    _quality = json['quality'];
    _type = json['type'];
    _isRepack = json['is_repack'];
    _videoCodec = json['video_codec'];
    _bitDepth = json['bit_depth'];
    _audioChannels = json['audio_channels'];
    _seeds = json['seeds'];
    _peers = json['peers'];
    _size = json['size'];
    _sizeBytes = json['size_bytes'];
    _dateUploaded = json['date_uploaded'];
    _dateUploadedUnix = json['date_uploaded_unix'];
  }
  String? _url;
  String? _hash;
  String? _quality;
  String? _type;
  String? _isRepack;
  String? _videoCodec;
  String? _bitDepth;
  String? _audioChannels;
  num? _seeds;
  num? _peers;
  String? _size;
  num? _sizeBytes;
  String? _dateUploaded;
  num? _dateUploadedUnix;

  Torrents copyWith({  String? url,
    String? hash,
    String? quality,
    String? type,
    String? isRepack,
    String? videoCodec,
    String? bitDepth,
    String? audioChannels,
    num? seeds,
    num? peers,
    String? size,
    num? sizeBytes,
    String? dateUploaded,
    num? dateUploadedUnix,
  }) => Torrents(  url: url ?? _url,
    hash: hash ?? _hash,
    quality: quality ?? _quality,
    type: type ?? _type,
    isRepack: isRepack ?? _isRepack,
    videoCodec: videoCodec ?? _videoCodec,
    bitDepth: bitDepth ?? _bitDepth,
    audioChannels: audioChannels ?? _audioChannels,
    seeds: seeds ?? _seeds,
    peers: peers ?? _peers,
    size: size ?? _size,
    sizeBytes: sizeBytes ?? _sizeBytes,
    dateUploaded: dateUploaded ?? _dateUploaded,
    dateUploadedUnix: dateUploadedUnix ?? _dateUploadedUnix,
  );
  String? get url => _url;
  String? get hash => _hash;
  String? get quality => _quality;
  String? get type => _type;
  String? get isRepack => _isRepack;
  String? get videoCodec => _videoCodec;
  String? get bitDepth => _bitDepth;
  String? get audioChannels => _audioChannels;
  num? get seeds => _seeds;
  num? get peers => _peers;
  String? get size => _size;
  num? get sizeBytes => _sizeBytes;
  String? get dateUploaded => _dateUploaded;
  num? get dateUploadedUnix => _dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['hash'] = _hash;
    map['quality'] = _quality;
    map['type'] = _type;
    map['is_repack'] = _isRepack;
    map['video_codec'] = _videoCodec;
    map['bit_depth'] = _bitDepth;
    map['audio_channels'] = _audioChannels;
    map['seeds'] = _seeds;
    map['peers'] = _peers;
    map['size'] = _size;
    map['size_bytes'] = _sizeBytes;
    map['date_uploaded'] = _dateUploaded;
    map['date_uploaded_unix'] = _dateUploadedUnix;
    return map;
  }
}

/// name : "Tom Wlaschiha"
/// character_name : "Bus Passenger"
/// url_small_image : "https://yts.lt/assets/images/actors/thumb/nm0937239.jpg"
/// imdb_code : "0937239"

class Cast {
  Cast({
    String? name,
    String? characterName,
    String? urlSmallImage,
    String? imdbCode,}){
    _name = name;
    _characterName = characterName;
    _urlSmallImage = urlSmallImage;
    _imdbCode = imdbCode;
  }

  Cast.fromJson(dynamic json) {
    _name = json['name'];
    _characterName = json['character_name'];
    _urlSmallImage = json['url_small_image'];
    _imdbCode = json['imdb_code'];
  }
  String? _name;
  String? _characterName;
  String? _urlSmallImage;
  String? _imdbCode;

  Cast copyWith({  String? name,
    String? characterName,
    String? urlSmallImage,
    String? imdbCode,
  }) => Cast(  name: name ?? _name,
    characterName: characterName ?? _characterName,
    urlSmallImage: urlSmallImage ?? _urlSmallImage,
    imdbCode: imdbCode ?? _imdbCode,
  );
  String? get name => _name;
  String? get characterName => _characterName;
  String? get urlSmallImage => _urlSmallImage;
  String? get imdbCode => _imdbCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['character_name'] = _characterName;
    map['url_small_image'] = _urlSmallImage;
    map['imdb_code'] = _imdbCode;
    return map;
  }
}