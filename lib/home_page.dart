import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoping_app/themes.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget{

  HomePage({super.key});

  State<HomePage> createState() => HomePageState();
}
class HomePageState extends State<HomePage>{

  final PageController _pageController = PageController();

  List<String> _images = [
    'https://rukminim2.flixcart.com/fk-p-flap/3240/540/image/b9423f4fafdeff72.jpg?q=60',
    'https://rukminim2.flixcart.com/fk-p-flap/3240/540/image/1f9c9ad24c2bc37b.jpg?q=60',
    'https://rukminim2.flixcart.com/fk-p-flap/3240/540/image/66faf3950cda0b7a.png?q=60',
    'https://rukminim2.flixcart.com/fk-p-flap/3240/540/image/1f9c9ad24c2bc37b.jpg?q=60',
    'https://rukminim2.flixcart.com/fk-p-flap/3240/540/image/66faf3950cda0b7a.png?q=60'
  ];

  late List<String> _loopImages = [_images[0],_images[1],_images[2],_images[3],_images[4],_images[0]];

  int _currentPage =0;
  Timer? _timer;

  List<String> topDeals = [
    'https://rukminim2.flixcart.com/image/312/312/xif0q/dslr-camera/f/v/9/vlog-mini-48-pfc01-profocus-original-imah7bufs6nrryr6.jpeg?q=70',
    'https://rukminim2.flixcart.com/image/420/420/xif0q/sock/s/i/e/m-3-unisex-ankle-length-socks-piima-original-imahgthmb5cmzsnz.jpeg?q=60',
    'https://rukminim2.flixcart.com/image/612/612/xif0q/t-shirt/q/l/5/m-jr5nahlm6l-try-this-resized-2-original-imahfe5fmhqehwzm.jpeg?q=70',
    'https://rukminim2.flixcart.com/image/612/612/xif0q/sari/v/3/f/free-bridal-red-saree-snh-export-unstitched-resized-2-original-imahbmaaqfcnkhez.jpeg?q=70',
    'https://rukminim2.flixcart.com/image/612/612/xif0q/shoe/s/c/u/6-h20040-6-red-chief-hr-grey-white-original-imahghztt3jhvpvn.jpeg?q=70',
    'https://rukminim2.flixcart.com/image/612/612/xif0q/shirt/z/t/6/xl-fms-181-fllseve-pop-ol-force-original-imah459zhrvvjp4m.jpeg?q=70',
    'https://rukminim2.flixcart.com/image/612/612/xif0q/car-cradle/dashboard/t/g/r/car-phone-holder-360-rotation-super-adsorption-phone-mount-original-imah5vzktgehxhvj.jpeg?q=70',
    'https://rukminim2.flixcart.com/image/612/612/xif0q/car-cradle/dashboard/t/g/r/car-phone-holder-360-rotation-super-adsorption-phone-mount-original-imah5vzktgehxhvj.jpeg?q=70',
    'https://rukminim2.flixcart.com/image/612/612/l2hwwi80/mobile-holder/e/h/r/stand-foldable-portable-phone-stand-hold-up-yes-original-imagdtvgzehjhhmg.jpeg?q=70'
  ];

  List<String> beauty = [
    'https://rukminim2.flixcart.com/image/612/612/xif0q/face-wash/5/1/k/100-ocean-for-men-fights-acne-pimple-skin-brightening-all-skin-original-imahajnft9f9hfjc.jpeg?q=70',
    'https://rukminim2.flixcart.com/image/612/612/xif0q/blush/u/0/k/12-craze-cloud-puff-swiss-beauty-original-imahd988qkxqkwzm.jpeg?q=70',
    'https://rukminim2.flixcart.com/image/612/612/xif0q/brush-applicator/0/h/e/13-pcs-professional-makeup-brush-set-with-4-beauty-blender-puff-original-imahghz4eh8emzhw.jpeg?q=70',
    'https://rukminim2.flixcart.com/image/612/612/xif0q/toner/m/8/0/98-9-vitamin-e-moisturizer-for-face-daily-moisturizer-for-body-original-imah9szrcmybdzgm.jpeg?q=70',
    'https://rukminim2.flixcart.com/image/612/612/kq5iykw0/brush-applicator/f/o/7/professional-series-makeup-brush-set-with-storage-barrel-pink-original-imag48hfdfh2sxxa.jpeg?q=70',
    'https://rukminim2.flixcart.com/image/612/612/xif0q/makeup-kit/r/b/a/face-makeup-combo-kit-of-10-beauty-face-makeup-products-ecilak-original-imaha8kjg4qjvmxs.jpeg?q=70',
    'https://rukminim2.flixcart.com/image/612/612/xif0q/makeup-kit/r/b/a/face-makeup-combo-kit-of-10-beauty-face-makeup-products-ecilak-original-imaha8kjg4qjvmxs.jpeg?q=70',
    'https://rukminim2.flixcart.com/image/612/612/xif0q/pouch-potli/c/e/t/waterproof-cosmetic-bag-for-women-stylish-makeup-bag-pouch-for-original-imahgx6pft2tqzu7.jpeg?q=70',
    'https://rukminim2.flixcart.com/image/612/612/xif0q/shopsy-lip-balm/a/r/7/7-lip-cheek-tint-natural-make-up-blend-in-3-in-1-lips-cheek-and-original-imagt99skr5yrgch.jpeg?q=70'
  ];

  final List<String> earlyBird = [
    'https://rukminim3.flixcart.com/image/850/1000/xif0q/dress/4/k/e/l-lw-9102-w-tilton-original-imagh2whhtvm6dxs.jpeg?q=90&crop=false',
    'https://rukminim2.flixcart.com/image/368/490/xif0q/shoe/p/b/a/6-rng-854-beige-6-bruton-beige-resized-2-original-imahbgyzxr6ygvye.jpeg?q=90&crop=false',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPfd-mdXsjqe2N-B_9SUq1YdP8P2jbRz_9gg&s',
    'https://images.jdmagicbox.com/quickquotes/images_main/women-s-punjabi-suit-2008710031-arehc47s.jpg',
    'https://sc04.alicdn.com/kf/H54a3b0bcab1b4cf5a8fe6fb055b24ed2V.jpg',
    'https://assets.myntassets.com/dpr_1.5,q_30,w_400,c_limit,fl_progressive/assets/images/23225472/2023/9/20/c3e72204-57aa-4da5-9b58-ac1c7c6bacdf1695211674838-Crocs-Men-Sandals-1271695211674528-1.jpg',
    'https://www.veromoda.in/cdn/shop/files/901817701_3_fc976a21-7db6-4529-8127-ee912e366e98.jpg?v=1750834915&width=2048',
    'https://images.cbazaar.com/images/black-silk-embroidered-sequins-kurta-pyjama-kpmsc3626-u.jpg',
    'https://www.giva.co/cdn/shop/articles/1_524_-min.jpg?v=1726059695',
    'https://5.imimg.com/data5/SELLER/Default/2024/1/379868794/PW/PB/OS/3678405/whatsapp-image-2023-12-20-at-2-50-38-pm-1-500x500.jpeg'
  ];

  void initState() {

    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3),(_){
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      // When reaching the duplicate (last index), reset without animation
      if (_currentPage == _loopImages.length - 1) {
        Future.delayed(Duration(milliseconds: 500), () {
          _pageController.jumpToPage(0);
          _currentPage = 0;
        });
      };
      // _pageController.animateToPage(_currentPage,
      //     duration: Duration(milliseconds: 500),
      //     curve: Curves.easeInOut
      // );
    });
  }

  void dispose(){
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Widget clip({double n = 15,String imgAsset=""}){
    return ClipRRect(
        borderRadius: BorderRadius.circular(n),
        child: Image.asset(
            imgAsset,
            // fit: BoxFit.cover,
        )
    );
  }

  Widget clip1({double n = 15,String imgAsset = ""}){
    return ClipRRect(
        borderRadius: BorderRadius.circular(n),
        child: Image.network(
            imgAsset,
          fit: BoxFit.cover,
        )
    );
  }

  Widget container1({String imgAsset="",String tx1 = "",String tx2 = ""}){
    return Container(
      height: 140,
      width: 100,
      // color: Colors.grey,
      // margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Container(
              height: 120,
              decoration: Decorations.deco1(color: Colors.grey,n: 10),
              child: Column(
                children: [
                  Container(
                    height : 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                      child: Image.network(
                        imgAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                      color:Colors.deepOrange.shade400,
                    ),

                    child: Center(child: Text(tx1,style: TextStyle(color: Colors.white),)),
                  )
                ],
              )
          ),
          Text(tx2,style: TextStyle(fontSize: 11),)
        ],
      ),
    );
  }

  Widget container2({String imgAsset = "",String tx1 = "",Color color = Colors.white}){
    return Container(
      height: 55,
      width: 75,
      decoration:Decorations.deco1(n: 15,color:color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(2),
            height: 30,
            width: 90,
            child: clip(n: 15,imgAsset: imgAsset),
          ),
          Text(tx1,style: Themes.st1,)

        ],
      ),
    );
  }

  Widget container3({double width = 0,String title = "",String c1i = "",String c1tx1 = "",String c1tx2 = "",String c2i = "",String c2tx1 = "",String c2tx2 = "",String c3i = "",String c3tx1 = "",String c3tx2 = "",String c4i = "",String c4tx1 = "",String c4tx2 = ""}){
    return Container(
      width: width*0.9,
      height: 550,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: Decorations.deco1(color: Colors.orangeAccent.shade100 ,n: 10),
      child: Container(
        height: 530,
        margin: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Container(
                  height: 23,
                  width: 38,
                  decoration: Decorations.deco1(color: Colors.black,n: 25),
                  child: Center(
                    child: Icon(Icons.arrow_forward,color: Colors.white,size: 20,),
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(
              height: 490,
              // margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: Decorations.deco1(color: Colors.white,n: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin :EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        container4(width: width,imgAsset: c1i,tx1: c1tx1,tx2: c1tx2),
                        container4(width: width,imgAsset: c2i,tx1: c2tx1,tx2: c2tx2),
                      ],
                    ),
                  ),
                  Container(
                    margin :EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        container4(width: width,imgAsset: c3i,tx1: c3tx1,tx2: c3tx2),
                        container4(width: width,imgAsset: c4i,tx1: c4tx1,tx2: c4tx2),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget container4({double width = 0,String imgAsset ="",String tx1 = "",String tx2 = ""}){
    return Container(
      height : 235,
      width: width*0.38,
      decoration: Decorations.deco1(n: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height : 200,
              decoration: Decorations.deco1(n: 10),
              child: clip1(n: 15,imgAsset: imgAsset)
          ),
          Text(tx1,style: TextStyle(fontSize: 12)),
          Text(tx2,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),)
        ],
      ),
    );
  }

  Widget container5({double width = 0,String imgAsset="",String tx1 = "",String tx2 = ""}){
    return Container(
      width: width*32,
      // color: Colors.grey,
      // margin: EdgeInsets.symmetric(horizontal: 1),
      child: Column(
        children: [
          Container(
              height: 140,
              width: width *0.3,
              decoration: Decorations.deco1(color: Colors.grey,n: 10),
              child: Column(
                children: [
                  Container(
                    height : 120,
                    width: width *0.3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                      child: Image.network(
                        imgAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: width *0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                      color:Colors.green,
                    ),

                    child: Center(child: Text(tx1,style: TextStyle(color: Colors.white),)),
                  )
                ],
              )
          ),
          Text(tx2,style: TextStyle(fontSize: 12),)
        ],
      ),
    );
  }

  Widget container6({double width =0,String title = "",List<String>? img}){
    return Container(
      height: 220,
      width: width * 0.9,
      decoration: Decorations.deco1(color: Colors.greenAccent.shade100,n: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Container(
            margin: EdgeInsets.only(left: 12),
              child: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
          ),
          SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
                itemCount: img!.length,
                padding: const EdgeInsets.only(left: 13, right: 16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.5,
                ),
                scrollDirection: Axis.horizontal,

                itemBuilder: (context,index){
                  return container5(width: width,imgAsset: img![index],tx1:'Under ₹799' ,tx2: 'Run in comfort');
                }
            ),
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return DefaultTabController(
        length: 9,
        child: Scaffold(
          body: NestedScrollView(
              headerSliverBuilder: (context,innerBoxIsScrolled){
                return [

                  SliverAppBar(
                    expandedHeight: 230,
                    pinned: true,
                    backgroundColor: Themes.c1,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Column(

                        children: [

                          // const SizedBox(height: kToolbarHeight),
                          SizedBox(height: 30,),

                          Container(
                            height: 70,
                            width: width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                container2(imgAsset:'assets/flipkartlogo.jpg',tx1:'Flipkart' ,color: Colors.yellow.shade400 ),
                                container2(imgAsset: 'assets/21min.jpg',tx1: 'Minutes'),
                                container2(imgAsset: 'assets/travel.jpg',tx1: 'Travel'),
                                container2(imgAsset: 'assets/grosary.jpg',tx1: 'Grocery'),

                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                              height: 28,
                              width: width * 0.9,
                              decoration: Decorations.deco1(color:Colors.black38 ,n: 8),
                              child: Row(
                                children: [
                                  SizedBox(width: 3,),
                                  Icon(Icons.location_city,color: Themes.iconColor),
                                  SizedBox(width: 6,),
                                  Text('Location',style: TextStyle(color: Themes.iconColor),),
                                  SizedBox(width: width * 0.57,),
                                  Icon(Icons.arrow_drop_down,color: Themes.iconColor,)
                                ],
                              )
                          ),
                          SizedBox(height: 13,),
                        ],
                      ),
                    ),

                    bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(95),
                        child: Column(
                          children: [
                            Container(
                              height: 45,
                              width: width * 0.9,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                  Expanded(
                                    child: TextField(
                                      decoration: Decorations.inputdeco(),
                                    ),
                                  ),
                                  SizedBox(width: 7,),
                                  Icon(Icons.qr_code_scanner, size: 32,color: Themes.iconColor,)
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width,
                              child: Align(
                                alignment: Alignment.centerLeft,



                                  child: TabBar(
                                      isScrollable: true,
                                      tabAlignment: TabAlignment.start,
                                      padding: EdgeInsets.zero,
                                      labelColor: Colors.white,
                                      indicator: UnderlineTabIndicator(
                                        borderSide: BorderSide(
                                          width: 6,
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        insets: EdgeInsets.symmetric(horizontal: 10),
                                      ),
                                      unselectedLabelColor: Colors.white,
                                      tabs: [
                                        Tab(
                                          icon: Icon(Icons.person_outline,),
                                          text: 'For You',
                                        ),
                                        Tab(
                                          icon: Icon(Icons.checkroom_outlined),
                                          text: 'Fashion',
                                        ),
                                        Tab(
                                          icon: Icon(Icons.smartphone_outlined),
                                          text: 'Mobiles',
                                        ),
                                        Tab(
                                          icon: Icon(Icons.brush),
                                          text: 'beauty',
                                        ),
                                        Tab(
                                          icon: Icon(Icons.laptop_outlined),
                                          text: 'Electrn...',
                                        ),Tab(
                                          icon: Icon(Icons.toys_outlined),
                                          text: 'Toys',
                                        ),Tab(
                                          icon: Icon(Icons.sports_cricket_outlined,),
                                          text: 'Sports',
                                        ),Tab(
                                          icon: Icon(Icons.book_online,),
                                          text: 'Books',
                                        ),
                                        Tab(
                                          icon: Icon(Icons.chair_alt_outlined,),
                                          text: 'Furniture',
                                        ),
                                      ]
                                  ),

                              ),
                            ),
                          ],
                        )
                    ),

                  )
                ];
              },
              body: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(

                    children: [
                        Container(
                          height: 180,
                          child: PageView.builder(
                              controller: _pageController,
                              itemCount: _loopImages.length,
                              itemBuilder: (context,index){
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                  child: clip1(n: 10,imgAsset: _loopImages[index]),
                                );
                              }
                          ),

                        ),
                      Container(
                        height: 150,
                        width: width*0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            container1(imgAsset: 'https://rukminim2.flixcart.com/image/612/612/xif0q/shoe/e/a/f/-original-imagg6qyycftfm96.jpeg?q=70',tx1:'Under ₹799' ,tx2: 'Run in comfort'),
                            container1(imgAsset: 'https://rukminim2.flixcart.com/image/612/612/xif0q/energy-sport-drink-mix/g/8/c/-original-imahyws9wpnhtzzz.jpeg?q=70',tx1:'Up to 10% off',tx2:'Nutritional drink'  ),
                            container1(imgAsset:'https://rukminim2.flixcart.com/image/612/612/xif0q/jean/w/g/5/28-mx84c-marsh-x-original-imagh8kragfztm3h.jpeg?q=70',tx1: 'Under ₹319',tx2: 'Run in comfort' ),

                          ],
                        ),
                      ),
                      container3(width: width,title: "Top Selection",
                          c1i: 'https://rukminim2.flixcart.com/image/612/612/xif0q/smartwatch/h/c/0/-original-imahcf2uyr59xxff.jpeg?q=70',c1tx1: 'Top Picks',c1tx2: 'Special offer',
                          c2i: 'https://rukminim2.flixcart.com/image/612/612/xif0q/pendant-locket/b/d/q/-original-imahftfbus65gm5c.jpeg?q=70',c2tx1: 'Explore Now',c2tx2: 'Top Rated',
                          c3i: 'https://rukminim2.flixcart.com/image/612/612/xif0q/shopsy-remote-control-toy/w/z/d/friction-powered-police-car-toy-for-kids-with-pull-back-action-3-original-imahg2rfgvcnpjhb.jpeg?q=70',c3tx1: 'Grab Now',c3tx2: 'Up to 90% off',
                          c4i: 'https://rukminim2.flixcart.com/image/612/612/xif0q/office-study-chair/d/j/c/1-teak-sagun-58-42-ox-29-beaatho-121-92-original-imahgdxfbxbhxjbj.jpeg?q=70',c4tx1: 'Top Collection',c4tx2: 'Top Rated'
                      ),
                      SizedBox(height: 15),
                      container6(width: width,title:"Shop before the sale !",img: topDeals),
                      SizedBox(height: 15,),
                      container3(width: width,title: "In demand",
                          c1i: 'https://rukminim2.flixcart.com/image/420/420/xif0q/jacket/9/3/p/xl-1-no-mt2-jkt-arrow-print-ice-blue-white-motrex-original-imahgnjm9qmkzfwz.jpeg?q=60',c1tx1: 'Top Picks',c1tx2: 'Special offer',
                          c2i: 'https://rukminim2.flixcart.com/image/420/420/kwdv3bk0/cap/m/5/p/free-dual-cap-5-denolix-original-imag92rzvdd3a5qz.jpeg?q=60',c2tx1: 'Explore Now',c2tx2: 'Top Rated',
                          c3i: 'https://rukminim2.flixcart.com/image/420/420/xif0q/slipper-flip-flop/4/i/c/8-eagle-f-b-black-06-cloker-black-original-imahgphm8hznjvdg.jpeg?q=60',c3tx1: 'Grab Now',c3tx2: 'Up to 90% off',
                          c4i: 'https://rukminim2.flixcart.com/image/420/420/xif0q/home-temple/s/x/d/t1white-hoodwin-original-imah99vgphekyteg.jpeg?q=60',c4tx1: 'Top Collection',c4tx2: 'Top Rated'
                      ),
                      SizedBox(height: 6,),
                      container3(width: width,title: "Best Deals on Furniture",
                          c1i: 'https://rukminim2.flixcart.com/image/420/420/xif0q/collapsible-wardrobe/2/w/x/280-carbon-steel-570-1-4-eem-4-firozi-eemway-firozi-730-original-imaghtr8aghtugdf.jpeg?q=60',c1tx1: 'Top Picks',c1tx2: 'Special offer',
                          c2i: 'https://rukminim2.flixcart.com/image/420/420/knunf680/fruit-vegetable-basket/6/s/d/square-pipe-fruit-and-vegetable-trolly-4-layer-kitchen-bazzar-original-imag2fhzrztzekny.jpeg?q=60',c2tx1: 'Explore Now',c2tx2: 'Top Rated',
                          c3i: 'https://rukminim2.flixcart.com/image/420/420/xif0q/shoe-rack/4/v/5/28-55-1-2-rack-0-rke-blue-white-70-original-imahgzqggq9nn3np.jpeg?q=60',c3tx1: 'Grab Now',c3tx2: 'Up to 90% off',
                          c4i: 'https://rukminim2.flixcart.com/image/612/612/xif0q/mattress-protector/s/l/9/ev-n-terry72x72-dbr98-shreenainathfashion-original-imahg6fyzkh2kg3v.jpeg?q=70',c4tx1: 'Top Collection',c4tx2: 'Top Rated'
                      ),
                      SizedBox(height: 6,),
                      container6(width: width,title:"Upcoming deals on beauty",img: beauty),
                      SizedBox(height: 15,),
                      container3(width: width,title: "Make your home stylish",
                          c1i: 'https://rukminim2.flixcart.com/image/420/420/xif0q/wall-clock/d/x/j/wooden-wall-clock-32-5-wc331-analog-kpenterprises-20-original-imahfyyvpngfyxzt.jpeg?q=60',c1tx1: 'Top Picks',c1tx2: 'Special offer',
                          c2i: 'https://rukminim2.flixcart.com/image/400/400/xif0q/plant-sapling/r/w/r/no-biennial-yes-hybrid-grafted-guava-plant-yp399-medium-1-grow-original-imah69h8prwhg4ez.jpeg?q=70',c2tx1: 'Explore Now',c2tx2: 'Top Rated',
                          c3i: 'https://rukminim2.flixcart.com/image/400/400/xif0q/shopsy-kitchen-rack/o/p/b/value-model-2-0-kombuis-kitchenware-original-imaheufmgj6wkk2a.jpeg?q=70',c3tx1: 'Grab Now',c3tx2: 'Up to 90% off',
                          c4i: 'https://rukminim2.flixcart.com/image/400/400/xif0q/shopsy-bottle/7/m/q/500-vacuum-flask-bottle-set-1-histowx-original-imahj4cgb3brdymd.jpeg?q=70',c4tx1: 'Top Collection',c4tx2: 'Top Rated'
                      ),

                  ],
                ),
              ),
              SingleChildScrollView(
                
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      height : 40,
                        padding: EdgeInsets.only(right: 135),
                        child: Text('Shopping for others?' ,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)
                    ),
                    SizedBox(height: 8,),
                    Container(
                      width: width*0.9,
                      height: 130,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            children: [
                              Container(
                                width: width*0.28,
                                height: 110,
                                decoration : BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'https://rukminim2.flixcart.com/image/480/640/xif0q/shirt/u/q/8/m-injsf-883black-indian-needle-original-imagy3ywssbdzu7h.jpeg?q=90',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text('Men'),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: width*0.28,
                                height: 110,
                                decoration : BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  // color: Colors.grey
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network('https://rukminim3.flixcart.com/image/850/1000/xif0q/dress/4/k/e/l-lw-9102-w-tilton-original-imagh2whhtvm6dxs.jpeg?q=90&crop=false',fit: BoxFit.cover,)
                                ),
                              ),
                              Text('Women'),
                            ],
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 110,
                                  width: width*0.28,
                                  decoration : BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd10MPQ13euTr0wpi2Tl1kW1hYreAe_fsI2Q&s',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text('Gen Z drips'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 13,),
                    container6(width: width,title:"Early Bird Deals !",img: earlyBird),
                  ],
                ),
              ),
              Center(child: Text('Trending Page')),
              Center(child: Text('Trending Page')),
              Center(child: Text('Trending Page')),
              Center(child: Text('Trending Page')),
              Center(child: Text('Trending Page')),
              Center(child: Text('Trending Page')),
              Center(child: Text('Trending Page')),

          ],
          )
          ),
        )
    );

  }
}
