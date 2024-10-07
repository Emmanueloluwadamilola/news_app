import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/custom_image.dart';

class LoadingOverlay {
  BuildContext _context;

  void hide() {
    Navigator.of(_context).pop();
  }

  void showLoader() {
    showDialog(
        context: _context,
        useSafeArea: false,
        barrierDismissible: false,
        builder: (ctx) => _FullScreenLoader());
  }

  Future<T> showAndHideLoader<T>(Future<T> future) {
    showLoader();
    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
}

class _FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF3D3D3D).withOpacity(.6),
      ),
      child: Center(
        child: Container(
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: const CustomLoadingWidget()),
      ),
    );
  }
}

// class CustomLoader {
//   static loadingDialog(BuildContext context,
//       {double? progress, bool? useProgress}) {
//     return WillPopScope(
//       onWillPop: () async => true,
//       child: const CustomLoadingWidget(),
//     );
//   }
// }

class CustomLoadingWidget extends StatefulWidget {
  const CustomLoadingWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomLoadingWidgetState createState() => _CustomLoadingWidgetState();
}

class _CustomLoadingWidgetState extends State<CustomLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.65, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: blueColor,
              ),
              child: const Center(child: CustomImage(asset: imgAppLogo))),
        );
      },
    );
  }
}
