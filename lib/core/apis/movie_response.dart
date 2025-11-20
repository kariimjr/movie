class MovieResponse {
  MovieResponse({
    String? status,
    String? statusMessage,
    Data? data,
    Meta? meta,
  }) {
    _status = status;
    _statusMessage = statusMessage;
    _data = data;
    _meta = meta;
  }

  MovieResponse.fromJson(dynamic json) {
    _status = json['status'];
    _statusMessage = json['status_message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _meta = json['@meta'] != null ? Meta.fromJson(json['@meta']) : null;
  }

  String? _status;
  String? _statusMessage;
  Data? _data;
  Meta? _meta;

  MovieResponse copyWith({
    String? status,
    String? statusMessage,
    Data? data,
    Meta? meta,
  }) => MovieResponse(
    status: status ?? _status,
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

/// server_time : 1763478380
/// server_timezone : "CET"
/// api_version : 2
/// execution_time : "0 ms"

class Meta {
  Meta({
    num? serverTime,
    String? serverTimezone,
    num? apiVersion,
    String? executionTime,
  }) {
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

  Meta copyWith({
    num? serverTime,
    String? serverTimezone,
    num? apiVersion,
    String? executionTime,
  }) => Meta(
    serverTime: serverTime ?? _serverTime,
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

/// movie_count : 71309
/// limit : 20
/// page_number : 1
/// movies : [{"id":72617,"url":"https://yts.mx/movies/nishaanchi-2025","imdb_code":"tt34794166","title":"Nishaanchi","title_english":"Nishaanchi","title_long":"Nishaanchi (2025)","slug":"nishaanchi-2025","year":2025,"rating":6.7,"runtime":176,"genres":["Action","Crime","Drama"],"summary":"","description_full":"","synopsis":"","yt_trailer_code":"QKem0b7Q40I","language":"hi","mpa_rating":"","background_image":"https://yts.mx/assets/images/movies/nishaanchi_2025/background.jpg","background_image_original":"https://yts.mx/assets/images/movies/nishaanchi_2025/background.jpg","small_cover_image":"https://yts.mx/assets/images/movies/nishaanchi_2025/small-cover.jpg","medium_cover_image":"https://yts.mx/assets/images/movies/nishaanchi_2025/medium-cover.jpg","large_cover_image":"https://yts.mx/assets/images/movies/nishaanchi_2025/large-cover.jpg","state":"ok","torrents":[{"url":"https://yts.mx/torrent/download/BB48895FAF37EA5D19E8BC18F72E3B5EAAE9BAEC","hash":"BB48895FAF37EA5D19E8BC18F72E3B5EAAE9BAEC","quality":"720p","type":"web","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":0,"peers":0,"size":"1.58 GB","size_bytes":1696512082,"date_uploaded":"2025-11-18 11:14:56","date_uploaded_unix":1763460896},{"url":"https://yts.mx/torrent/download/89FADA8F82658E72CD3F7D2BCA9F230DFA722861","hash":"89FADA8F82658E72CD3F7D2BCA9F230DFA722861","quality":"1080p","type":"web","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"5.1","seeds":0,"peers":0,"size":"3.24 GB","size_bytes":3478923510,"date_uploaded":"2025-11-18 12:58:01","date_uploaded_unix":1763467081}],"date_uploaded":"2025-11-18 11:14:56","date_uploaded_unix":1763460896}]

class Data {
  Data({
    num? movieCount,
    num? limit,
    num? pageNumber,
    List<Movies>? movies,
  }) {
    _movieCount = movieCount;
    _limit = limit;
    _pageNumber = pageNumber;
    _movies = movies;
  }

  Data.fromJson(dynamic json) {
    _movieCount = json['movie_count'];
    _limit = json['limit'];
    _pageNumber = json['page_number'];
    if (json['movies'] != null) {
      _movies = [];
      json['movies'].forEach((v) {
        _movies!.add(Movies.fromJson(v));
      });
    }
  }

  num? _movieCount;
  num? _limit;
  num? _pageNumber;
  List<Movies>? _movies;

  Data copyWith({
    num? movieCount,
    num? limit,
    num? pageNumber,
    List<Movies>? movies,
  }) => Data(
    movieCount: movieCount ?? _movieCount,
    limit: limit ?? _limit,
    pageNumber: pageNumber ?? _pageNumber,
    movies: movies ?? _movies,
  );

  num? get movieCount => _movieCount;
  num? get limit => _limit;
  num? get pageNumber => _pageNumber;
  List<Movies>? get movies => _movies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movie_count'] = _movieCount;
    map['limit'] = _limit;
    map['page_number'] = _pageNumber;
    if (_movies != null) {
      map['movies'] = _movies!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 72617
/// url : "https://yts.mx/movies/nishaanchi-2025"
/// imdb_code : "tt34794166"
/// title : "Nishaanchi"
/// title_english : "Nishaanchi"
/// title_long : "Nishaanchi (2025)"
/// slug : "nishaanchi-2025"
/// year : 2025
/// rating : 6.7
/// runtime : 176
/// genres : ["Action","Crime","Drama"]
/// summary : ""
/// description_full : ""
/// synopsis : ""
/// yt_trailer_code : "QKem0b7Q40I"
/// language : "hi"
/// mpa_rating : ""
/// background_image : "https://yts.mx/assets/images/movies/nishaanchi_2025/background.jpg"
/// background_image_original : "https://yts.mx/assets/images/movies/nishaanchi_2025/background.jpg"
/// small_cover_image : "https://yts.mx/assets/images/movies/nishaanchi_2025/small-cover.jpg"
/// medium_cover_image : "https://yts.mx/assets/images/movies/nishaanchi_2025/medium-cover.jpg"
/// large_cover_image : "https://yts.mx/assets/images/movies/nishaanchi_2025/large-cover.jpg"
/// state : "ok"
/// torrents : [{"url":"https://yts.mx/torrent/download/BB48895FAF37EA5D19E8BC18F72E3B5EAAE9BAEC","hash":"BB48895FAF37EA5D19E8BC18F72E3B5EAAE9BAEC","quality":"720p","type":"web","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":0,"peers":0,"size":"1.58 GB","size_bytes":1696512082,"date_uploaded":"2025-11-18 11:14:56","date_uploaded_unix":1763460896},{"url":"https://yts.mx/torrent/download/89FADA8F82658E72CD3F7D2BCA9F230DFA722861","hash":"89FADA8F82658E72CD3F7D2BCA9F230DFA722861","quality":"1080p","type":"web","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"5.1","seeds":0,"peers":0,"size":"3.24 GB","size_bytes":3478923510,"date_uploaded":"2025-11-18 12:58:01","date_uploaded_unix":1763467081}]
/// date_uploaded : "2025-11-18 11:14:56"
/// date_uploaded_unix : 1763460896

class Movies {
  Movies({
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
    String? summary,
    String? descriptionFull,
    String? synopsis,
    String? ytTrailerCode,
    String? language,
    String? mpaRating,
    String? backgroundImage,
    String? backgroundImageOriginal,
    String? smallCoverImage,
    String? mediumCoverImage,
    String? largeCoverImage,
    String? state,
    List<Torrents>? torrents,
    String? dateUploaded,
    num? dateUploadedUnix,
  }) {
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
    _summary = summary;
    _descriptionFull = descriptionFull;
    _synopsis = synopsis;
    _ytTrailerCode = ytTrailerCode;
    _language = language;
    _mpaRating = mpaRating;
    _backgroundImage = backgroundImage;
    _backgroundImageOriginal = backgroundImageOriginal;
    _smallCoverImage = smallCoverImage;
    _mediumCoverImage = mediumCoverImage;
    _largeCoverImage = largeCoverImage;
    _state = state;
    _torrents = torrents;
    _dateUploaded = dateUploaded;
    _dateUploadedUnix = dateUploadedUnix;
  }

  Movies.fromJson(dynamic json) {
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
    _summary = json['summary'];
    _descriptionFull = json['description_full'];
    _synopsis = json['synopsis'];
    _ytTrailerCode = json['yt_trailer_code'];
    _language = json['language'];
    _mpaRating = json['mpa_rating'];
    _backgroundImage = json['background_image'];
    _backgroundImageOriginal = json['background_image_original'];
    _smallCoverImage = json['small_cover_image'];
    _mediumCoverImage = json['medium_cover_image'];
    _largeCoverImage = json['large_cover_image'];
    _state = json['state'];
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
  String? _summary;
  String? _descriptionFull;
  String? _synopsis;
  String? _ytTrailerCode;
  String? _language;
  String? _mpaRating;
  String? _backgroundImage;
  String? _backgroundImageOriginal;
  String? _smallCoverImage;
  String? _mediumCoverImage;
  String? _largeCoverImage;
  String? _state;
  List<Torrents>? _torrents;
  String? _dateUploaded;
  num? _dateUploadedUnix;

  Movies copyWith({
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
    String? summary,
    String? descriptionFull,
    String? synopsis,
    String? ytTrailerCode,
    String? language,
    String? mpaRating,
    String? backgroundImage,
    String? backgroundImageOriginal,
    String? smallCoverImage,
    String? mediumCoverImage,
    String? largeCoverImage,
    String? state,
    List<Torrents>? torrents,
    String? dateUploaded,
    num? dateUploadedUnix,
  }) => Movies(
    id: id ?? _id,
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
    summary: summary ?? _summary,
    descriptionFull: descriptionFull ?? _descriptionFull,
    synopsis: synopsis ?? _synopsis,
    ytTrailerCode: ytTrailerCode ?? _ytTrailerCode,
    language: language ?? _language,
    mpaRating: mpaRating ?? _mpaRating,
    backgroundImage: backgroundImage ?? _backgroundImage,
    backgroundImageOriginal: backgroundImageOriginal ?? _backgroundImageOriginal,
    smallCoverImage: smallCoverImage ?? _smallCoverImage,
    mediumCoverImage: mediumCoverImage ?? _mediumCoverImage,
    largeCoverImage: largeCoverImage ?? _largeCoverImage,
    state: state ?? _state,
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
  String? get summary => _summary;
  String? get descriptionFull => _descriptionFull;
  String? get synopsis => _synopsis;
  String? get ytTrailerCode => _ytTrailerCode;
  String? get language => _language;
  String? get mpaRating => _mpaRating;
  String? get backgroundImage => _backgroundImage;
  String? get backgroundImageOriginal => _backgroundImageOriginal;
  String? get smallCoverImage => _smallCoverImage;
  String? get mediumCoverImage => _mediumCoverImage;
  String? get largeCoverImage => _largeCoverImage;
  String? get state => _state;
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
    map['summary'] = _summary;
    map['description_full'] = _descriptionFull;
    map['synopsis'] = _synopsis;
    map['yt_trailer_code'] = _ytTrailerCode;
    map['language'] = _language;
    map['mpa_rating'] = _mpaRating;
    map['background_image'] = _backgroundImage;
    map['background_image_original'] = _backgroundImageOriginal;
    map['small_cover_image'] = _smallCoverImage;
    map['medium_cover_image'] = _mediumCoverImage;
    map['large_cover_image'] = _largeCoverImage;
    map['state'] = _state;
    if (_torrents != null) {
      map['torrents'] = _torrents!.map((v) => v.toJson()).toList();
    }
    map['date_uploaded'] = _dateUploaded;
    map['date_uploaded_unix'] = _dateUploadedUnix;
    return map;
  }
}

/// url : "https://yts.mx/torrent/download/BB48895FAF37EA5D19E8BC18F72E3B5EAAE9BAEC"
/// hash : "BB48895FAF37EA5D19E8BC18F72E3B5EAAE9BAEC"
/// quality : "720p"
/// type : "web"
/// is_repack : "0"
/// video_codec : "x264"
/// bit_depth : "8"
/// audio_channels : "2.0"
/// seeds : 0
/// peers : 0
/// size : "1.58 GB"
/// size_bytes : 1696512082
/// date_uploaded : "2025-11-18 11:14:56"
/// date_uploaded_unix : 1763460896

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
    num? dateUploadedUnix,
  }) {
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

  Torrents copyWith({
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
    num? dateUploadedUnix,
  }) => Torrents(
    url: url ?? _url,
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