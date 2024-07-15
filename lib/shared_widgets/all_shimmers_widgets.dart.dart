import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/shared_widgets/container_with_decoration.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListRectangular extends StatelessWidget {
  const ShimmerListRectangular({Key? key, this.itemCount}) : super(key: key);
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: Container(
        height: Get.height,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: itemCount ?? 4,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Color.fromARGB(255, 212, 212, 212),
              child: ContainerWithDecoration(
                bottomLeft: 10,
                bottomRight: 10,
                topLeft: 10,
                topRight: 10,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 110,
                      height: 170,
                    ),
                    const SizedBox(width: 33),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerCircular extends StatelessWidget {
  const ShimmerCircular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * .052),
      child: Container(
          height: 90,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Color.fromARGB(255, 212, 212, 212),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: ContainerWithDecoration(
                    bottomLeft: 150,
                    bottomRight: 150,
                    topLeft: 150,
                    topRight: 150,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 60,
                          height: 90,
                          // width: Get.width * .9,
                          // height: Get.width * .57,
                        ),
                        const SizedBox(width: 33),
                      ],
                    ),
                  ),
                )),
          )),
    );
  }
}

class ShimmerHorizontal extends StatelessWidget {
  const ShimmerHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 15, top: 15),
      child: Container(
          height: 170,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Color.fromARGB(255, 212, 212, 212),
                child: ContainerWithDecoration(
                  bottomLeft: 10,
                  bottomRight: 10,
                  topLeft: 10,
                  topRight: 10,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 110,
                        height: 170,
                        // width: Get.width * .9,
                        // height: Get.width * .57,
                      ),
                      const SizedBox(width: 33),
                    ],
                  ),
                )),
          )),
    );
  }
}

class ShimmerRectangular extends StatelessWidget {
  const ShimmerRectangular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.only(start: 25, top: 15, end: 25),
        child: Container(
          height: 150,
          child: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Color.fromARGB(255, 212, 212, 212),
              child: ContainerWithDecoration(
                bottomLeft: 10,
                bottomRight: 10,
                topLeft: 10,
                topRight: 10,
                child: Row(
                  children: [
                    SizedBox(
                      width: 110,
                      height: 170,
                      // width: Get.width * .9,
                      // height: Get.width * .57,
                    ),
                    const SizedBox(width: 33),
                  ],
                ),
              )),
        ));
  }
}
