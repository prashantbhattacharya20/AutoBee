import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  int selectedBottomTab = 0;

  void onBotytomNavigationTabChange(int index) {
    selectedBottomTab = index;
    notifyListeners();
  }
  
  bool isFirstRightDoorLock = true;
  bool isFirstLeftDoorLock = true;
  bool isSecondRightDoorLock = true;
  bool isSecondLeftDoorLock = true;
  bool isTrunkLock = true;
  bool isBonnetLock = true;
  bool isCoolSelected = true;
  bool isShowTyre = true;
  bool isShowTyreStatus = true;

  void updateFirstRightDoorLock() {
    isFirstRightDoorLock = !isFirstRightDoorLock;
    notifyListeners();
  }

  void updateFirstLeftDoorLock() {
    isFirstLeftDoorLock = !isFirstLeftDoorLock;
    notifyListeners();
  }

  void updateSecondRightDoorLock() {
    isSecondRightDoorLock = !isSecondRightDoorLock;
    notifyListeners();
  }

  void updateSecondLeftDoorLock() {
    isSecondLeftDoorLock = !isSecondLeftDoorLock;
    notifyListeners();
  }

  void updateTrunkLock() {
    isTrunkLock = !isTrunkLock;
    notifyListeners();
  }

  void updateBonnetLock() {
    isBonnetLock = !isBonnetLock;
    notifyListeners();
  }

  void updateCoolSelectedTab() {
    isCoolSelected = !isCoolSelected;
    notifyListeners();
  }
}