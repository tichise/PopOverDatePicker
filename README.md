### PopOverDatePicker ![CocoaPods Version](https://img.shields.io/cocoapods/v/PopOverDatePicker.svg?style=flat) ![Platform](https://img.shields.io/cocoapods/p/PopOverDatePicker.svg?style=flat) ![License](https://img.shields.io/cocoapods/l/PopOverDatePicker.svg?style=flat)

PopOverDatePicker is a PopOver style DatePicker view.

### Image

#### iPhone
![image](https://user-images.githubusercontent.com/43707/63687725-4d308b80-c840-11e9-8e8b-4c6e07db38a6.png)

### Examples

#### for Swift
```
        let calendar = Calendar.current
        let date = Date()
        guard let yesterday = calendar.date(byAdding: .day, value: -1, to: calendar.startOfDay(for: date)) else {
            fatalError()
        }

        guard let tomorrow = calendar.date(byAdding: .day, value: +1, to: calendar.startOfDay(for: date)) else {
            fatalError()
        }

        let popOverDatePickerViewController = PopOverDatePickerViewController.instantiate()
        popOverDatePickerViewController.set(date: date)
        popOverDatePickerViewController.set(minimumDate: yesterday)
        popOverDatePickerViewController.set(maximumDate: tomorrow)
        popOverDatePickerViewController.set(datePickerMode: .date)
        popOverDatePickerViewController.set(locale: Locale(identifier: "ja-JP"))
        popOverDatePickerViewController.popoverPresentationController?.barButtonItem = sender
        popOverDatePickerViewController.presentationController?.delegate = self
        popOverDatePickerViewController.changeHandler = { (date: Date) -> Void in
            print(date)
        }
        present(popOverDatePickerViewController, animated: true, completion: nil)
```

### Installation (CocoaPods)
`pod PopOverDatePicker`

### CocoaPods URL
- [PopOverDatePicker on CocoaPods.org](https://cocoapods.org/pods/PopOverDatePicker)

### License
PopOverDatePicker is available under the MIT license. See the LICENSE file for more info.
