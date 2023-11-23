import 'package:rxdart/rxdart.dart';
import 'package:stu_pedia/task_manager_module/newe_entry/IconsData.dart';

import 'errors.dart';

class NewEntryBlock {
  BehaviorSubject<IconsData>? _selectedIconsData$;
  ValueStream<IconsData>? get selectedIconsData => _selectedIconsData$!.stream;

  BehaviorSubject<int>? _selectedIntervals$;
  BehaviorSubject<int>? get selectedIntervals => _selectedIntervals$;

  BehaviorSubject<int>? _selectedTimeOfDay$;
  BehaviorSubject<int>? get selectedTimeOfDay => _selectedTimeOfDay$;

  BehaviorSubject<EntryError>? _errorState$;
  BehaviorSubject<EntryError>? get errorState => _errorState$;

  NewEntryBlock() {
    // _selectedIconsData$ = BehaviorSubject<IconsData>.seeded(IconsData.none);
    _selectedIntervals$ = BehaviorSubject<int>.seeded(0);
    _selectedTimeOfDay$ =
        BehaviorSubject<String>.seeded("none") as BehaviorSubject<int>?;
    _errorState$ = BehaviorSubject<EntryError>();
  }

  void dispose() {
    _selectedTimeOfDay$!.close();
    _selectedIntervals$!.close();
    _selectedIconsData$!.close();
  }

  void submitError(EntryError error) {
    _errorState$!.add(error);
  }

  void updateIntervals(int interval) {
    _selectedIntervals$!.add(interval);
  }

  void updateTime(int time) {
    _selectedTimeOfDay$!.add(time);
  }

  void updateIconsData(IconsData data) {
    IconsData _dataType = _selectedIconsData$!.value;
    if (data == _dataType) {
      // _selectedIconsData$!.add(IconsData.none);
    } else {
      _selectedIconsData$!.add(data);
    }
  }
}
