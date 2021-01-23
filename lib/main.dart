import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mrshop/route_generator.dart';
import 'package:mrshop/theme/texts.dart';
import 'package:provider/provider.dart';

import 'core/models/company.dart';
import 'core/models/inactivecustomer.dart';
import 'core/models/ledger.dart';
import 'core/models/payables.dart';
import 'core/models/receivables.dart';
import 'core/models/stockitem.dart';
import 'core/models/vouchers.dart';
import 'core/services/auth.dart';
import 'core/services/companyservice.dart';
import 'core/services/inactivecustomerservice.dart';
import 'core/services/ledgerservice.dart';
import 'core/services/payablesservice.dart';
import 'core/services/receivablesservice.dart';
import 'core/services/stockservice.dart';
import 'core/services/vouchers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String _title = "TallyAssist";

    return MultiProvider(providers: [
      StreamProvider<FirebaseUser>.value(
        value: AuthService().user,
      ),
    ], child: TopWidget(title: _title));
  }
}

class TopWidget extends StatefulWidget {
  const TopWidget({
    Key key,
    @required String title,
  })  : _title = title,
        super(key: key);

  final String _title;

  @override
  _TopWidgetState createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  // final Firestore _db = Firestore.instance;

  // StreamSubscription iosSubscription;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    return MultiProvider(
      providers: [
        StreamProvider<List<ReceivablesItem>>.value(
          // initialData: List<ReceivablesItem>(),
          value: ReceivablesItemService(uid: user?.uid).accountsReceivableData,
        ),
        // LEDGER/PARTY DATA
        StreamProvider<List<LedgerItem>>.value(
            value: LedgerItemService(uid: user?.uid).ledgerItemData),
        StreamProvider<List<StockItem>>.value(
            value: StockItemService(uid: user?.uid).stockItemsData),
        StreamProvider<List<PayablesItem>>.value(
            value: PayablesItemService(uid: user?.uid).accountsPayablesData),
        StreamProvider<List<InactiveCustomer>>.value(
            value:
            InactiveCustomerService(uid: user?.uid).inactiveCustomerData),
        // StreamProvider<List<SalesVoucher>>.value(
        //     value: SalesVoucherService(uid: user?.uid).salesVoucherData),
        // StreamProvider<List<PurchaseVoucher>>.value(
        //     value: PurchaseVoucherService(uid: user?.uid).purchaseVoucherData),
        // StreamProvider<List<PaymentVoucher>>.value(
        //     value: PaymentVoucherService(uid: user?.uid).paymentVoucherData),
        // StreamProvider<List<ReceiptVoucher>>.value(
        //     value: ReceiptVoucherService(uid: user?.uid).receiptVoucherData),
        StreamProvider<List<Voucher>>.value(
            value: VoucherService(uid: user?.uid).voucherData),
        StreamProvider<Company>.value(
            value: CompanyService(uid: user?.uid).companyData),
        // StreamProvider<DocumentSnapshot>.value(
        //     value: DatabaseService()
        //         .companyCollection
        //         .document(user?.uid)
        //         .snapshots()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        // routes: {
        //   '/': (context) => RootPage(),
        //   '/vouchers': (context) => VouchersHome(),
        //   '/voucherview': (context) => VoucherView(),
        //   '/ledgerview': (context) => LedgerView(),
        //   '/ledgers': (context) => LedgerScreen()
        // },
        title: widget._title,
        // home: HomeScreen(),
        // home: RootPage(),
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(headline6: primaryAppBarTitle),
          ),
          textTheme: TextTheme(
              headline6: secondaryListTitle,
              subtitle1: secondaryCategoryDesc,
              bodyText1: secondaryListDisc,
              bodyText2: secondaryListTitle2),
        ),
      ),
    );
  }
}
