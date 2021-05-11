import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/controllers/onBordingController.dart';

class OnBoardingPage extends StatelessWidget {
  late double _imageHeight;
  late double _imageWidth;
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      _imageHeight = MediaQuery.of(context).size.height / 100;
      _imageWidth = MediaQuery.of(context).size.width / 200 + 1;
    } else {
      _imageHeight = MediaQuery.of(context).size.height / 200 + 1;
      _imageWidth = MediaQuery.of(context).size.width / 100;
    }
    OnBoardingController _controller =
        Provider.of<OnBoardingController>(context);
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
                  onPageChanged: _controller.change,
                  itemCount: _controller.onBoardingPages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Expanded(
                            flex: 3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(200.0),
                              child: AspectRatio(
                                aspectRatio: 5 / 5,
                                child: Image.network(
                                  _controller.onBoardingPages[index].imageAsset,
                                  height: 60.0 * _imageHeight,
                                  width: 60.0 * _imageWidth,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
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
                        (index) => Container(
                              margin: const EdgeInsets.all(4),
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _controller.selectedPageIndex == index
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            )),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                    elevation: 0.0,
                    backgroundColor: Colors.lightGreen.shade200,
                    splashColor: Colors.black,
                    onPressed: () {
                      print(_imageHeight);
                      print(_imageWidth);
                      _controller.forwardAction();
                    },
                    child: Text(
                      !_controller.isLastPage ? 'Next' : 'Start',
                      style:
                          TextStyle(color: Colors.black, fontFamily: 'Bangers'),
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
