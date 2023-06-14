import 'package:flutter/material.dart';

const double _kScrollbarThickness = 5.0;

class CustomScrollbar extends StatefulWidget {
  final ScrollableWidgetBuilder? builder;
  final ScrollController? scrollController;

  const CustomScrollbar({
    Key? key,
    this.scrollController,
    this.builder,
  })  : super(key: key);

  @override
  _CustomScrollbarState createState() => _CustomScrollbarState();
}

class _CustomScrollbarState extends State<CustomScrollbar> {
  ScrollbarPainter? _scrollbarPainter;
  ScrollController _scrollController = ScrollController();
  Orientation? _orientation;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateScrollPainter(_scrollController.position);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollbarPainter = _buildMaterialScrollbarPainter();
  }
  @override
  void dispose() {
    _scrollbarPainter!.dispose();
    super.dispose();
  }

  ScrollbarPainter _buildMaterialScrollbarPainter() {
    return ScrollbarPainter(
      color: Colors.black.withOpacity(0.8),
      textDirection: Directionality.of(context),
      thickness: _kScrollbarThickness,
      radius: Radius.circular(20),
      fadeoutOpacityAnimation: const AlwaysStoppedAnimation<double>(1.0),
      padding: EdgeInsets.only(top:0,right:15,bottom: 5,left: 5),
    );
  }
  bool _updateScrollPainter(ScrollMetrics position) {
    _scrollbarPainter!.update(
      position,
      position.axisDirection,
    );
    return false;
  }

  @override
  void didUpdateWidget(CustomScrollbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateScrollPainter(_scrollController.position);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        _orientation ??= orientation;
        if (orientation != _orientation) {
          _orientation = orientation;
          _updateScrollPainter(_scrollController.position);
        }
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) =>
              _updateScrollPainter(notification.metrics),
          child: CustomPaint(
            painter: _scrollbarPainter,
            child: widget.builder!(context, _scrollController),
          ),
        );
      },
    );
  }
}

