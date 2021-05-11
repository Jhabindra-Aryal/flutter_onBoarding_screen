import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop_app/controllers/myClipper.dart';
import 'package:shop_app/controllers/onBordingController.dart';

class OnBoardingPage extends StatelessWidget {
  final OnBoardingController _controller = OnBoardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFD3959B), Color(0xFFBFE6BA)])),
          child: SafeArea(
            child: Stack(
              children: [
                PageView.builder(
                  controller: _controller.pageController,
                  onPageChanged: _controller.selectedPageIndex,
                  itemCount: _controller.onBoardingPages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 3,
                            child: ClipOval(
                              clipper: MyClipper(),
                              child: Image.network(
                                _controller.onBoardingPages[index].imageAsset,
                                height: 400,
                                width: 400,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text(
                                  _controller.onBoardingPages[index].title,
                                  style: TextStyle(
                                    fontFamily: 'Bangers',
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Colors.yellow,
                                        blurRadius: 0.5,
                                        offset: Offset(1, 1),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  _controller
                                      .onBoardingPages[index].description,
                                  style: TextStyle(
                                    fontSize: 15,
                                    shadows: [
                                      Shadow(
                                        color: Colors.yellow,
                                        blurRadius: 0.5,
                                        offset: Offset(0.5, 0.5),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Row(
                    children: List.generate(
                      _controller.onBoardingPages.length,
                      (index) => Obx(() {
                        return Container(
                          margin: const EdgeInsets.all(4),
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _controller.selectedPageIndex.value == index
                                ? Colors.red
                                : Colors.grey,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Obx(
                    () => FloatingActionButton(
                      elevation: 0.0,
                      backgroundColor: Colors.lightGreen.shade200,
                      splashColor: Colors.black,
                      onPressed: () {
                        _controller.fordartAction();
                      },
                      child: Text(
                        !_controller.isLastPage ? 'Next' : 'Start',
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'Bangers'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
