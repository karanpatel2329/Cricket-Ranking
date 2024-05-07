import 'package:cricket_demo/core/constants/colors.dart';
import 'package:cricket_demo/features/ranking/presentation/UI/widgets/odi_widget.dart';
import 'package:cricket_demo/features/ranking/presentation/UI/widgets/t20_widget.dart';
import 'package:cricket_demo/features/ranking/presentation/UI/widgets/test_widget.dart';
import 'package:cricket_demo/features/ranking/presentation/bloc/rank_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: AppColors.purple
));
    BlocProvider.of<RankBloc>(context).add(GetDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RankBloc, RankState>(
      listener: (context, state) {
        if (state is RankError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is RankLoading || state is RankInitial) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is RankLoaded) {
          return DefaultTabController(
            length: 3,
            initialIndex: state.tabIndex,
            child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppColors.white),
                    onPressed: () {
                      // Navigator.pop(context);
                    },
                  ),
                  centerTitle: true,
                  title: const Text(
                    'Ranking',
                    style: TextStyle(color: AppColors.white),
                  ),
                  flexibleSpace: Container(
                    margin: EdgeInsets.only(top: 30),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[AppColors.blue, AppColors.purple],
                      ),
                    ),
                  ),
                  bottom: TabBar(
                    labelColor: AppColors.white,
                    unselectedLabelColor: AppColors.white,
                    indicatorColor: AppColors.white,
                    onTap: (index) {
                      BlocProvider.of<RankBloc>(context).add(ChangeTabEvent(
                          rankModel: state.rankModel, index: index));
                    },
                    tabs: const [
                      Tab(
                        text: "ODI",
                      ),
                      Tab(
                        text: "TEST",
                      ),
                      Tab(
                        text: "T20",
                      ),
                    ],
                  ), //
                ),
                body: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ODIWidget(state: state),
                    TestWidget(state: state),
                    T20Widget(state: state),
                  ],
                )),
          );
        }
        return SizedBox();
      },
    );
  }
}
