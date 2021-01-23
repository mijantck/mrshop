// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mrshop/ui/shared/drawer.dart';
import 'package:mrshop/ui/shared/headernav.dart';
import 'package:mrshop/ui/widgets/partyscreen/ledgeritemlist.dart';
import 'package:mrshop/ui/widgets/sectionHeader.dart';
// import 'package:provider/provider.dart';
// import 'package:tassist/core/models/ledger.dart';
// import 'package:tassist/core/services/ledgerservice.dart';

class LedgerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<FirebaseUser>(context);
    final GlobalKey<ScaffoldState> _drawerKey = new GlobalKey<ScaffoldState>();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          key: _drawerKey,
          drawer: tassistDrawer(context),
          appBar: headerNav(_drawerKey),
          body: ListView(
            children: <Widget>[SectionHeader('Ledgers'), LedgerItemList()],
          )),
    );
  }
}
