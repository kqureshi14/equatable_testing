import 'package:flutter/material.dart';

import 'package:equatable_testing/services/services.dart';
import 'package:equatable_testing/setup.dart';
import 'package:equatable_testing/theme/theme.dart';
import 'package:equatable_testing/ui_kit/gt_ui_kit.dart';
import 'package:equatable_testing/ui_kit/widgets/gt_bottom_sheet_workspace_item.dart';

enum BottomSheetType {
  dateFormat,
  workspace,
  workflowActions,
}

class GTBottomSheet<T> extends StatefulWidget {
  const GTBottomSheet({
    required String bottomSheetTitle,
    required List<T> list,
    required T? selectedItem,
    BottomSheetType bottomSheetType = BottomSheetType.workspace,
    Key? key,
  })  : _bottomSheetTitle = bottomSheetTitle,
        _list = list,
        _selectedItem = selectedItem,
        _bottomSheetType = bottomSheetType,
        super(key: key);

  final String _bottomSheetTitle;
  final List<T> _list;
  final T? _selectedItem;
  final BottomSheetType _bottomSheetType;

  @override
  State<GTBottomSheet<T>> createState() => _GTBottomSheetState<T>();
}

class _GTBottomSheetState<T> extends State<GTBottomSheet<T>> {
  dynamic selectedItem;

  static const _containerHeight = 312.0;
  static const _mainSize = 16.0;

  @override
  void initState() {
    selectedItem = widget._selectedItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _appTheme = AppTheme.of(context).theme;
    final _navigator = locateService<INavigationService>();
    return Container(
      height: _containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_mainSize),
        color: _appTheme.colors.secondaryBackground,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: _mainSize,
          ),
          _getHeader(
            appTheme: _appTheme,
            navigator: _navigator,
          ),
          const SizedBox(
            height: _mainSize,
          ),
          Expanded(
            child: widget._bottomSheetType == BottomSheetType.workflowActions
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      return _itemBuilder(index, _navigator);
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: widget._list.length,
                  )
                : ListView.builder(
                    itemCount: widget._list.length,
                    itemBuilder: (context, index) {
                      return _itemBuilder(index, _navigator);
                    },
                  ),
          ),
          const SizedBox(
            height: _mainSize,
          )
        ],
      ),
    );
  }

  Widget _itemBuilder(int index, INavigationService navigator) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedItem = widget._list[index];
        });
        navigator.pop(selectedItem);
      },
      child: _getChild(widget._list[index]),
    );
  }

  Widget _getChild(dynamic item) {
    switch (widget._bottomSheetType) {
      case BottomSheetType.dateFormat:
        return BottomSheetDateFormatItem(
          isSelected: selectedItem == item,
          title: item,
        );
      case BottomSheetType.workspace:
        return BottomSheetWorkspaceItem(
          isSelected: selectedItem == item,
          title: item.name ?? '',
        );
      case BottomSheetType.workflowActions:
        return BottomSheetWfActionItem(
          isSelected: selectedItem == item,
          title: item ?? '',
        );
    }
  }

  Widget _getHeader({
    required IAppThemeData appTheme,
    required INavigationService navigator,
  }) {
    return Column(
      children: [
        Container(
          height: 4,
          width: 32,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(223, 224, 224, 1),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GTText(
              widget._bottomSheetTitle,
              color: appTheme.colors.defaultText,
              typography: TypographyFamily.headline5,
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
