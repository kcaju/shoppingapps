import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapps/controller/homescreen_controller.dart';
import 'package:shoppingapps/view/product_details_screen/product_details_screen.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<HomescreenController>().getCategories();
        await context.read<HomescreenController>().getAllProducts();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // List<Map> items = [
    //   {
    //     "image":
    //         "https://images.pexels.com/photos/1337477/pexels-photo-1337477.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    //     "name": "Regular fit slogan",
    //     "price": "PKR 1,190",
    //     "rate": "4.5/5",
    //     "review": "(45 reviews)",
    //     "details":
    //         "The name says its all,the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist."
    //   },
    //   {
    //     "image":
    //         "https://images.pexels.com/photos/769732/pexels-photo-769732.jpeg?auto=compress&cs=tinysrgb&w=400",
    //     "name": "Regular fit polo",
    //     "price": "PKR 1,100 ",
    //     "rate": "4.1/5",
    //     "review": "(30 reviews)",
    //     "details":
    //         "Self design opaque casual shirt,has button placket,long regular sleeves,spread colllar."
    //   },
    //   {
    //     "image":
    //         "https://images.pexels.com/photos/6616115/pexels-photo-6616115.jpeg?auto=compress&cs=tinysrgb&w=400",
    //     "name": "Regular fit color block",
    //     "price": "PKR 1,690",
    //     "rate": "3.5/5",
    //     "review": "(40 reviews)",
    //     "details":
    //         "Bufallo checked casual shirt,has a spread collar,button placket,1 patch pocket,short regular sleeves."
    //   },
    //   {
    //     "image":
    //         "https://images.pexels.com/photos/1232459/pexels-photo-1232459.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    //     "name": "Regular fit v-neck",
    //     "price": "PKR 1,290",
    //     "rate": "2.5/5",
    //     "review": "(32 reviews)",
    //     "details":
    //         "Tartan checked opaque casual tshirt,button placket,spread collar."
    //   },
    //   {
    //     "image":
    //         "https://images.pexels.com/photos/69212/pexels-photo-69212.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    //     "name": "slim fit cotton",
    //     "price": "PKR 1,709",
    //     "rate": "5.5/5",
    //     "review": "(70 reviews)",
    //     "details": "Printed T-shirt,has a round neck,short sleeves. "
    //   },
    //   {
    //     "image":
    //         "https://images.pexels.com/photos/10948492/pexels-photo-10948492.jpeg?auto=compress&cs=tinysrgb&w=400",
    //     "name": "Checked opaque casual",
    //     "price": "PKR 1,679",
    //     "rate": "4.5/5",
    //     "review": "(45 reviews)",
    //     "details": "Tshirt for men,solid,regular length,polo collar."
    //   },
    //   {
    //     "image":
    //         "https://images.pexels.com/photos/634785/pexels-photo-634785.jpeg?auto=compress&cs=tinysrgb&w=400",
    //     "name": "Regular fit indigo",
    //     "price": "PKR 1,000",
    //     "rate": "4/5",
    //     "review": "(55 reviews)",
    //     "details":
    //         "Solid casual shirt,long sleeves,button placket,2 flap pockets."
    //   },
    //   {
    //     "image":
    //         "https://images.pexels.com/photos/1304647/pexels-photo-1304647.jpeg?auto=compress&cs=tinysrgb&w=400",
    //     "name": "Semi sheer casual",
    //     "price": "PKR 1,199",
    //     "rate": "3.5/5",
    //     "review": "(38 reviews)",
    //     "details":
    //         "Checked casual shirt,has as spread collar,long sleeves,button placket,1 patch pocket."
    //   },
    //   {
    //     "image":
    //         "https://images.pexels.com/photos/9489155/pexels-photo-9489155.jpeg?auto=compress&cs=tinysrgb&w=400",
    //     "name": "Slim spread collar",
    //     "price": "PKR 800",
    //     "rate": "2.5/5",
    //     "review": "(32 reviews)",
    //     "details":
    //         "Stripped casual shirt,has a cutaway collar,button placket,1 pocket,long sleeves."
    //   },
    //   {
    //     "image":
    //         "https://images.pexels.com/photos/2635315/pexels-photo-2635315.jpeg?auto=compress&cs=tinysrgb&w=400",
    //     "name": "Stripped cuban collar",
    //     "price": "PKR 2,000",
    //     "rate": "4.5/5",
    //     "review": "(45 reviews)",
    //     "details":
    //         "Black and red vertical stripes striped casual shirts,button placket,short sleeves."
    //   }
    // ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Discover",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w900, fontSize: 25),
        ),
        actions: [
          Stack(
            children: [
              Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 30,
              ),
              Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.black,
                  child: Text(
                    "1",
                    style: TextStyle(color: Colors.white, fontSize: 6),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: Consumer<HomescreenController>(
          builder: (context, homeProv, child) => homeProv.isCategoryLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  //main clmn
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.withOpacity(0.3)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Search anything",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6)),
                                    )
                                  ],
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(
                              Icons.filter_list,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //api integration
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Row(
                          children: List.generate(
                            homeProv.categorieslist.length,
                            (index) => Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    context
                                        .read<HomescreenController>()
                                        .getCategoryIndex(index);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        homeProv.categorieslist[index]
                                            .toString()
                                            .toUpperCase(),
                                        style: TextStyle(
                                            color: index ==
                                                    homeProv
                                                        .selectedCategoryIndex
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 20),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: index ==
                                                homeProv.selectedCategoryIndex
                                            ? Colors.black
                                            : Colors.grey),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: homeProv.isProductLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : GridView.builder(
                              padding: EdgeInsets.all(20),
                              itemCount: homeProv.productList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 350,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailsScreen(
                                                id: homeProv
                                                    .productList[index].id!),
                                      ));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(children: [
                                      Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(homeProv
                                                        .productList[index]
                                                        .image ??
                                                    "")),
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: Container(
                                          child: Icon(
                                            Icons.favorite_outline,
                                            color: Colors.black,
                                          ),
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: Offset(6, 10),
                                                    blurRadius: 10,
                                                    color: Colors.grey
                                                        .withOpacity(0.5))
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                    ]),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      homeProv.productList[index].title
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      homeProv.productList[index].price
                                          .toString(),
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                    )
                  ],
                )),
    );
  }
}
