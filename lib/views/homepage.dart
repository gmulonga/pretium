import 'package:flutter/material.dart';
import 'package:pretium/utils/constants.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _hideBalance = false;

  String _selectedCountry = "Kenya";
  final List<String> _countries = [
    "Kenya",
    "Uganda",
    "Nigeria",
    "Ghana",
    "Malawi",
    "Zambia",
    "Rwanda",
  ];

  void _showCountrySelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          children:
              _countries.map((country) {
                return ListTile(
                  title: Text(country),
                  onTap: () {
                    setState(() {
                      _selectedCountry = country;
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkGreen,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(left: 16),
            width: 35,
            height: 35,
            decoration: BoxDecoration(color: kWhite, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text(
              'G',
              style: TextStyle(
                fontSize: kTitleFont,
                fontWeight: FontWeight.bold,
                color: kDarkGreen,
              ),
            ),
          ),
        ),
        title: Text('Hello, Gadson 👋', style: TextStyle(color: kWhite)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: kWhite),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [kBlue, kDarkGreen],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                Icons.account_balance_wallet_outlined,
                                color: kWhite,
                                size: 25,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                _hideBalance
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: kLightGreen,
                              ),
                              onPressed: () {
                                setState(() {
                                  _hideBalance = !_hideBalance;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Wallet Balance",
                          style: TextStyle(color: kLightGreen),
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // First line (KES 0.00 or ****)
                              Text(
                                _hideBalance ? "KES ****" : "KES 0.00",
                                style: TextStyle(
                                  color: kLightGreen,
                                  fontSize: kTitleFont,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Second line (\$0.00) shown only when visible
                              Visibility(
                                visible: !_hideBalance,
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text(
                                    "\$ 0.00",
                                    style: TextStyle(color: kLightGreen),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  color: kWhite,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Financial Services'),
                            GestureDetector(
                              onTap: () => _showCountrySelector(context),
                              child: Row(
                                children: [
                                  Text(
                                    _selectedCountry,
                                    style: TextStyle(
                                      color: kDarkGreen,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: kDarkGreen,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: kLightGreen,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.telegram_sharp,
                                      color: kDarkGreen,
                                      size: 40,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text("Send Money"),
                                ],
                              ),
                            ),
                            Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: kLightGreen,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.shopping_bag_outlined,
                                      color: kDarkGreen,
                                      size: 40,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text("Paybill"),
                                ],
                              ),
                            ),
                            Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: kLightGreen,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.padding_outlined,
                                      color: kDarkGreen,
                                      size: 40,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text("Buy goods"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: kLightGreen,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.phone_android,
                                    color: kDarkGreen,
                                    size: 40,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text("Airtime"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Recent Transactions'),
                    Text('See all', style: TextStyle(color: kDarkGreen)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
