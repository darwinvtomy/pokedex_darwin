// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import '../models/pokedetail.dart';

class BasestatsCard extends StatefulWidget {
  //static const String routeName = '/material/progress-indicator';
  final List<Stats> status;
  final Color color;
  const BasestatsCard({Key key, this.status,this.color}) : super(key: key);

  @override
  _BasestatsCardState createState() => _BasestatsCardState();
}

class _BasestatsCardState extends State<BasestatsCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  // int value = 50;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
      reverseCurve: Curves.fastOutSlowIn,
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.dismissed) _controller.forward();
      });
  }

  @override
  void dispose() {
    _controller.stop();
    super.dispose();
  }

  Widget _buildIndicators(BuildContext context, Widget child) {
    List<Widget> widgets = widget.status
        .map(
          (status) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${status.stat.name}',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 10,
                        child: LinearProgressIndicator(
                            value: status.baseStat * _animation.value / 100,
                            backgroundColor: Colors.white,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(widget.color)),
                      )),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${((status.baseStat * _animation.value / 100) * 10.0).toStringAsFixed(1)}%',
                      textAlign: TextAlign.right,
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                    ),
                  ),
                ],
              ),
        )
        .toList();
    return Column(
      children: widgets
          .map<Widget>((Widget c) => Container(
              child: c,
              margin:
                  const EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0)))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: _buildIndicators,
      ),
    );
  }
}
