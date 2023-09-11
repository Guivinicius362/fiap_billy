import 'package:billy/features/home/home_model.dart';
import 'package:billy/features/home/home_repository.dart';
import 'package:billy/features/home/notification.dart';
import 'package:billy/features/home/summary_item_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _getIt = GetIt.instance;

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final NotificationsBloc _bloc = _getIt<NotificationsBloc>();
  String username = "Fulano";

  @override
  void initState() {
    _getIt<HomeRepository>().home().then(
          (value) => setState(
            () {
              username = value.username;
            },
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc.fetchNotifications();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Olá $username')),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.of(context).pushNamed('profile_screen');
            },
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        visible: true,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        tooltip: 'Ações',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.account_balance),
            label: 'Adicionar banco',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => Navigator.of(context).pushNamed('create_bank_screen'),
          ),
          SpeedDialChild(
            child: Icon(Icons.add_card),
            label: 'Adicionar cartão',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('Ação 2'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<List<NotificationModel>>(
                stream: _bloc.notificationsStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 1.0,
                      autoPlay: true,
                      enlargeCenterPage: false,
                    ),
                    items: snapshot.data!
                        .map((e) => NotificationWidget(
                              notification: e,
                            ))
                        .toList(),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24),
                  Text(
                    'Sumários:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  SummaryItemWidget(
                    title: 'Renda Total',
                    percentageChange: 5.2,
                    totalAmount: 5500.00,
                  ),
                  SummaryItemWidget(
                    title: 'Despesa Total',
                    percentageChange: -2.7,
                    totalAmount: 3500.00,
                  ),
                  SummaryItemWidget(
                    title: 'Resumo de Investimentos',
                    percentageChange: 8.5,
                    totalAmount: 2500.00,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  final NotificationModel notification;

  NotificationWidget({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            notification.title,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          SizedBox(height: 8.0),
          Text(
            notification.subtitle,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Data: ${notification.date}',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
