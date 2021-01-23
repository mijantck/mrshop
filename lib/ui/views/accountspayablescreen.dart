
import 'package:flutter/material.dart';
import 'package:mrshop/ui/shared/drawer.dart';
import 'package:mrshop/ui/shared/headernav.dart';
import 'package:mrshop/ui/widgets/accountspayables/accountspayablelist.dart';
import 'package:mrshop/ui/widgets/sectionHeader.dart';
// import 'package:tassist/theme/colors.dart';
// import 'package:tassist/theme/dimensions.dart'



class AccountsPayableScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

        final GlobalKey<ScaffoldState> _drawerKey = new GlobalKey<ScaffoldState>();
        // final user = Provider.of<FirebaseUser>(context);

    return WillPopScope (
              onWillPop: () async => false,
          child: Scaffold(
        key: _drawerKey,
        drawer: tassistDrawer(context),
        appBar: headerNav(_drawerKey),
        // bottomNavigationBar: bottomNav(),
        body: ListView(
          children: <Widget>[
            SectionHeader('Accounts Payables'),
            // Text('Dummy data, coming soon!'),
            // Padding(
            //   padding: spacer.all.xs,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: <Widget>[
            //      BigMetricNoIcon('30', '<30 days', TassistSuccess),
            //      BigMetricNoIcon('12', '30-45 days', TassistWarning),
            //      BigMetricNoIcon('16', '45-60 days', TassistDanger),
            //     ],
            //   ),
            // ),
            // SecondarySectionHeader('List of parties'),
            APLedgerItemList(),
      
          ],


        )


      ),
    );
  }
}