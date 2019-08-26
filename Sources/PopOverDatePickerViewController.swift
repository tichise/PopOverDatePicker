//
//  PopOverDatePickerViewController
//

import Foundation

open class PopOverDatePickerViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
    
    var datePicker = UIDatePicker()

    @objc open var changeHandler: ((_ date: Date) -> Void)?

    @objc public static func instantiate() -> PopOverDatePickerViewController {
        let storyboardsBundle = getStoryboardsBundle()

        let storyboard = UIStoryboard(name: "PopOverDatePicker", bundle: storyboardsBundle)

        guard let popOverDatePickerViewController = storyboard.instantiateViewController(withIdentifier: "PopOverDatePickerViewController") as? PopOverDatePickerViewController else {
            fatalError()
        }
        
        popOverDatePickerViewController.modalPresentationStyle = UIModalPresentationStyle.popover
    popOverDatePickerViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        popOverDatePickerViewController.popoverPresentationController?.backgroundColor = UIColor.white
        
        return popOverDatePickerViewController
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()

        self.datePicker.addTarget(self, action: #selector(changeDate), for: .valueChanged)

        self.preferredContentSize = CGSize(width: 320, height:162)

        view.addSubview(datePicker)
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc open func set(date: Date) {
        self.datePicker.date = date
    }

    @objc open func set(datePickerMode: UIDatePicker.Mode) {
        self.datePicker.datePickerMode = datePickerMode
    }

    @objc open func set(locale: Locale) {
        self.datePicker.locale = locale
    }

    @objc open func set(minimumDate: Date) {
        self.datePicker.minimumDate = minimumDate
    }

    @objc open func set(maximumDate: Date) {
        self.datePicker.maximumDate = maximumDate
    }

    static func getStoryboardsBundle() -> Bundle {
        let podBundle = Bundle(for: PopOverDatePickerViewController.self)
        let bundleURL = podBundle.url(forResource: "PopOverDatePickerStoryboards", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)!
        
        return bundle
    }

    @objc func changeDate() {
        let date = self.datePicker.date

        if let changeHandler = self.changeHandler {
            changeHandler(date)
        }
    }
}
