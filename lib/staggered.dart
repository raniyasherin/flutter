import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Staggered extends StatefulWidget {
  const Staggered({super.key});

  @override
  State<Staggered> createState() => _StaggeredState();
}

class _StaggeredState extends State<Staggered> {
  List <String> images = [
    "https://www.usnews.com/object/image/00000163-8d5b-d398-ad7f-8dfff5760000/3-eiffel-tower-getty.jpg?update-time=1527086483519&size=responsive640",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyVLu0PLmnzLFEAgllNZMbSaxhMiShutInsvVXe9g4uDwzKfomhUdFkVwj1kpDyGT2x70&usqp=CAU",
    "https://www.travelenclave.com/wp-content/uploads/2024/03/top-tourist-attractions-2-768x512.webp",
    "https://www.holidify.com/images/bgImages/INDONESIA.jpg",
    "https://images.travelandleisureasia.com/wp-content/uploads/sites/3/2023/09/25154028/bali.jpeg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeD3BbtXx40Hj38CVj5ps0zd4vzJTFGgZBDA&s"

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: SingleChildScrollView(
  child: Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          children: 
            images.asMap().entries.map((entry) {
            int index = entry.key;
            String _index = entry.value;
            return StaggeredGridTile.count(
              crossAxisCellCount: (index % 3 ==0) ? 2 : 1,
                mainAxisCellCount: (index % 2 == 0) ? 2 :1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(images[index],fit: BoxFit.fill,),
        
            ));
                }).toList()
            
           
        ),
      ),
        
          
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(10),
          //   child: Image.network(images[index],fit: BoxFit.cover,),
          // )
        ],
       
        
        
  
      ),
)

    
    


    );
  }
}