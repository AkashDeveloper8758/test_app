import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/cubit/post_cubit.dart';
import 'package:todoapp/helper/getit.dart';
import 'package:todoapp/screens/map_screen.dart';

import 'home_screen.dart';

class WrapperScreen extends StatefulWidget {
  const WrapperScreen({Key? key}) : super(key: key);

  @override
  State<WrapperScreen> createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breaking Bad'),
      ),
      body: BlocProvider(
        create: (_) => getIt<PostCubit>(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Material(
              elevation: 4,
              child: TabBar(
                  unselectedLabelColor: Colors.grey,
                  controller: _tabController,
                  labelStyle: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  labelColor: Colors.black,
                  tabs: const [
                    Tab(
                      child: Text(
                        'Breaking bad',
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Map',
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [HomeScreen(), MapScreen()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
