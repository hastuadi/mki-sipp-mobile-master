import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';
import 'package:shimmer/shimmer.dart';

import '../../constant/textstyles.dart';

class ResearchLocationScreen extends StatefulWidget {
  const ResearchLocationScreen({Key? key}) : super(key: key);

  @override
  State<ResearchLocationScreen> createState() => _ResearchLocationScreenState();
}

class _ResearchLocationScreenState extends State<ResearchLocationScreen> {
  bool _loading = true;

  static const List<String> locations = [
    "Sawang aceh", "Nusa Tenggara Timur", "Pulau Seribu"
  ];

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _loading = false;
      });
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Penelitian", style: AppTextStyle.bold14),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(-6.943097, 107.633545),
                  initialZoom: 3.0,
                  interactionOptions: InteractionOptions(
                    flags: 1
                  )
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: const LatLng(5.2023, 96.9321),
                        width: 40,
                        height: 40,
                        child: GestureDetector(
                          onTap: () {

                          },
                            child: Image.asset("assets/images/general/map-marker-icon.png")
                        ),
                      ),
                    ],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: const LatLng( -8.657382, 121.079369),
                        width: 40,
                        height: 40,
                        child: GestureDetector(
                            onTap: () {

                            },
                            child: Image.asset("assets/images/general/map-marker-icon.png")
                        ),
                      ),
                    ],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: const LatLng(-5.798526, 106.507198),
                        width: 40,
                        height: 40,
                        child: GestureDetector(
                            onTap: () {

                            },
                            child: Image.asset("assets/images/general/map-marker-icon.png")
                        ),
                      ),
                    ],
                  ),
                ]
            ),
          ),
          const SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Daftar Lokasi", style: AppTextStyle.bold14Black,),
          ),
          const SizedBox(height: 24,),
          Expanded(
            child: ListView.separated(
              itemCount: _loading ? 3 : locations.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
            
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Visibility(
                      visible: !_loading,
                      replacement: Shimmer.fromColors(
                        enabled: true,
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(height: 24, decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey
                          ),),
                      ),
                      child: Text(
                        locations[index],
                        style: AppTextStyle.regular12Black,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Visibility(
                  visible: !_loading,
                  replacement: Divider(
                    color: Colors.grey.shade300,
                  ),
                  child: const Divider(),
                ),
              ),),
          )
        ],
      ),
    );
  }
}
