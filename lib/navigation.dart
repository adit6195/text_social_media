import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:social_media/screens/home.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: 
      NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorShape: null,
          indicatorColor: Colors.transparent,
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
           (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return const TextStyle(
                    fontSize: 12, // Font size for the selected label
                    fontWeight: FontWeight.bold, // Bold font for selected label
                    color: Colors.cyan, // Color for selected label
                  );
                } else {
                  return TextStyle(
                    fontSize: 12, // Font size for the unselected label
                    color:  Colors.black, // Color for unselected label
                  );
                }
              },
           ),
           iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return const IconThemeData(
                    color: Colors.cyan, // Color for selected icon
                    size: 24, // Size for selected icon
                  );
                } else {
                  return IconThemeData(
                    color: Colors.black, // Color for unselected icon
                    size: 24, // Size for unselected icon
                  );
                }
              },
        ),
        ),
        child: Obx(
        ()=> NavigationBar(
          
          height: 58,
          elevation: 0,
          backgroundColor: Colors.white,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index)=>controller.selectedIndex.value=index,
          destinations: const[
            NavigationDestination(icon: Icon(Iconsax.home_15,),label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.add), label: "Posts"),
            NavigationDestination(icon: Icon(Icons.person_2_outlined),label: "You"),
          ],
        ),
      ),
      ),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomeScreen(),
    // Container(color: Colors.amber,),
    Container(color: Colors.red),
    Container(color: Colors.blue),
    Container(color: Colors.purple),
    Container(color: Colors.deepOrangeAccent,)
  ];
}

