import 'package:flutter/material.dart';
import 'package:leumart_app/pages/theme.dart';

import '../data_dummy.dart';
import '../widget/bubble_notification.dart';
import '../widget/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Header(),
              // const SizedBox(
              //   height: 10.0,
              // ),
              //* List of Banner
              SizedBox(
                height: 120.0,
                child: ListView.builder(
                  itemCount: bannerImgList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item = bannerImgList[index];
                    return _Banner(item: item);
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pilih Kategori Produk",
                      style: textStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Lihat semua",
                        style: textStyle.copyWith(
                          fontSize: 12,
                          color: primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              // * List Of Kategori
              SizedBox(
                height: 87.0,
                child: ListView.builder(
                  itemCount: kategoriProdukList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item = kategoriProdukList[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 16 : 0,
                        right: 10,
                        bottom: 3,
                      ),
                      child: _KategoriCard(item: item),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Promo Produk",
                      style: textStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Lihat semua",
                        style: textStyle.copyWith(
                          fontSize: 12,
                          color: primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 227.0,
                child: ListView.builder(
                  itemCount: produkList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item = produkList[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 16 : 0,
                        right: 10,
                        bottom: 5,
                      ),
                      child: ProductCard(item: item),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Promo Terbaru",
                      style: textStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Lihat semua",
                        style: textStyle.copyWith(
                          fontSize: 12,
                          color: primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 227.0,
                child: ListView.builder(
                  itemCount: produkTerbaruList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item = produkTerbaruList[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 16 : 0,
                        right: 10,
                        bottom: 5,
                      ),
                      child: ProductCard(item: item),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class _KategoriCard extends StatelessWidget {
  const _KategoriCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Map item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(1, 2),
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(6),
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/${item['imgUrl']}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            item['kategori'],
            style:
                textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({
    Key? key,
    required this.item,
  }) : super(key: key);

  final String item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: EdgeInsets.only(
          left: bannerImgList.first == item ? 16 : 0, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        image: DecorationImage(
          image: AssetImage("assets/images/$item"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 12.0,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey[500],
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: "Cari Kategori atau Nama Produk",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
        ),
        BubbleNotification(
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            height: 28,
            width: 28,
            child: Image.asset(
              "assets/icons/cart.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
