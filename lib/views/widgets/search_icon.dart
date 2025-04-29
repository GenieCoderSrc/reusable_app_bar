import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_app_bar/view_models/search_field_cubit.dart';
import 'package:reusable_icon/reusable_icon.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({
    super.key,
    this.searchIcon,
    this.backIcon,
    this.iconSize,
    this.backIconPadding,
  });

  final IconData? searchIcon;
  final IconData? backIcon;
  final double? iconSize;
  final EdgeInsetsGeometry? backIconPadding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchFieldCubit, bool>(
      builder: (context, isSearching) {
        if (isSearching) {
          return Padding(
            padding: backIconPadding ?? const EdgeInsets.only(right: 8.0),
            child: InkWell(
              child: AppIcon(
                backIcon ?? Icons.cancel_schedule_send_outlined,
                size: iconSize,
              ),
              onTap: () => context.read<SearchFieldCubit>().toggleSearchField(),
            ),
          );
        }
        return IconButton(
          icon: Icon(searchIcon ?? Icons.search),
          onPressed: () => context.read<SearchFieldCubit>().toggleSearchField(),
        );
      },
    );
  }
}
