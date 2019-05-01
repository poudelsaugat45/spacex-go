import 'package:flutter/material.dart';

/// SLIVER BAR WIDGET
/// Custom sliver app bar used in Sliver views.
/// It collapses when user scrolls down.
class SliverBar extends StatelessWidget {
  final String title;
  final Widget header;
  final num height;
  final List<Widget> actions;

  SliverBar({
    this.title,
    this.header,
    this.height = 0.3,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * height,
      actions: actions,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        // Using title clipping, because Flutter doesn't do this automatically.
        // Open issue: [https://github.com/flutter/flutter/issues/14227]
        title: ConstrainedBox(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(shadows: <Shadow>[
              Shadow(
                offset: Offset(0, 0),
                blurRadius: 4,
                color: Theme.of(context).primaryColor,
              ),
            ]),
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
        background: header,
      ),
    );
  }
}
