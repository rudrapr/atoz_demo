import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lrnr_demo/home/models/listing_model.dart';

class ListingItem extends StatelessWidget {
  final Data data;

  const ListingItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xffF3F4F6),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data.sSource!.averageRating!.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    VerticalDivider(
                      color: Colors.white,
                      thickness: 1.5,
                    ),
                    Text(
                      '${data.sSource!.totalReview} Review',
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 100,
                width: 100,
                imageUrl: data.sSource!.logo!,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 4),
            child: Text(
              data.sSource!.name!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              data.sSource!.address!,
              style: TextStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              data.sSource!.description!,
              style: TextStyle(
                  color: Colors.grey.withOpacity(0.9),
                  fontWeight: FontWeight.w300),
              maxLines: 8,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 36),
            child: Text('18d ago'),
          )
        ],
      ),
    );
  }
}
