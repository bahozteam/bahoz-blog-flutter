import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_svg/svg.dart';
import '../models/slider_model.dart';

class BahozSlider extends StatefulWidget {
  const BahozSlider({super.key});

  @override
  State<BahozSlider> createState() => _BahozSliderState();
}

int pageIndex = 0;
double dotIndex = 0;

class _BahozSliderState extends State<BahozSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CarouselSlider.builder(
          itemCount: SliderModel.items.length,
          itemBuilder: (context, index, realindex) {
            return ClipRRect(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 7),
                decoration: BoxDecoration(
                  color: Color(0xFFEBEBEB),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        SliderModel.items[index].image,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: SpinKitDualRing(
                              lineWidth: 3.5,
                              size: 28.0,
                              color: Color(0xFF159F91),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10.0,
                            sigmaY: 10.0,
                          ),
                          child: Container(
                            height: 110,
                            padding: EdgeInsets.all(24),
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: GlassSaveButton(),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 110,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/img_home/noise.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 81,
                      right: 16,
                      child: Text(
                        SliderModel.items[index].tag,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 34,
                      right: 16,
                      child: SizedBox(
                        width: 264,
                        height: 40,
                        child: AutoSizeText(
                          SliderModel.items[index].title,
                          minFontSize: 12,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'IranSans-bold',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 11,
                      right: 18,
                      child: Text(
                        SliderModel.items[index].date +
                            '   •   ' +
                            'خواندن ' +
                            SliderModel.items[index].timeRead,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                pageIndex = index;
                dotIndex = pageIndex.toDouble();
              });
            },
            height: 338,
            padEnds: true,
            pageSnapping: true,
            enlargeCenterPage: false,
            enableInfiniteScroll: false,
          ),
          //--------------------------
        ),
        SizedBox(height: 18),
        Container(
          height: 13,
          width: SliderModel.items.length * 12 + 12,
          decoration: BoxDecoration(
            color: Color(0xFFEFEFEF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: DotsIndicator(
              dotsCount: SliderModel.items.length,
              position: dotIndex,
              decorator: DotsDecorator(
                spacing: EdgeInsets.symmetric(horizontal: 3),
                size: Size.square(7.0),
                activeSize: Size.square(7.0),
                color: Color(0xFFCDCCCD), // Inactive color
                activeColor: Color(0xFF159F91),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class GlassSaveButton extends StatefulWidget {
  @override
  State<GlassSaveButton> createState() => _GlassSaveButtonState();
}

class _GlassSaveButtonState extends State<GlassSaveButton> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSaved = !isSaved;
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: Container(
            width: 36.0,
            height: 36.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 0.7,
              ),
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.26),
                  Colors.white.withOpacity(0.1),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: isSaved
                  ? SvgPicture.asset('assets/icons/icn_home/saved.svg')
                  : SvgPicture.asset('assets/icons/icn_home/save.svg'),
            ),
          ),
        ),
      ),
    );
  }
}
