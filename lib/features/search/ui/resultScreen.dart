import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:final_project/features/favorite/data/model/myfavorites_response.dart';
import '../../cities/logic/cities_cubit.dart';


class FilterScreen extends StatefulWidget {
  const FilterScreen();

  @override
  State<FilterScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<FilterScreen> {
  TextEditingController searchTextController = TextEditingController();
  bool showFilters = false;
  dynamic _maxPriceValue=0.0;
  dynamic _minPriceValue=0.0;
  dynamic _minimumAreaSize=0.0;
  dynamic _maxAreaSize=0.0;
  double _bedrooms=0.0;
  dynamic _bathrooms =0.0;
  dynamic _level =0.0;

  String? _selectedOption1;
  String? _selectedOption2;
  String? _selectedOption3;
  String? _selectedOption4;

  String hintText = "";
  List<City> citiesModel=[];
  List<String> cities=[];

  String? cityId;
  @override
  void initState() {
    print("////");
    context.read<CitiesCubit>().getListOfCities().then((val){
      citiesModel=val;
      for (var e in citiesModel) {

        cities.add(e.nameAr.toString());
        setState(() {
        });

      }});


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 234, 225),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 234, 225),
      ),
      body: SingleChildScrollView(
        child: Column(
                  children: [
        
        
                    Padding(
        padding: EdgeInsets.only(left: 15.0.h, top: 10.h, right: 7.8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Filter By",
              style: TextStyles.font35BlackBold,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.r),
                    color: ColorsManager.green.withOpacity(0.5)),
                child: IconButton(
                    onPressed: () {
        
                    },
                    icon: const Icon(
                      IconlyBold.filter,
                      size: 20,
                    )))
          ],
        ),
                    ),
                    const SizedBox(
        height: 20,
                    ),
                    Wrap(
        spacing: 2,
        runSpacing: 5,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(10)),
            child: DropdownButton<String>(
              hint: const SizedBox(
                  width: 50,
                  child: Text(
                    "Transaction Type",
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w700),
                  )),
              padding: EdgeInsets.all(2),
              underline: SizedBox(),
              value: _selectedOption2,
              onChanged: (newValue) {
                setState(() {
                  _selectedOption2 = newValue;
                });
              },
              items: _options2.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
          ),
          Container(
        
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(10)),
            child: DropdownButton<String>(
              hint: const SizedBox(width: 70, child: Text("Property Type",style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w700),
              )),
              padding: EdgeInsets.all(2),
              underline: SizedBox(),
              value: _selectedOption3,
              onChanged: (newValue) {
                setState(() {
                  _selectedOption3 = newValue;
                });
              },
              items: _options3.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
          ),
        
        
        
          Container(
        
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(10)),
            child: DropdownButton<String>(
              hint: const SizedBox(width: 70, child: Text("Furnished",style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w700),
              )),
              padding: const EdgeInsets.all(2),
              underline: const SizedBox(),
              value: _selectedOption4,
              onChanged: (newValue) {
                setState(() {
                  _selectedOption4 = newValue;
                });
              },
              items: _options4.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
          ),
        
          Container(
        
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(10)),
            child: DropdownButton<String>(
              hint: const SizedBox(width: 70,child:const Text("City",style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w600),
              )),
              padding: const EdgeInsets.all(2),
              underline: SizedBox(),
              value: _selectedOption1,
              onChanged: (newValue) {
                setState(() {
                  _selectedOption1 = newValue;
                });
                City element   = citiesModel.firstWhere((e)=>newValue==e.nameAr);
                cityId=element.id;
              },
              items: cities.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
          ),
        
        ],
                    ),
                    const SizedBox(height: 10,),
                    Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const  Text(
              "MaxPrice",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Text(
              " $_maxPriceValue\$    ",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
                    ),
                    SfSlider(
        min: 0,
        labelPlacement: LabelPlacement.betweenTicks,
        max:50000,
        stepSize: 100,
        showTicks: false,
        showLabels: false,
        edgeLabelPlacement: EdgeLabelPlacement.inside,
        showDividers: false,
        tooltipShape:const SfPaddleTooltipShape(),
        activeColor: Colors.blue,
        shouldAlwaysShowTooltip: false,
        
        tooltipTextFormatterCallback: (d,v){
        
          return "$v\$";
        },
        enableTooltip: true,
        minorTicksPerInterval: 0,
        onChanged: (dynamic val){
          setState(() {
            _maxPriceValue = val;
          });
        }, value: _maxPriceValue,
                    ),
                    Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Min Price",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            " $_minPriceValue\$    ",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
                    ),
                    SfSlider(
        min: 0,
        labelPlacement: LabelPlacement.betweenTicks,
        max:50000,
        stepSize: 100,
        showTicks: false,
        showLabels: false,
        edgeLabelPlacement: EdgeLabelPlacement.inside,
        showDividers: false,
        tooltipShape:const SfPaddleTooltipShape(),
        activeColor: Colors.blue,
        shouldAlwaysShowTooltip: false,
        
        tooltipTextFormatterCallback: (d,v){
        
          return "$v\$";
        },
        enableTooltip: true,
        minorTicksPerInterval: 0,
        onChanged: (dynamic val){
          setState(() {
            _minPriceValue = val;
          });
        }, value: _minPriceValue,
                    ),
        
                    Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Max Area Size",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Text(
            " $_maxAreaSize    ",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
                    ),
                    SfSlider(
        min: 0,
        labelPlacement: LabelPlacement.betweenTicks,
        max:20000,
        stepSize: 100,
        showTicks: false,
        showLabels: false,
        edgeLabelPlacement: EdgeLabelPlacement.inside,
        showDividers: false,
        tooltipShape:const SfPaddleTooltipShape(),
        activeColor: Colors.blue,
        shouldAlwaysShowTooltip: false,
        
        tooltipTextFormatterCallback: (d,v){
        
          return "$v Area size";
        },
        enableTooltip: true,
        minorTicksPerInterval: 0,
        onChanged: (dynamic val){
          setState(() {
            _maxAreaSize = val;
          });
        }, value: _maxAreaSize,
                    ),
                    Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Minimum Area Size",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Text(
            " $_minimumAreaSize    ",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
                    ),
                    SfSlider(
        min: 0,
        labelPlacement: LabelPlacement.betweenTicks,
        max:10000,
        stepSize: 100,
        showTicks: false,
        showLabels: false,
        edgeLabelPlacement: EdgeLabelPlacement.inside,
        showDividers: false,
        tooltipShape:const SfPaddleTooltipShape(),
        activeColor: Colors.blue,
        shouldAlwaysShowTooltip: false,
        
        tooltipTextFormatterCallback: (d,v){
        
          return "$v Area size";
        },
        enableTooltip: true,
        minorTicksPerInterval: 0,
        onChanged: (dynamic val){
          setState(() {
            _minimumAreaSize = val;
          });
        }, value: _minimumAreaSize,
                    ),
                    Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Bedrooms Number",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Text(
            " ${_bedrooms.toInt()}    ",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
                    ),
                    SfSlider(
        min: 0,
        labelPlacement: LabelPlacement.betweenTicks,
        max:20,
        interval: 30,
        stepSize: 1,
        showTicks: false,
        showLabels: false,
        edgeLabelPlacement: EdgeLabelPlacement.inside,
        showDividers: false,
        tooltipShape:const SfPaddleTooltipShape(),
        activeColor: Colors.blue,
        shouldAlwaysShowTooltip: false,
        
        tooltipTextFormatterCallback: (d,v){
        
          return "$v Bedrooms";
        },
        enableTooltip: true,
        minorTicksPerInterval: 0,
        onChanged: (dynamic val){
          setState(() {
            _bedrooms = val;
          });
        }, value: _bedrooms,
                    ),
                    Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Bathrooms Number",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Text(
            " ${_bathrooms.toInt()}    ",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
                    ),
                    SfSlider(
        min: 0,
        labelPlacement: LabelPlacement.betweenTicks,
        max:20,
        interval: 30,
        stepSize: 1,
        showTicks: false,
        showLabels: false,
        edgeLabelPlacement: EdgeLabelPlacement.inside,
        showDividers: false,
        tooltipShape:const SfPaddleTooltipShape(),
        activeColor: Colors.blue,
        shouldAlwaysShowTooltip: false,
        
        tooltipTextFormatterCallback: (d,v){
        
          return "$v Bathrooms";
        },
        enableTooltip: true,
        minorTicksPerInterval: 0,
        onChanged: (dynamic val){
          setState(() {
            _bathrooms = val;
          });
        }, value: _bathrooms,
                    ),
                    Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween
        ,
        children: [
          const Text(
            "Level",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Text(
            " ${_level.toInt()}    ",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
                    ),
                    SfSlider(
        min: 0,
        labelPlacement: LabelPlacement.betweenTicks,
        max:20,
        interval: 30,
        stepSize: 1,
        showTicks: false,
        showLabels: false,
        edgeLabelPlacement: EdgeLabelPlacement.inside,
        showDividers: false,
        tooltipShape:const SfPaddleTooltipShape(),
        activeColor: Colors.blue,
        shouldAlwaysShowTooltip: false,
        
        tooltipTextFormatterCallback: (d,v){
        
          return "Level $v";
        },
        enableTooltip: true,
        minorTicksPerInterval: 0,
        onChanged: (dynamic val){
          setState(() {
            _level = val;
          });
        }, value: _level,
                    ),
        
                  ],
                ),
      ),
    );
  }
  final List<String> _options1 = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4'
  ];
  final List<String> _options2 = [
    'Any',
    'Buy',
    'Rent',
  ];
  final List<String> _options3 = [
    "Any",
    "Apartment",
    "Vila","Office ",
    "Shop"
  ];

  final List<String> _options4 = [
    'Yes',
    'No',

  ];
}
