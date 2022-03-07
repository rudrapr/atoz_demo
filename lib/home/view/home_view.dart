import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lrnr_demo/home/home_bloc/home_bloc.dart';
import 'package:lrnr_demo/home/view/filter_dialog.dart';
import 'package:lrnr_demo/home/widgets/categories_item.dart';
import 'package:lrnr_demo/home/widgets/listing_item.dart';
import 'package:lrnr_demo/util/color_util.dart';
import 'package:lrnr_demo/util/console.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'images/az-logo-white.png',
            height: 55,
            width: 55,
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
          elevation: 0,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            gapPadding: 0),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        hintText:
                            "Ex: pizza, hotel, apartment, country, state, city, ",
                        fillColor: Colors.white),
                  ),
                ),
                Theme(
                  data: ThemeData(
                    primarySwatch: generateMaterialColor(Colors.black),
                  ),
                  child: Container(
                    color: Colors.white,
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                              child: TextButton.icon(
                                  onPressed: () {
                                    FilterDialog.show(context);
                                  },
                                  icon: Icon(Icons.filter_alt_outlined),
                                  label: Text('Filter'))),
                          VerticalDivider(
                            thickness: 1,
                          ),
                          Expanded(
                              child: TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.filter_alt_outlined),
                                  label: Text('Sort'))),
                          VerticalDivider(
                            thickness: 1,
                          ),
                          Expanded(
                              child: TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.location_on_outlined),
                                  label: Text('Map')))
                        ],
                      ),
                    ),
                  ),
                ),
              ])),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is HomeSuccess) {
              if (state.message != null) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message!)));
              }
            } else if (state is HomeFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is HomeSuccess) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Professional Services',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 3,
                            width: 100,
                            color: Theme.of(context).primaryColor,
                          ),
                        ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 40),
                      child: Row(children: [
                        Expanded(
                            child: Divider(
                          thickness: 1,
                        )),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'CATEGORIES',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1,
                        ))
                      ]),
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 5,
                          childAspectRatio: 2 / 2.8,
                        ),
                        itemBuilder: (context, index) => CategoriesItem(
                              data: state.categoriesModel.data![index],
                            ),
                        itemCount: state.categoriesModel.data?.length),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) => ListingItem(
                        data: state.listingModel.data![index],
                      ),
                      itemCount: state.listingModel.data!.length,
                    )
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
