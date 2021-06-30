import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pendu_customer/screens/page_shop_drop_1.dart';
import 'package:pendu_customer/models/response_login_model.dart';
import 'package:pendu_customer/utils/utils_app_bar_common.dart';
import 'package:pendu_customer/utils/utils_popup_current_location.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';


class SelectDropUpPointMapPage extends StatefulWidget {
  final  User user;
  final String token;
  final String adNotes;
  final String totalCost;
  final String pickUpLocation;
  SelectDropUpPointMapPage({@required this.user, @required this.token, @required this.adNotes, @required this.totalCost, this.pickUpLocation});
  @override
  _SelectDropUpPointMapPageState createState() => _SelectDropUpPointMapPageState(user, token , adNotes, totalCost, pickUpLocation);
}

class _SelectDropUpPointMapPageState extends State<SelectDropUpPointMapPage> {
  final  User user;
  final String token;
  final String adNotes;
  final String totalCost;
  final String pickUpLocation;
  String dropUpLocation =   '2103 N Main St, Highlands, TX, 77562';
  _SelectDropUpPointMapPageState(this.user, this.token, this.adNotes, this.totalCost, this.pickUpLocation);
  static const _initialCameraPosition = CameraPosition(target: LatLng(-33.865143, 151.209900), zoom: 11.5);
  GoogleMapController _googleMapController;
  Marker _pickUpMarker, _dropPointMarker;

  @override
  void dispose(){
    _googleMapController.dispose();
    super.dispose();
  }
  Widget _buildGoogleMap()
  { return GoogleMap(
    initialCameraPosition: _initialCameraPosition,
    zoomControlsEnabled: false,
    myLocationButtonEnabled: false,
    onMapCreated: (controller) =>  _googleMapController = controller,
    markers: {
      if(_pickUpMarker != null) _pickUpMarker,
      if(_dropPointMarker != null) _dropPointMarker,
    },
    onLongPress: _addMarker,
  );
  }
  void _addMarker(LatLng pos) {
    if (_pickUpMarker == null ||
        (_pickUpMarker != null && _dropPointMarker != null)) {
      setState(() {
        _pickUpMarker = Marker(
          markerId: const MarkerId('pickup'),
          infoWindow: const InfoWindow(title: 'Pickup Point'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          draggable: true,
          position: pos,
        );
      });
    }
    else {
      setState(() {
        _dropPointMarker = Marker(
          markerId: const MarkerId('drop'),
          infoWindow: const InfoWindow(title: 'Drop Point'),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueGreen),
          draggable: true,
          position: pos,
        );
      });
    }
  }
    Widget _buildDropUpSection() {
      return Container(
        height: 260,
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(-1, -3),
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select your drop location'),

            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Pendu.color('F1FBF5'),
                  border: Border.all(color: Pendu.color('5BDB98'))),
              child: Row(children: [
                Container(
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Pendu.color('D6D6D6')),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: SvgPicture.asset(
                      'assets/motorcycle.svg',
                      height: 20,
                      width: 20,
                      color: Pendu.color('5BDB98'),
                    )),
                Container(
                    width: 220,
                    margin: EdgeInsets.only(left: 15.0),
                    child: Text(dropUpLocation
                      ,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black),
                    ))
              ]),
            ),

            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Pendu.color('F1F1F1'),
                  border: Border.all(color: Pendu.color('F1FBF5'))),
              child: Row(children: [
                Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Pendu.color('D6D6D6')),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Icon(Icons.home, color: Pendu.color('5BDB98')),
                ),
                Container(
                    margin: EdgeInsets.only(left: 15.0),
                    width: 220,
                    child: Text(
                      pickUpLocation,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black),
                    ))
              ]),
            ),

            Spacer(),
            //BUtton
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 50,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        ShopDropPage1(user: user,
                          token: token,
                          pickUpLocation: pickUpLocation,
                          dropUpLocation: dropUpLocation,)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Pendu.color('60E99C'),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text('Confirm',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      );
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(72),
            child: AppBarCommonUtils('Select Drop Point'),
          ),
          body: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                child: _buildGoogleMap(),
              ),
              Positioned(
                top: 0,
                child: CurrentLocationPopupUtils(),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildDropUpSection()),
            ],
          ));
    }
  }
