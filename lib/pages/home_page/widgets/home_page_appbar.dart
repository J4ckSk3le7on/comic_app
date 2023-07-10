import 'package:flutter/material.dart';

enum HomeViewType {list, grid}

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget{
  final void Function(HomeViewType viewType) changeView;
  final HomeViewType currentViewType;

  const HomePageAppBar({
    Key? key,
    required this.changeView,
    required this.currentViewType
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Comic App"),
      actions: [
        IconButton(
          onPressed: () => changeView(HomeViewType.list),
          icon: const Icon(Icons.list),
          color: currentViewType == HomeViewType.list ? Colors.blue : Colors.grey,
        ),
        IconButton(
          onPressed: () => changeView(HomeViewType.grid),
          icon: const Icon(Icons.grid_3x3),
          color: currentViewType == HomeViewType.grid ? Colors.blue : Colors.grey,
        )
      ],
    );
  }

}
