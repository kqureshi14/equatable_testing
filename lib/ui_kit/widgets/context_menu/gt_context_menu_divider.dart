part of 'gt_context_menu.dart';

class _GTContextMenuDivider extends PopupMenuDivider {
  const _GTContextMenuDivider({Key? key}) : super(key: key);

  static const _menuDividerPadding = 15.0;
  static const _menuDividerHeight = 0.0;

  @override
  _GTContextMenuDividerState createState() => _GTContextMenuDividerState();
}

class _GTContextMenuDividerState extends State<_GTContextMenuDivider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: _GTContextMenuDivider._menuDividerPadding,
      ),
      child: GTDivider.horizontal(
        height: _GTContextMenuDivider._menuDividerHeight,
      ),
    );
  }
}
