import 'package:flutter/material.dart';

class AgeSlider extends StatefulWidget {
  const AgeSlider({required this.onRangeChanged, required this.first, required this.last});
  final void Function(RangeValues) onRangeChanged;
  final double first;
  final double last;
  @override
  State<AgeSlider> createState() => _AgeSliderState();
}

class _AgeSliderState extends State<AgeSlider>{
late RangeValues _ageRange;
  @override
  void initState(){
    super.initState();
     _ageRange = RangeValues(widget.first, widget.last);
  }
  Widget build(BuildContext context) {
    return RangeSlider(
      divisions: (widget.last-widget.first).round(),
      labels: RangeLabels(
          _ageRange.start.round().toString(),
          _ageRange.end.round().toString()
      ),
      max: widget.last,
        min: widget.first,
        values: _ageRange,
        onChanged: (RangeValues range){
          setState(() {
            _ageRange = range;
          });
          widget.onRangeChanged(_ageRange);
        }
    );
  }
}