import 'package:flutter/material.dart';
import 'package:notiskku_demo/models/major.dart';
import 'package:notiskku_demo/services/preference_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:notiskku_demo/data/major_data.dart';

class AlarmMajorList extends StatefulWidget {
  const AlarmMajorList({
    super.key,
    required this.alarmMajor,
    required this.onAlarmMajorChanged,
  });

  final List<String> alarmMajor;
  final Function(List<String>) onAlarmMajorChanged;

  @override
  State<AlarmMajorList> createState() => _AlarmMajorListState();
}

class _AlarmMajorListState extends State<AlarmMajorList> {
  List<String> majorStrings = [];
  List<Major> filteredMajors = [];

  @override
  void initState() {
    super.initState();
    loadAlarmMajors();
    _loadMajors();
  }

  Future<void> _loadMajors() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve the list of selected majors from SharedPreferences.
    majorStrings = prefs.getStringList('selectedMajors') ?? ['Default major'];

    setState(() {
      filteredMajors = majorStrings
          .map((m) => Major(
                department: _getDepartmentValue(m),
                major: m,
              ))
          .toList();
    });
  }

  String _getDepartmentValue(String majorName) {
    for (var item in major) {
      if (item.major == majorName) {
        return item.department;
      }
    }
    return 'Unknown Department'; // Optional: return a default value if not found
  }

  // Method to load saved alarm majors
  Future<void> loadAlarmMajors() async {
    List<String>? loadedMajors = await getAlarmMajors();
    if (loadedMajors != null) {
      setState(() {
        widget.alarmMajor.clear(); // Clear the current selected majors list
        widget.alarmMajor.addAll(loadedMajors); // Add loaded majors
      });
    }
  }

  // Method to save selected alarm majors to preferences
  Future<void> saveAlarmMajorsToPrefs() async {
    await saveAlarmMajors(widget.alarmMajor);
  }

  void _toggleAlarmMajor(Major major) {
    setState(() {
      if (widget.alarmMajor.contains(major.major)) {
        widget.alarmMajor.remove(major.major); // Remove from alarm list
      } else {
        widget.alarmMajor.add(major.major); // Add to alarm list if selected
      }
      widget.onAlarmMajorChanged(widget.alarmMajor);
      saveAlarmMajorsToPrefs();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: filteredMajors.map((major) {
            bool isSelected = widget.alarmMajor.contains(major.major);
            return GestureDetector(
              onTap: () => _toggleAlarmMajor(major),
              child: FractionallySizedBox(
                widthFactor: 0.85, // Match with AlarmSetupCompleteButton width
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xB20B5B42) : const Color(0x99D9D9D9),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      major.major,
                      style: TextStyle(
                        color: isSelected ? const Color(0xFFFFFFFF) : const Color(0xFF979797),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

}
