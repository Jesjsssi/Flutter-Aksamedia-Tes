import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(BeautySetApp());
}

class BeautySetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BeautySetPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}

class BeautySetPage extends StatefulWidget {
  @override
  _BeautySetPageState createState() => _BeautySetPageState();
}

class _BeautySetPageState extends State<BeautySetPage> {
  bool _isAppBarVisible = true;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: _isAppBarVisible
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              actions: [
                Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/import.svg', 
                        color: Colors.white, 
                        height: 24, 
                        width: 24, 
                      ),
                      onPressed: () {
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/cart.svg', 
                        color: Colors.white, 
                        height: 24, 
                        width: 24, 
                      ),
                      onPressed: () {
                       
                      },
                    ),
                  ],
                ),
              ],
            )
          : null,
      body: Stack(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.grey[200],
            child: PageView(
              controller: _pageController,
              children: [
                Image.asset('assets/produk1.png', fit: BoxFit.cover),
                Image.asset('assets/produk1.png', fit: BoxFit.cover),
                Image.asset('assets/produk1.png', fit: BoxFit.cover),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  width: _currentPage == index ? 12.0 : 8.0,
                  height: _currentPage == index ? 12.0 : 8.0,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.white : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            
          ),
          
          NotificationListener<DraggableScrollableNotification>(
            onNotification: (notification) {
              if (notification.extent > 0.75 && _isAppBarVisible) {
                setState(() {
                  _isAppBarVisible = false;
                });
              } else if (notification.extent <= 0.75 && !_isAppBarVisible) {
                setState(() {
                  _isAppBarVisible = true;
                });
              }
              return true;
            },
            child: DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.7,
              maxChildSize: 1.0,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFECE806),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "NEW ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "Product Baru",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20),
                                        ),
                                      ),
                                      builder: (context) {
                                        return Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  IconButton(
                                                    icon: Icon(Icons.close),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  Text(
                                                    'Bagikan Produk',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Divider(),
                                              ListTile(
                                                title: Text('Teks dan Link'),
                                                onTap: () {
                                                  
                                                },
                                              ),
                                              Divider(),
                                              ListTile(
                                                title: Text('Gambar'),
                                                onTap: () {
                                                 
                                                },
                                              ),
                                              SizedBox(height: 150),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: SvgPicture.asset(
                                    'assets/share.svg', 
                                    height: 24,
                                    width: 24,
                                    color: Colors
                                        .black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Beauty Set by Irvie",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              "Irvie group official",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Rp178.000",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "Harga Customer",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 40,
                                  color: Colors.grey[400],
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Rp142.400",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "Harga Reseller",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Container(
                              width: MediaQuery.of(context).size.width -
                                  32, 
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                color: Color(0xFFECE806),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      10), 
                                  bottomRight: Radius.circular(
                                      10), 
                                ),
                              ),
                              child: Center(
                                child: RichText(
                                  textAlign: TextAlign
                                      .center, 
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black, 
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(text: "Komisi "),
                                      TextSpan(
                                        text: "Rp35.600",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(text: " (20%)"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double
                                  .infinity,
                              child: Card(
                                color: Colors.white, 
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(
                                        0xFFE2E8F0), /
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: EdgeInsets.only(top: 14, bottom: 14),
                                elevation: 0, 
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      20), 
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 4),
                                      Text(
                                        "Ukuran",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 97, 
                                            height: 35, 
                                            child: RawChip(
                                              label: Text(
                                                'Paket 1',
                                                style: TextStyle(
                                                  color: Colors
                                                      .black,
                                                ),
                                              ),
                                              selected: true,
                                              selectedColor: Color(
                                                  0xFFE6E7E7), 
                                              backgroundColor: Color(
                                                  0xFFE6E7E7), 
                                              side: BorderSide(
                                                color: Colors
                                                    .black, 
                                                width: 2,
                                              ),
                                              showCheckmark:
                                                  false, 
                                              onSelected: (bool selected) {},
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          SizedBox(
                                            width: 97, 
                                            height: 35,
                                            child: RawChip(
                                              label: Text(
                                                'Paket 2',
                                                style: TextStyle(
                                                  color: Color(
                                                      0xFF4A4E5A), 
                                                ),
                                              ),
                                              selected: false,
                                              selectedColor: Color(
                                                  0xFFE6E7E7), 
                                              backgroundColor: Color(
                                                  0xFFE6E7E7), 
                                              side: BorderSide(
                                                color: Color(
                                                    0xFFE6E7E7), 
                                                width: 2,
                                              ),
                                              showCheckmark:
                                                  false, 
                                              onSelected: (bool selected) {},
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        "Warna",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Container(
                                            width: 44,
                                            height: 44,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors
                                                    .black, 
                                                width: 2, 
                                              ),
                                            ),
                                            child: CircleAvatar(
                                              radius:
                                                  20, 
                                              backgroundColor:
                                                  Color(0xFFDDB69A),
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Container(
                                            width: 44,
                                            height: 44,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors
                                                    .black, 
                                                width: 2,
                                              ),
                                            ),
                                            child: CircleAvatar(
                                              radius:
                                                  20, 
                                              backgroundColor: Colors.brown,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Stok: ',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '99+ pcs',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, 
                              crossAxisAlignment: CrossAxisAlignment
                                  .center,
                              children: [
                                Text(
                                  "Deskripsi",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/copy.svg', 
                                  height: 24,
                                  width: 24,
                                  color: Colors.blue, 
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              "*New Material*\nTerbuat dari bahan 100% Katun Linen yang membuat nyaman jika digunakan. Menggunakan fit Relaxed Fit.\n\nSIZE CHART RELAXED SHIRT...",
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 8),
                            Center(
                              child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisSize: MainAxisSize
                                      .min, 
                                  children: [
                                    Text(
                                      "Selengkapnya",
                                      style: TextStyle(
                                          color: Colors
                                              .blue), 
                                    ),
                                    SizedBox(
                                        width:
                                            4), 
                                    Icon(
                                      Icons
                                          .keyboard_arrow_down, 
                                      color: Colors
                                          .blue, 
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Produk lain dari Irvie group official",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.65,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                              ),
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return ProductCard(
                                  imagePath: 'assets/produk1.png',
                                  title: 'Beauty Set by Irvie',
                                  price: 'Rp142.400',
                                  isNew: index % 2 == 1,
                                );
                              },
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Produk Serupa",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.65,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                              ),
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return ProductCard(
                                  imagePath: 'assets/produk1.png',
                                  title: 'Beauty Set by Irvie',
                                  price: 'Rp142.400',
                                  isNew: index % 2 == 0,
                                );
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 20), 
                              child: Row(
                                children: [
                                  Expanded(
                                    flex:
                                        2, 
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(color: Colors.black),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8), // More rounded corners
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16,
                                            horizontal: 24), 
                                      ),
                                      child: Text("Tambahkan ke toko",
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 8),
                                  Expanded(
                                    flex:
                                        1, 
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16,
                                            horizontal:
                                                24),
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/cart.svg', 
                                        color: Colors
                                            .white, 
                                        height: 24, 
                                        width: 24, 
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final bool isNew;

  const ProductCard({
    required this.imagePath,
    required this.title,
    required this.price,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, 
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize:
            MainAxisSize.min, 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 144,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              if (isNew)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: Text(
                      "New",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "30% komisi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "Harga reseller",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(width: 15),
                    Icon(
                      Icons.store,
                      size: 12,
                      color: Colors.grey,
                    ),
                    Text(
                      " 99+ pcs",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    minimumSize: Size(88, 30),
                  ),
                  child: Center(
                    child: Text(
                      "Bagikan Produk",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
