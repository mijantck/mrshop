import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mrshop/core/models/production.dart';
import 'package:mrshop/core/services/database.dart';
import 'package:mrshop/theme/colors.dart';
import 'package:mrshop/theme/dimensions.dart';
import 'package:mrshop/ui/shared/bottomsheetcustom.dart';
import 'package:mrshop/ui/shared/drawer.dart';
import 'package:mrshop/ui/shared/headernav.dart';
import 'package:mrshop/ui/widgets/productionForm.dart';
import 'package:mrshop/ui/widgets/productionList.dart';
import 'package:mrshop/ui/widgets/sectionHeader.dart';
import 'package:provider/provider.dart';

class ProductionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showProductionPanel() {
      showModalBottomSheetCustom(
          context: context,
          builder: (context) {
            return Container(
              padding: spacer.all.xs,
              child: ProductionForm(),
            );
          });
    }

    final GlobalKey<ScaffoldState> _drawerKey = new GlobalKey<ScaffoldState>();
    final user = Provider.of<FirebaseUser>(context);

    return StreamProvider<List<Production>>.value(
      //IDFixTODO - pass user to database service
      value: DatabaseService(uid: user.uid).productionData,
      child:  WillPopScope (
              onWillPop: () async => false,
              child: Scaffold(
          key: _drawerKey,
          drawer: tassistDrawer(context),
          appBar: headerNav(_drawerKey),
          // bottomNavigationBar: bottomNav(),
          body: Column(
            children: <Widget>[
              SectionHeader('Daily Production Report'),
              ProductionList(),
            ],
          ),
          floatingActionButton: Padding(
            padding: spacer.all.xs,
            child: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: TassistPrimaryBackground,
              onPressed: () => _showProductionPanel(),
            ),
          ),
        ),
      ),
    );
  }
}
