import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lrnr_demo/home/home_bloc/home_bloc.dart';
import 'package:lrnr_demo/home/widgets/custom_toogle_button.dart';
import 'package:lrnr_demo/util/console.dart';
import 'package:lrnr_demo/util/preference_manager.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({Key? key}) : super(key: key);

  static show(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black12.withOpacity(0.6),
      // Background color
      barrierDismissible: false,
      barrierLabel: 'Dialog',
      transitionDuration: Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return FilterDialog();
      },
    );
  }

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  int _currentSelection = 0;
  var queries = <String>[];
  final PreferenceManager _preferenceManager = PreferenceManager();

  _changeIndex(int index) {
    setState(() {
      _currentSelection = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _preferenceManager.readQueries().then((value) {
      setState(() {
        queries = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Filter'),
        actions: [TextButton(onPressed: () {}, child: Text('Clear All'))],
      ),
      bottomNavigationBar: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(thickness: 1, height: 0),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'))),
                  VerticalDivider(
                    thickness: 1,
                    width: 0,
                  ),
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            context
                                .read<HomeBloc>()
                                .add(FilterListing(queries));
                            _preferenceManager.saveQueries(queries);
                            Navigator.of(context).pop();
                          },
                          child: Text('Apply')))
                ],
              ),
            ),
          ],
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomToggleButton(
                title: 'Categories',
                index: 0,
                currentSelection: _currentSelection,
                onTap: (index) {
                  _changeIndex(index);
                },
              ),
              CustomToggleButton(
                title: 'States',
                index: 1,
                currentSelection: _currentSelection,
                onTap: (index) {
                  _changeIndex(index);
                },
              ),
              CustomToggleButton(
                title: 'Cities',
                index: 2,
                currentSelection: _currentSelection,
                onTap: (index) {
                  _changeIndex(index);
                },
              ),
            ],
          ),
          VerticalDivider(
            thickness: 1,
            width: 0,
          ),
          Expanded(
            child: IndexedStack(
              index: _currentSelection,
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeSuccess) {
                      return ListView.builder(
                        itemBuilder: (context, index) => FilterListItem(
                          title: state.listingModel.facets!.allAggs!.categories!
                              .all!.buckets![index].key!,
                          docCount: state.listingModel.facets!.allAggs!
                              .categories!.all!.buckets![index].docCount!,
                          isSelected: queries.contains(state
                              .listingModel
                              .facets!
                              .allAggs!
                              .categories!
                              .all!
                              .buckets![index]
                              .key!),
                          onTap: () {
                            String query = state.listingModel.facets!.allAggs!
                                .categories!.all!.buckets![index].key!;
                            setState(() {
                              queries.contains(query)
                                  ? queries.remove(query)
                                  : queries.add(query);
                              Console.log(queries);
                            });
                          },
                        ),
                        itemCount: state.listingModel.facets?.allAggs
                            ?.categories?.all?.buckets?.length,
                        shrinkWrap: false,
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                Center(
                  child: Text('State'),
                ),
                Center(
                  child: Text('Cities'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FilterListItem extends StatefulWidget {
  final String title;
  final int docCount;
  final bool isSelected;
  final Function() onTap;

  const FilterListItem(
      {Key? key,
      required this.title,
      required this.docCount,
      this.isSelected = false,
      required this.onTap})
      : super(key: key);

  @override
  State<FilterListItem> createState() => _FilterListItemState();
}

class _FilterListItemState extends State<FilterListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Row(children: [
        IgnorePointer(
          child: Checkbox(
            value: widget.isSelected,
            onChanged: (value) {},
          ),
        ),
        Expanded(
          child: Text(
            "${widget.title}  (${widget.docCount.toString()})",
          ),
        )
      ]),
    );
  }
}
