import 'package:flutter/material.dart';

class ExpandableRadioContainer extends StatefulWidget {
  @override
  _ExpandableRadioContainerState createState() => _ExpandableRadioContainerState();
}

class _ExpandableRadioContainerState extends State<ExpandableRadioContainer> with TickerProviderStateMixin {
  bool isExpanded = false;
  String? selectedOption;
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
      upperBound: 0.5, // 180 degree
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  void toggleContainer() {
    setState(() {
      isExpanded = !isExpanded;
      if (isExpanded) {
        _rotationController.forward();
      } else {
        _rotationController.reverse();
      }
    });
  }

  void selectOption(String option) {
    setState(() {
      selectedOption = option;
      isExpanded = false;
      _rotationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleContainer,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic, // Ultra smooth curve
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedOption ?? "Select Option",
                    style: TextStyle(fontSize: 16),
                  ),
                  RotationTransition(
                    turns: _rotationController,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 28,
                    ),
                  ),
                ],
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 400),
                switchInCurve: Curves.easeInOutCubic,
                switchOutCurve: Curves.easeInOutCubic,
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SizeTransition(
                      sizeFactor: animation,
                      axisAlignment: -1.0, // Collapse from top
                      child: child,
                    ),
                  );
                },
                child: isExpanded
                    ? Column(
                        key: ValueKey('ExpandedState'),
                        children: [
                          SizedBox(height: 16),
                          Divider(),
                          ListTile(
                            title: Text('Customer'),
                            trailing: Radio<String>(
                              value: 'Customer',
                              groupValue: selectedOption,
                              onChanged: (value) {
                                selectOption(value!);
                              },
                            ),
                            onTap: () => selectOption('Customer'),
                          ),
                          ListTile(
                            title: Text('Provider'),
                            trailing: Radio<String>(
                              value: 'Provider',
                              groupValue: selectedOption,
                              onChanged: (value) {
                                selectOption(value!);
                              },
                            ),
                            onTap: () => selectOption('Provider'),
                          ),
                        ],
                      )
                    : SizedBox(key: ValueKey('CollapsedState')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
