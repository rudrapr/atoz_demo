import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image.asset(
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        gapPadding: 0
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    hintText: "Ex: pizza, hotel, apartment, country, state, city, ",
                    fillColor: Colors.white),
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.filter_list_alt),
                          label: Text('Filter'))),
                  Expanded(
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.filter_list_alt),
                          label: Text('Filter'))),
                  Expanded(
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.filter_list_alt),
                          label: Text('Filter')))
                ],
              ),
            ),
          ])),
    );
  }
}
