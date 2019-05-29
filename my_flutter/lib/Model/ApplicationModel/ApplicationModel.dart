import 'package:flutter/material.dart';
import 'package:my_flutter/section/home/Homepage.dart';
import 'package:my_flutter/section/read/Read.dart';
import 'package:my_flutter/section/test/Test.dart';
import 'package:my_flutter/section/about/About.dart';
import 'package:my_flutter/section/user/User.dart';
import 'package:my_flutter/Const/Config.dart';

class ApplicationModel {

  static final tabControllers = [Homepage(), Read(), Test(), About(), User()];
  static final tabsTitle = ['首页','阅读','练习','简言','我的'];
  static final tabsIcon = ['AssetFile/tabbar/indexImage.png','AssetFile/tabbar/mainImage.png','AssetFile/tabbar/ownerImage.png','AssetFile/tabbar/secondImage.png','AssetFile/tabbar/userImage.png'];
  static final tabSelectIcon = ['AssetFile/tabbar/indexSelectImage.png','AssetFile/tabbar/mainSelectImage.png','AssetFile/tabbar/ownerSelectImage.png','AssetFile/tabbar/secondSelectImage.png','AssetFile/tabbar/userSelectImage.png'];

  static final List<BottomNavigationBarItem> tabArray = <BottomNavigationBarItem> [
    getCTab(tabsTitle[0], tabsIcon[0], tabSelectIcon[0]),
    getCTab(tabsTitle[1], tabsIcon[1], tabSelectIcon[1]),
    getCTab(tabsTitle[2], tabsIcon[2], tabSelectIcon[2]),
    getCTab(tabsTitle[3], tabsIcon[3], tabSelectIcon[3]),
    getCTab(tabsTitle[4], tabsIcon[4], tabSelectIcon[4]),
  ];

  static BottomNavigationBarItem getCTab(String title, String imagePath, String activeImagePath) {
    return new BottomNavigationBarItem(
        title: Text(title),
        icon: Image.asset(imagePath,width: 24, height: 24,),
        activeIcon: Image.asset(activeImagePath,width: 24, height: 24,),
        backgroundColor: Config.cBlue
    );
  }

}