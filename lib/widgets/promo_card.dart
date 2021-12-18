import 'package:boz_yap_sifirla/widgets/sabitler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PromoCard extends StatelessWidget {
  static final List<Color> bgColors = [primaryPromoColor, secondaryPromoColor];
  String title;
  String subtitle;
  String caption;
  String tag;
  String imagePath;
  String? co2;
  String? seker;
  String? vitaminA;

  PromoCard({
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.caption,
    required this.imagePath,
    required this.seker,
  });
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.65,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 8,
                    top: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 5, top: 9, right: 5, bottom: 5),
                        child: Text(
                          subtitle,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 5, top: 9, right: 5, bottom: 5),
                        child: Text(
                          "1 pakette bulunan içerikler:",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(width: 2, color: Colors.teal),
                            borderRadius: BorderRadius.circular(3)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildCardInfoRow(
                                iconsrc: 'assets/sugar-cubes.svg',
                                ttext: seker.toString()),
                            SizedBox(
                              height: 3,
                            ),
                            buildCardInfoRow(
                                iconsrc: 'assets/proteins.svg',
                                ttext: "15 grams"),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              AspectRatio(
                aspectRatio: 0.81,
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildCardInfoRow({required String iconsrc, required String ttext}) {
    return Row(
      children: [
        SvgPicture.asset(
          iconsrc,
          height: 25,
          width: 25,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          ttext,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
