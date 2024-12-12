import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<IconData> navIcons = [Icons.home, Icons.wallet, Icons.person];

  List<String> navTitle = ["Home", "Wallet", "Account"];

  int selectedIndex = 0;

  List<String> images = [
    "https://images.pexels.com/photos/208745/pexels-photo-208745.jpeg?cs=srgb&dl=pexels-pixabay-208745.jpg&fm=jpg",
    "https://media.gettyimages.com/id/999740908/photo/golden-dawn.jpg?s=612x612&w=gi&k=20&c=uWc54Oe-nDyRJw90pGnXX_cZcCq3ybhGE57hM2ijL5o=",
    "https://media.gettyimages.com/id/977817694/photo/sunrise-in-25-of-april-bridge.jpg?s=612x612&w=gi&k=20&c=G29LSA2NMJ1FiCTY93HlZtiYMRQel0FclnzTyM0MDDY=",
    "https://media.gettyimages.com/id/989238560/photo/exploring-the-mountains.jpg?s=612x612&w=gi&k=20&c=munlfbwX7CD6PhegDP3BdOMAP8ZjqFCPI9NC_hgOQtE=",
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/75/92/24/kariyathumpara.jpg?w=500&h=400&s=1"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 60,
                right: 270,
              ),
              child: Text(
                "Explore",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TabBar(tabs: [
                Text("Country"),
                Text("State"),
                Text("City"),
                Text("Place"),
              ]),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: MasonryGridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 8.0,
                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: _navBar(),
      ),
    );
  }

  Widget _navBar() {
    return Container(
      height: 65,
      margin: EdgeInsets.only(
        right: 24,
        left: 24,
        bottom: 24,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(20),
                blurRadius: 20,
                spreadRadius: 10)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(navIcons.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  navIcons[index],
                  color: isSelected ? Colors.blueAccent : Colors.grey,
                ),
                Text(
                  navTitle[index],
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.blueAccent : Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
