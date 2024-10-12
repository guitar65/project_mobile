import 'package:account/screens/form_screen.dart';
import 'package:account/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:account/provider/transaction_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Transactions'),
        ),
        body: const Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  HomeScreen(),
                  FormScreen(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
            color: Colors.black,
            child: const TabBar(
                tabs: [
                  Tab(
                    text: "รายการเพื่อน",
                    icon: Icon(Icons.favorite, color: Colors.red, size: 30),
                  ),
                  Tab(
                    text: "เพิ่มเพื่อน",
                    icon: Icon(Icons.star, color: Colors.blue, size: 30),
                  ),
                  Tab(
                    text: "ข้อความ",
                    icon: Icon(
                      Icons.chat,
                      color: Colors.white,
                    ),
                  ),
                  Tab(
                    text: "ค้นหา",
                    icon: Icon(Icons.search),
                  ),
                ],
                labelColor: Colors.white, // Set text color for selected tab
                unselectedLabelColor: Color.fromARGB(
                    255, 255, 255, 255), // Set text color for unselected tab
                indicatorColor: Colors.blue)),
      ),
    );
  }
}
