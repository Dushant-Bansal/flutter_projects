import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:travel_app/model/data.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.data});

  final Data data;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              _buildCarousel(),
              Positioned(
                left: 30,
                bottom: 30,
                width: 2 * size.width / 3,
                child: Text(
                  widget.data.bannerTitle,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const Positioned(
                left: 30,
                top: 50,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.black87,
                    size: 40.0,
                  ),
                ),
              ),
              const Positioned(
                right: 30,
                top: 50,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.search_rounded,
                    color: Colors.black87,
                    size: 30.0,
                  ),
                ),
              ),
              Positioned(
                left: size.width / 2.2,
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      widget.data.bannerImages.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                                .withOpacity(index == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Align(alignment: Alignment.centerLeft, child: _buildRating(30.0)),
          _buildDescription(context),
          const SizedBox(height: 8.0),
          Row(
            children: [
              const SizedBox(width: 20.0),
              Text(
                'Popular Treks',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
          _buildTreks(context),
        ],
      ),
    );
  }

  Padding _buildDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.data.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          for (String detail in widget.data.details)
            ListTile(
              dense: true,
              leading:
                  const Icon(Icons.circle, size: 5.0, color: Color(0xFF6A6767)),
              title:
                  Text(detail, style: Theme.of(context).textTheme.titleMedium),
              minLeadingWidth: 0,
            )
        ],
      ),
    );
  }

  Padding _buildRating(double size) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GFRating(
        onChanged: (_) {},

        value: widget.data.rating - 0.01, // Fills complete star if value has .5
        filledIcon: Icon(
          Icons.star_rounded,
          color: const Color(0xFFF0D15D),
          size: size,
        ),
        halfFilledIcon: Icon(
          Icons.star_half_rounded,
          color: const Color(0xFFF0D15D),
          size: size,
        ),
        color: const Color(0xFFF0D15D),
        allowHalfRating: true,
      ),
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider.builder(
      carouselController: _controller,
      itemCount: widget.data.bannerImages.length,
      itemBuilder: (_, index, pageIndex) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              image: NetworkImage(widget.data.bannerImages[index]),
              fit: BoxFit.fill,
            ),
          ),
        );
      },
      options: CarouselOptions(
          viewportFraction: 1,
          aspectRatio: 7 / 5,
          scrollDirection: Axis.horizontal,
          autoPlay: true,
          onPageChanged: (i, reason) {
            setState(() {
              index = i;
            });
          }),
    );
  }

  Widget _buildTreks(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.data.bannerImages.length,
      itemBuilder: (_, index, pageIndex) {
        return Stack(
          children: [
            Container(
              margin:
                  const EdgeInsets.only(right: 40.0, top: 20.0, bottom: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image:
                      NetworkImage(widget.data.popularTreks[index].thumbnail),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.popularTreks[index].title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(Icons.star,
                          size: 20,
                          color: index == 4 ? Colors.white : Color(0xFFF0D15D)),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
      options: CarouselOptions(
        viewportFraction: 0.55,
        enableInfiniteScroll: false,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
