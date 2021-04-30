import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class IfoodPage extends StatefulWidget {
  const IfoodPage({Key key}) : super(key: key);

  @override
  _IfoodPageState createState() => _IfoodPageState();
}

class _IfoodPageState extends State<IfoodPage> {
  int indexCarousel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: CustomScrollView(
            slivers: [
              buildAppBar(),
              buildFilters(labels: [
                "Ordenar",
                "Pra retirar",
                "Entrega grátis",
                "Vale-refeição",
                "Distância",
                "Entrega Parceira",
              ]),
              buildTypeFood(labels: [
                {"label": "Mercado", "image": "mercado"},
                {"label": "Vale-refeição", "image": "vale"},
                {"label": "Lanches", "image": "lanche"},
                {"label": "Pizza", "image": "pizza"},
                {"label": "Bebidas", "image": "bebidas"},
              ]),
              buidCarouselPromotions(baners: [
                "assets/images/ifood-promotion1.png",
                "assets/images/ifood-promotion2.png",
                "assets/images/ifood-promotion3.png",
                "assets/images/ifood-promotion4.png",
              ]),
              buildStores(title: 'Últimas lojas', size: 3),
              buildPromotionBottom(),
              buildStores(title: 'Famosos no Ifood', size: 6),
              buildTypeFood(labels: [
                {"label": "Bebidas", "image": "bebidas2"},
                {"label": "Farmácia", "image": "farmacia"},
                {"label": "Pet", "image": "pet"},
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.black54,
        elevation: 10,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  Widget buildStores({String title, int size}) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Ver mais...",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            Container(
              height: 115,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: size,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(right: 5),
                      child: Column(
                        children: [
                          CircleAvatar(
                            maxRadius: 35,
                            child: FlutterLogo(
                              size: 50,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Lancheria X")
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildPromotionBottom() {
    return SliverToBoxAdapter(
      child: Container(
        height: 80,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage("assets/images/ifood-bottom.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  Widget buidCarouselPromotions({List<String> baners}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 150,
                disableCenter: true,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    indexCarousel = index;
                  });
                },
              ),
              items: List.generate(baners.length, (index) {
                return Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(baners[index]),
                    ),
                  ),
                );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                baners.length,
                (index) {
                  return Container(
                    width: 5,
                    height: 5,
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          indexCarousel == index ? Colors.black : Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTypeFood({List<Map<String, String>> labels}) {
    return SliverToBoxAdapter(
      child: Container(
        height: 90,
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        child: ListView.builder(
          itemCount: labels.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Container(
              padding: const EdgeInsets.only(right: 10),
              width: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Container(
                              height: 30,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.primaries[Random.secure()
                                    .nextInt(Colors.primaries.length)],
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          Center(
                            child: Image.asset(
                              "assets/types/${labels[index]['image']}.png",
                              height: 80,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: FittedBox(
                      child: Text(labels[index]['label']),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildFilters({List<String> labels}) {
    return SliverToBoxAdapter(
      child: Container(
        height: 35,
        margin: const EdgeInsets.only(bottom: 20, left: 15, top: 15),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowGlow();
            return false;
          },
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: TextButton(
                  child: Row(
                    children: [
                      Text(labels[index]),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 20,
                      ),
                    ],
                  ),
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(
                        width: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: labels.length,
          ),
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: InkWell(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "R. Carlos Romero M., 90",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.red,
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.qr_code_scanner,
            color: Colors.red,
          ),
          splashRadius: 25,
          onPressed: () {},
        ),
      ],
      floating: true,
      bottom: buildBottomBar(),
    );
  }

  Widget buildBottomBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.red,
          isScrollable: true,
          // indicatorColor: Colors.red,
          tabs: [
            Align(
              alignment: Alignment.centerLeft,
              child: Tab(
                child: Text(
                  "Restaurantes",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Tab(
                child: Text(
                  "Mercados",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
