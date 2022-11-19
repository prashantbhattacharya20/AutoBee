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
  bool isShowTyre = false;
  bool isShowTyreStatus = false;

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

  void showTyreController(int index) {
    if (selectedBottomTab != 4 && index == 4) {
      Future.delayed(
        Duration(milliseconds: 400),
        () {
          isShowTyre = true;
          notifyListeners();
        },
      );
    } else {
      isShowTyre = false;
      notifyListeners();
    }
  }

  void tyreStatusController(int index) {
    if (selectedBottomTab != 4 && index == 4) {
      isShowTyreStatus = true;
      notifyListeners();
    } else {
      Future.delayed(Duration(milliseconds: 400), () {
        isShowTyreStatus = false;
        notifyListeners();
      });
    }
  }
}
