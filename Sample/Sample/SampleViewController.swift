//
//  SampleViewController
//  Sample
//

import UIKit
import PopOverDatePicker

class SampleViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
    
    @IBOutlet weak var baseTextView:UITextView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barButtonItem = UIBarButtonItem(title: "menu", style: .plain, target: self, action: #selector(SampleViewController.openAlert(sender:)))
        self.navigationItem.rightBarButtonItem = barButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @objc public func openAlert(sender:UIBarButtonItem) {

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
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}
