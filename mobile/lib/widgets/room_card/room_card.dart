import 'package:flutter/material.dart';
import 'package:foodybite_app/shared/store.dart';
import 'package:foodybite_app/shared/models.dart';
import 'package:foodybite_app/widgets/room_card/room_info.dart';
import 'package:foodybite_app/widgets/room_card/room_expanded_info.dart';

class RoomCard extends StatefulWidget {
  final int page;
  final Room room;
  final bool isActive;

  RoomCard({Key key, this.page, @required this.room, this.isActive = false})
      : assert(page != null),
        assert(room != null),
        super(key: key);

  _RoomCardState createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _scaleController;
  Animation<double> _scaleAnimation;

  EdgeInsets cardMargin = EdgeInsets.only(top: 90.0);

  double startDragY;
  double dragOffset;
  double dragOffsetY = 0.0;
  double dragClampUp = -0.09;
  double dragClampDown = 0.0;

  bool isExpanded = false;

  Store _store = Store();

  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..addListener(() {
        setState(() {
          dragOffsetY = dragOffset;
          if (dragOffsetY < -30) {
            cardMargin = EdgeInsets.only(
                top: 60.0,
                left: 20.0,
                right: 20.0,
                bottom: (dragOffsetY * (-4.0)));
            isExpanded = true;
            _store.onRoomExpanded(widget.page, isExpanded);
          } else {
            cardMargin = EdgeInsets.only(
                top: 90.0, left: 0.0, right: 0.0, bottom: dragOffsetY * (-1));
            isExpanded = false;
            _store.onRoomExpanded(widget.page, isExpanded);
          }
        });
      });

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    )..addListener(() => setState(() {}));
    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double top = widget.isActive ? 25 : 60;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top, bottom: 30.0, left: 8, right: 8),
      child: StreamBuilder(
        stream: _store.roomController.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var currentPage =
              (snapshot.data != null) ? snapshot.data.currentPage : 0;
          var _isExpanded =
              (snapshot.data != null) ? snapshot.data.isExpanded : false;
          return AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: (widget.page != currentPage && _isExpanded) ? 0.0 : 1.0,
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  RoomExpandedInfo(
                    room: widget.room,
                    animation: _scaleAnimation,
                  ),
                  Transform.translate(
                    offset: Offset(0.0, dragOffsetY),
                    child: RoomInfo(
                      room: widget.room,
                      isActive: widget.isActive,
                      isExpanded: isExpanded,
                      margin: cardMargin,
                      onTap: () {
                        _store.onRoomExpanded(currentPage, false);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _scaleController.dispose();
  }
}
