import 'package:flutter/material.dart';
import 'package:pretium/utils/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: kWhite,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              size: 30,
              Icons.account_balance_wallet_outlined,
              color: selectedIndex == 0 ? kDarkGreen : Colors.grey,
            ),
            onPressed: () => onItemTapped(0),
          ),
          IconButton(
            icon: Icon(
              Icons.qr_code_scanner,
              size: 30,
              color: selectedIndex == 1 ? kDarkGreen : Colors.grey,
            ),
            onPressed: () => onItemTapped(1),
          ),
          IconButton(
            icon: Icon(
              size: 30,
              Icons.swap_horiz,
              color: selectedIndex == 2 ? kDarkGreen : Colors.grey,
            ),
            onPressed: () => onItemTapped(2),
          ),
        ],
      ),
    );
  }
}
