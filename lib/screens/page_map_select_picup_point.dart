import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pendu_customer/screens/page_map_select_dropup_point.dart';
import 'package:pendu_customer/models/response_login_model.dart';
import 'package:pendu_customer/utils/utils_app_bar_common.dart';
import 'package:pendu_customer/utils/utils_popup_current_location.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';


class SelectPickupPointMapPage extends StatefulWidget {
  final  User user;
  final String token;
  final String adNotes;
  final String totalCost;
  SelectPickupPointMapPage({@required this.user, @required this.token, @required this.adNotes, @required this.totalCost});
  @override
  _SelectPickupPointMapPageState createState() => _SelectPickupPointMapPageState(user, token, adNotes,totalCost );
}

class _SelectPickupPointMapPageState extends State<SelectPickupPointMapPage> {
  final  User user;
  final String token;
  final String adNotes;
  final String totalCost;
  _SelectPickupPointMapPageState(this.user, this.token, this.adNotes, this.totalCost);
  String pickUpLocation=   '3/A Jadobpur, Abdul Goli, MD Pur, Dhaka 1204';

  static const _initialCameraPosition = CameraPosition(target: LatLng(-33.865143, 151.209900), zoom: 11.5);
  GoogleMapController _googleMapController;
  Marker _pickUpMarker;
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
  },
  onLongPress: _addMarker,
);
}
//on long press add pickup marker
void _addMarker(LatLng pos){

    setState(() {
      _pickUpMarker = Marker(
        markerId: const MarkerId('pickup'),
        infoWindow: const InfoWindow(title: 'Pickup Point'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: pos,
      );
    });


}
  Widget _buildPickUpSection(){
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
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
          Text('Select your pickup location'),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Pendu.color('F1FBF5'))),
            child: Row(children: [
              Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Pendu.color('D6D6D6')),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Icon(
                  Icons.home,
                  color: Theme.of(context).accentColor,
                ),
              ),
              SizedBox(width: 10.0),
              Container(
                  width: 210,
                  child: Text(pickUpLocation,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black),
                  ))
            ]),
          ),
          Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectDropUpPointMapPage(user: user, token: token, pickUpLocation: pickUpLocation,adNotes: adNotes,totalCost: totalCost,)),
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
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
          child: AppBarCommonUtils('Select Pickup Point'),
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
            Positioned(bottom: 15, child: _buildPickUpSection()),
          ],
        ));
  }
}
