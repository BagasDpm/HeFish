import 'package:flutter/material.dart';

class AnimatedPageRouteLeft extends PageRouteBuilder {
  final Widget child;

  AnimatedPageRouteLeft({required this.child})
      : super(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, primaryAnimation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(
          BuildContext context,
          Animation<double> primaryAnimation,
          Animation<double> secondaryAnimation,
          Widget child) =>
      SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: const Offset(0, 0),
          ).animate(primaryAnimation),
          child: child);
}

class AnimatedPageRoutedDiagonal extends PageRouteBuilder {
  final Widget child;

  AnimatedPageRoutedDiagonal({required this.child})
      : super(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, primaryAnimation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(
          BuildContext context,
          Animation<double> primaryAnimation,
          Animation<double> secondaryAnimation,
          Widget child) =>
      SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 1),
            end: const Offset(0, 0),
          ).animate(primaryAnimation),
          child: child);
}
