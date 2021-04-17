//
//  ViewController.swift
//  iOS-truforms
//
//  Created by Trufla on 2/10/20.
//  Copyright © 2020 Trufla. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    var arr = [Any]()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = UIStackView.Distribution.fill
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var submitButton: UIButton = {
        let view = UIButton()
        view.setTitle("Submit", for: .normal)
        view.backgroundColor = .orange
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
        
        setupViews()
        setupLayout()
    }
    
    func traverse(_ root: TreeNode<SchemaObjectProtocol>) {
        manager?.draw(root.value)
        for child in root.children {
            traverse(child)
        }
    }
    
    func traverseAtIndex(_ root: TreeNode<SchemaObjectProtocol>,index: Int) {
        manager?.drawAtIndex(root.value, index: index)
        for child in root.children.reversed() {
            traverseAtIndex(child,index: index)
        }
    }
    
    private func setupViews() {
        scrollView.backgroundColor = .lightGray
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        stackView.addArrangedSubview(submitButton)
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
        
        
        //Submit Button
        submitButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        submitButton.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        submitButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        submitButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20).isActive = true
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print(stackView.arrangedSubviews.count)
        print("Do Submit...")
        for view in arr {
            if let v  = view as? UIView {
                stackView.removeArrangedSubview(v)
                v.removeFromSuperview()
            }
        }
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

extension ViewController: AppendViewDelegate {
    
    func append(child: UIView, node: SchemaObjectProtocol) {
        let presenter = SchemaNodePresenter()
        var tag = UUID().uuidString
        let treeNode = presenter.scan(schema: node.schemaNode!, tag: &tag, parentTage: tag)
        
        if let index = stackView.arrangedSubviews.firstIndex(of: child) {
            traverseAtIndex(treeNode,index: index + 1)
        }
    }
    
    func appends(child: UIView) {
        if let index = stackView.arrangedSubviews.firstIndex(of: child) {
            let newView = UITextField()
            newView.backgroundColor = .red
            newView.isHidden = true
            stackView.insertArrangedSubview(newView, at: index + 1)
            
            UIView.animate(withDuration: 0.25) { () -> Void in
                newView.isHidden = false
                //scrollv.contentOffset = offset
            }
        }
    }
}

extension ViewController: EurekaManagerDelegate {
    func createView<T, V>(view: V, index: Int) where T : SchemaObjectProtocol, V : SchemaBaseView<T> {
        arr.append(view)
        view.isHidden = true
        stackView.insertArrangedSubview(view, at: index)
        UIView.animate(withDuration: 0.25) { () -> Void in
            view.isHidden = false
        }
    }
    
    func addView<T, V>(view: V) where T : SchemaObjectProtocol, V : SchemaBaseView<T> {
        if let v = view as? SchemaArrayView {
            v.delegate = self
        }
        stackView.addArrangedSubview(view)
    }
    
    func addSection(title:String, with tag: String, at parentTag:String, ignoreTitle: Bool)  {
        var sectionTitle = ""
        if !ignoreTitle {
            sectionTitle = title
            let s = SchemaObjectView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 100))
            s.title.text = sectionTitle
            stackView.addArrangedSubview(s)
        }
    }
}
