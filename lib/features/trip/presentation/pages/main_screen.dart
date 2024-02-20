import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/features/trip/presentation/pages/add_trips_screen.dart';
import 'package:travel_app/features/trip/presentation/pages/my_trip_screen.dart';
import 'package:travel_app/features/trip/presentation/providers/trip_provider.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({super.key});
  final PageController _controller = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(tripListNotifierProvider.notifier).loadTrips();
    _controller.addListener(() {
      _currentPage.value = _controller.page!.round();
    });
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 100,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi Dear 👋",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Text(
                "Travelling Today ?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              )
            ],
          ),
        ),
        // backgroundColor: Colors.amber,
        body: PageView(
          controller: _controller,
          children: [MyTripsScreen(), AddTripScreen(), Text("3")],
        ),
        bottomNavigationBar: SizedBox(
          height: 90,
          child: ValueListenableBuilder(
            valueListenable: _currentPage,
            builder: (context, pageIndex, child) {
              return BottomNavigationBar(
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                currentIndex: pageIndex,
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.list), label: "My Trips"),
                  BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add Trips"),
                  BottomNavigationBarItem(icon: Icon(Icons.map), label: "Maps"),
                ],
                onTap: (int index) {
                  _controller.jumpToPage(index);
                },
              );
            },
          ),
        ));
  }
}
