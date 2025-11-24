import 'dart:ui';

class AvatarData {
  String name;
  String images;

  AvatarData({
    required this.name,
    required this.images,
  });

  static List<AvatarData> Avtar = [
    AvatarData(name: "1", images: "assets/avatars/av1.png"),
    AvatarData(name: "2", images: "assets/avatars/av2.png"),
    AvatarData(name: "3", images: "assets/avatars/av3.png"),
    AvatarData(name: "4", images: "assets/avatars/av4.png"),
    AvatarData(name: "5", images: "assets/avatars/av5.png"),
    AvatarData(name: "6", images: "assets/avatars/av6.png"),
    AvatarData(name: "7", images: "assets/avatars/av7.png"),
    AvatarData(name: "8", images: "assets/avatars/av8.png"),
    AvatarData(name: "9", images: "assets/avatars/av9.png"),
  ];
}