import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_router/config/app_router.dart';
import 'package:ui_router/ui/widgets/category_widget.dart';
import 'package:ui_router/ui/widgets/custom_drawer.dart';
import 'package:ui_router/ui/widgets/custom_textfield.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> categories = [
    "All categories",
    'Gadgets',
    'Clothes',
    'Accessories'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/brand.png",
          height: 40,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed(AppRouter.detailScreen);
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          IconButton(
            onPressed: () {
              context.goNamed(AppRouter.cartScreen);
            },
            icon: const Icon(Icons.person_outline),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: SliverToBoxAdapter(
              child: CustomTextfield(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryWidget(text: categories[index]);
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              height: 200,
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/banner.png"),
                ),
              ),
            ),
          )
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
