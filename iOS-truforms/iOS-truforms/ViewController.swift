//
//  ViewController.swift
//  iOS-truforms
//
//  Created by Trufla on 2/10/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import UIKit
import Eureka

class ViewController: BaseViewController {
    
    //    @IBOutlet weak var stackView: UIStackView!
    //    @IBOutlet weak var stackViewHeight: NSLayoutConstraint!
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = UIStackView.Distribution.fillEqually
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var interactor: SchemaNodeInteractorProtocol?
    var enumDataInteractor: EnumDataInteractorProtocol?
    
    var manager: EurekaManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        manager = EurekaManager()
        manager?.delegate = self
        let module = SchemaNodeConfig()
        module.createModule(view: self)
        interactor?.fetch(id: "11")
        
        //Stack View
        //        stackView.axis  = NSLayoutConstraint.Axis.vertical
        //        stackView.distribution  = UIStackView.Distribution.equalSpacing
        //        stackView.alignment = UIStackView.Alignment.center
        //        stackView.spacing   = 5.0
        //         stackView.translatesAutoresizingMaskIntoConstraints = true
        
        //        stackViewHeight.constant = stackView.frame.height
        
        //Constraints
        //        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        //        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        setupViews()
        setupLayout()
    }
    
    func traverse(_ root: TreeNode<SchemaObjectProtocol>) {
        manager?.draw(root.value)
        for child in root.children {
            traverse(child)
        }
    }
    
    
    private func setupViews() {
        scrollView.backgroundColor = .lightGray
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
    }
    
    private func setupLayout() {
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        // because: "Constraints between the height, width, or centers attach to the scroll view’s frame." -
        // https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithScrollViews.html
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}

extension ViewController: SchemaNodeViewProtocol {
    
    func display() {
        // eureka mana
        print("Yalla")
    }
    
    func display(schema: TreeNode<SchemaObjectProtocol>) {
        // traverse tree here
        schema.printTree()
        configureNavigationBar(title: schema.value.title(), selector: nil)
        traverse(schema)
    }
}

extension ViewController: EurekaManagerDelegate {
    func insertSection(_ childTag: String) {
        
    }
    
    func addArraySection(title: String, with tag: String, at parentTag: String, ignoreTitle: Bool) {
        let s = SchemaArrayView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 100))
        s.title.text = title
        stackView.addArrangedSubview(s)
        //        stackViewHeight.constant += 100
    }
    
    // Fetch Enum Data
    func handleEnumData(model: EnumDataRequest,data: @escaping ([String]) -> Void) {
        
    }
    
    //Generic Method to add Row
    func addRow <R:BaseRow> (_ row:R, at tag: String) {
        
    }
    
    func addSection(title:String, with tag: String, at parentTag:String, ignoreTitle: Bool)  {
        let s = SchemaObjectView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 100))
        s.title.text = title
        stackView.addArrangedSubview(s)
        //        stackViewHeight.constant += 100
    }
    
    func drawDate(title: String) {
        let s = SchemaDatePicker(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 100))
        s.dateTextField.placeholder = title
        stackView.addArrangedSubview(s)
        //        stackViewHeight.constant += 100
    }
    
    func drawTextField(title: String) {
        let s = SchemaTextField(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 100))
        s.textField.placeholder = title
        stackView.addArrangedSubview(s)
        //        stackViewHeight.constant += 100
    }
    
    func drawTimePicker(title: String) {
        let s = SchemaTimePicker(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 100))
        s.dateTextField.placeholder = title
        stackView.addArrangedSubview(s)
        //        stackViewHeight.constant += 100
    }
    
    func drawPhotoPikcer(title: String) {
        let s = SchemaPhotoPickerView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 100))
        //s.tit.placeholder = title
        stackView.addArrangedSubview(s)
        //        stackViewHeight.constant += 100
    }
    
    
    func appendView() {
        let newView = UIView()
        newView.isHidden = true
        stackView.insertArrangedSubview(newView, at: 0)
        
        UIView.animate(withDuration: 0.25) { () -> Void in
            newView.isHidden = false
            //            scrollv.contentOffset = offset
        }
    }
}
