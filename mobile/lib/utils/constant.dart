import '../icon/custome_icon.dart';
import 'package:flutter/material.dart';

//COLORS
const Color profile_info_background = Color(0xFF3775FD);
const Color profile_info_categories_background = Color(0xFFF6F5F8);
const Color profile_info_address = Color(0xFF8D7AEE);
const Color profile_info_privacy = Color(0xFFF369B7);
const Color profile_info_general = Color(0xFFFFC85B);
const Color profile_info_notification = Color(0xFF5DD1D3);
const Color profile_item_color = Color(0xFFC4C5C9);
const String imagePath = 'assets/images';

const String devMausam =
    'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/mausam%2Fprofile.jpg?alt=media&token=83fa8b83-f53b-489c-a799-ca5d5aceae7b';

const Color furnitureCateDisableColor = Color(0xFF939BA9);
const List lampsImage = [
  {'image': '${imagePath}/1.jpg'},
  {'image': '${imagePath}/2.jpg'},
  {'image': '${imagePath}/3.jpg'},
  {'image': '${imagePath}/3.jpg'},
  {'image': '${imagePath}/3.jpg'},
  {'image': '${imagePath}/3.jpg'},
];
List<ProfileMenu> lampList = [
  // ProfileMenu(title: 'Landscape', subTitle: '384'),
  ProfileMenu(title: 'Discus Pendant', subTitle: '274'),
  ProfileMenu(title: 'Mushroom Lamp', subTitle: '374'),
  ProfileMenu(title: 'Titanic Pendant', subTitle: '562'),
  ProfileMenu(title: 'Torn Lighting', subTitle: '105'),
  ProfileMenu(title: 'Abduction Pendant', subTitle: '365'),
];
const List profileItems = [
  {'count': '846', 'name': 'Collect'},
  {'count': '51', 'name': 'Attention'},
  {'count': '267', 'name': 'Track'},
  {'count': '39', 'name': 'Coupons'},
];

List<Catg> listProfileCategories = [
  Catg(name: 'Wallet', icon: CustomIcon.account_balance_wallet, number: 0),
  Catg(name: 'Delivery', icon: CustomIcon.truck, number: 0),
  Catg(name: 'Message', icon: CustomIcon.chat, number: 2),
  Catg(name: 'Service', icon: CustomIcon.money, number: 0),
];

List<FurnitureCatg> furnitureCategoriesList = [
  FurnitureCatg(icon: Icons.desktop_windows, elivation: true),
  FurnitureCatg(icon: CustomIcon.account_balance_wallet, elivation: false),
  FurnitureCatg(icon: Icons.security, elivation: false),
  FurnitureCatg(icon: CustomIcon.chat, elivation: false),
  FurnitureCatg(icon: CustomIcon.money, elivation: false),
];

List<ProfileMenu> profileMenuList = [
  ProfileMenu(
    title: 'Address',
    subTitle: 'Ensure your harvesting address',
    iconColor: profile_info_address,
    icon: Icons.location_on,
  ),
  ProfileMenu(
    title: 'Privacy',
    subTitle: 'System permission change',
    iconColor: profile_info_privacy,
    icon: Icons.lock,
  ),
  ProfileMenu(
    title: 'General',
    subTitle: 'Basic functional settings',
    iconColor: profile_info_general,
    icon: Icons.layers,
  ),
  ProfileMenu(
    title: 'Notification',
    subTitle: 'Take over the news in time',
    iconColor: profile_info_notification,
    icon: Icons.notifications,
  ),
];

class ProfileMenu {
  String title;
  String subTitle;
  IconData icon;
  Color iconColor;
  ProfileMenu({this.icon, this.title, this.iconColor, this.subTitle});
}

class Catg {
  String name;
  IconData icon;
  int number;
  Catg({this.icon, this.name, this.number});
}

class FurnitureCatg {
  IconData icon;
  bool elivation;
  FurnitureCatg({this.icon, this.elivation});
}
