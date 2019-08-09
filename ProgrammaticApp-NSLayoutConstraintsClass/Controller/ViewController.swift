//
//  ViewController.swift
//  ProgrammaticApp-NSLayoutConstraintsClass
//
//  Created by Arun Patwardhan on 07/08/19.
//  Copyright © 2019 Amaranthine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title               = "Feedback"
        self.configureUIElements()
        self.configureStacks()
        self.apply_constraints()
    }
    
    //UI Elements       --------------------------------------------------
    //Title
    var icon            : UIImageView           = UIImageView()
    var appTitle        : UILabel               = UILabel()
    var appView         : UIView                = UIView()
    
    //User information
    var nameField       : UITextField           = UITextField()
    var emailField      : UITextField           = UITextField()
    var age             : UILabel               = UILabel()
    var ageSlider       : UISlider              = UISlider()
    var ageValue        : UILabel               = UILabel()
    var agePicker       : UIDatePicker          = UIDatePicker()
    
    //Opinion Field
    var serviceLbl      : UILabel               = UILabel()
    var serviceRating   : UISegmentedControl    = UISegmentedControl()
    var satisfactionLbl : UILabel               = UILabel()
    var satisfaction    : UISegmentedControl    = UISegmentedControl()
    
    //Actions
    var saveBtn         : UIButton              = UIButton(type: UIButton.ButtonType.roundedRect)
    var fetchBtn        : UIButton              = UIButton(type: UIButton.ButtonType.roundedRect)
    
    //Model             --------------------------------------------------
    var feedbacks       : [FeedbackResponse]    = [FeedbackResponse]()
    
    //StackViews
    var titleStack      : UIStackView           = UIStackView()
    var ageStack        : UIStackView           = UIStackView()
    var serviceStack    : UIStackView           = UIStackView()
    var satisfactionStk : UIStackView           = UIStackView()
    var buttonStk       : UIStackView           = UIStackView()
    var enclosingStack  : UIStackView           = UIStackView()
    var stackSpacing    : CGFloat               = 30.0
    
    //Functions         --------------------------------------------------
    /**
     Unified UI Configuration Function
     - important: This function does not perform data validation
     - returns: Void.
     - requires: iOS 12 or later
     - Since: iOS 12
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     - Date: 1st August 2019
     
     **Contact Details**
     
     [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
     
     [www.amaranthine.in](https://www.amaranthine.in)
     */
    @available(iOS, introduced: 12.0, message: "Unified UI Configuration Function")
    func configureUIElements()
    {
        self.configureTitleELements()
        self.configureUserInfo()
        self.configureOpinionField()
        self.configureButtons()
    }
}

/**
 This extension contains the code that creates the UI Elements
 
 - Author: Arun Patwardhan
 - Version: 1.1
 - Date: 1st August 2019
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 */
extension ViewController
{
    /**
     Unified UI Configuration Function for the title
     - important: This function does not perform data validation
     - returns: Void.
     - requires: iOS 12 or later
     - Since: iOS 12
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     - Date: 1st August 2019
     
     **Contact Details**
     
     [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
     
     [www.amaranthine.in](https://www.amaranthine.in)
     */
    @available(iOS, introduced: 12.0, message: "Unified UI Configuration Function for the title")
    func configureTitleELements()
    {
        //Icon
        icon.image                                                  = UIImage(named: "logo.png")
        icon.contentMode                                            = UIView.ContentMode.scaleAspectFit
        icon.clipsToBounds                                          = true
        icon.translatesAutoresizingMaskIntoConstraints              = false
        
        //Title
        appTitle.text                                               = "Feedback"
        appTitle.font                                               = UIFont.boldSystemFont(ofSize: 24.0)
        appTitle.textColor                                          = UIColor.orange
        appTitle.textAlignment                                      = NSTextAlignment.left
        appTitle.translatesAutoresizingMaskIntoConstraints          = false
        
        //View
        appView.addSubview(appTitle)
    }
    
    /**
     Unified UI Configuration Function user information
     - important: This function does not perform data validation
     - note: The name, email, and age parts of the code are configured.
     - returns: Void.
     - requires: iOS 12 or later
     - Since: iOS 12
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     - Date: 1st August 2019
     
     **Contact Details**
     
     [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
     
     [www.amaranthine.in](https://www.amaranthine.in)
     */
    @available(iOS, introduced: 12.0, message: "Unified UI Configuration Function for user information")
    func configureUserInfo()
    {
        //Name
        nameField.placeholder                                       = "Enter Name"
        nameField.textColor                                         = UIColor.white
        nameField.textAlignment                                     = NSTextAlignment.left
        nameField.keyboardType                                      = UIKeyboardType.namePhonePad
        nameField.keyboardAppearance                                = UIKeyboardAppearance.dark
        nameField.clearButtonMode                                   = UITextField.ViewMode.always
        nameField.borderStyle                                       = UITextField.BorderStyle.roundedRect
        nameField.translatesAutoresizingMaskIntoConstraints         = false
        
        //Email
        emailField.placeholder                                      = "Enter Email"
        emailField.textColor                                        = UIColor.white
        emailField.textAlignment                                    = NSTextAlignment.left
        emailField.keyboardType                                     = UIKeyboardType.namePhonePad
        emailField.keyboardAppearance                               = UIKeyboardAppearance.dark
        emailField.clearButtonMode                                  = UITextField.ViewMode.always
        emailField.borderStyle                                      = UITextField.BorderStyle.roundedRect
        emailField.translatesAutoresizingMaskIntoConstraints        = false
        
        //Age
        age.text                                                    = "AGE"
        age.textColor                                               = UIColor.orange
        age.font                                                    = UIFont(name: "Gill Sans", size: 20.0)
        age.translatesAutoresizingMaskIntoConstraints               = false
        
        ageSlider.maximumValue                                      = 100.0
        ageSlider.minimumValue                                      = 10.0
        ageSlider.value                                             = 10.0
        ageSlider.minimumTrackTintColor                             = UIColor.orange
        ageSlider.maximumTrackTintColor                             = UIColor.gray
        ageSlider.addTarget(self, action: #selector(ViewController.sliderMoved), for: UIControl.Event.valueChanged)
        ageSlider.translatesAutoresizingMaskIntoConstraints         = false
        
        ageValue.text                                               = "0"
        ageValue.textColor                                          = UIColor.white
        ageValue.font                                               = UIFont(name: "Gill Sans", size: 20.0)
        ageValue.translatesAutoresizingMaskIntoConstraints          = false
        
        agePicker.datePickerMode                                    = UIDatePicker.Mode.date
        agePicker.backgroundColor                                   = UIColor.orange
        agePicker.addTarget(self, action: #selector(ViewController.agePickerChanged), for: UIControl.Event.valueChanged)
        agePicker.translatesAutoresizingMaskIntoConstraints         = false
    }
    
    /**
     Unified UI Configuration Function rating information
     - important: This function does not perform data validation
     - returns: Void.
     - requires: iOS 12 or later
     - Since: iOS 12
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     - Date: 1st August 2019
     
     **Contact Details**
     
     [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
     
     [www.amaranthine.in](https://www.amaranthine.in)
     */
    @available(iOS, introduced: 12.0, message: "Unified UI Configuration Function for rating information")
    func configureOpinionField()
    {
        //Service
        serviceLbl.text                                             = "Service"
        serviceLbl.textColor                                        = UIColor.orange
        serviceLbl.font                                             = UIFont(name: "Gill Sans", size: 20.0)
        serviceLbl.translatesAutoresizingMaskIntoConstraints        = false
        
        serviceRating.insertSegment(withTitle: "0", at: 0, animated: true)
        serviceRating.insertSegment(withTitle: "1", at: 0, animated: true)
        serviceRating.insertSegment(withTitle: "2", at: 0, animated: true)
        serviceRating.insertSegment(withTitle: "3", at: 0, animated: true)
        serviceRating.insertSegment(withTitle: "5", at: 0, animated: true)
        serviceRating.tintColor                                     = UIColor.orange
        serviceRating.translatesAutoresizingMaskIntoConstraints     = false
        serviceRating.addTarget(self, action: #selector(ViewController.serviceRatingChanged), for: UIControl.Event.valueChanged)
        
        //Satisfaction
        satisfactionLbl.text                                        = "Satisfaction"
        satisfactionLbl.textColor                                   = UIColor.orange
        satisfactionLbl.font                                        = UIFont(name: "Gill Sans", size: 20.0)
        
        satisfaction.insertSegment(withTitle: "0", at: 0, animated: true)
        satisfaction.insertSegment(withTitle: "1", at: 0, animated: true)
        satisfaction.insertSegment(withTitle: "2", at: 0, animated: true)
        satisfaction.insertSegment(withTitle: "3", at: 0, animated: true)
        satisfaction.insertSegment(withTitle: "5", at: 0, animated: true)
        satisfaction.tintColor                                      = UIColor.orange
        satisfaction.addTarget(self, action: #selector(ViewController.satisfactionRatingChanged), for: UIControl.Event.valueChanged)
        satisfaction.translatesAutoresizingMaskIntoConstraints      = false
    }
    
    /**
     Unified UI Configuration Function for buttons
     - important: This function does not perform data validation
     - note: Both, Save & Fetch, buttons are configured.
     - returns: Void.
     - requires: iOS 12 or later
     - Since: iOS 12
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     - Date: 1st August 2019
     
     **Contact Details**
     
     [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
     
     [www.amaranthine.in](https://www.amaranthine.in)
     */
    @available(iOS, introduced: 12.0, message: "Unified UI Configuration Function for buttons")
    func configureButtons()
    {
        saveBtn.setTitle("Save", for: UIControl.State.normal)
        saveBtn.addTarget(self, action: #selector(ViewController.saveTapped), for: UIControl.Event.touchDown)
        saveBtn.tintColor                                           = UIColor.green
        saveBtn.translatesAutoresizingMaskIntoConstraints           = false
        
        fetchBtn.setTitle("Fetch", for: UIControl.State.normal)
        fetchBtn.addTarget(self, action: #selector(ViewController.fetchTapped), for: UIControl.Event.touchDown)
        fetchBtn.tintColor                                          = UIColor.white
        fetchBtn.translatesAutoresizingMaskIntoConstraints          = false
    }
}

/**
 This extension contains the code that holds the different IBActions
 
 - Author: Arun Patwardhan
 - Version: 1.2
 - Date: 1st August 2019
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 */
extension ViewController
{
    //Target Actions    --------------------------------------------------
    @objc func sliderMoved()
    {
        ageValue.text                                               = "\(Int(ageSlider.value))"
        let interval : TimeInterval                                 = Double(ageSlider.value) * 365.0 * 24.0 * 60.0 * 60.0
        agePicker.date                                              = Date(timeIntervalSinceNow: -(interval))
    }
    
    @objc func agePickerChanged()
    {
        let difference                                              = (((agePicker.date.timeIntervalSinceNow / 60.0) / 60.0) / 24.0) / 365.0
        
        ageValue.text                                               = "\(Int(-difference))"
        ageSlider.value                                             = Float(-difference)
    }
    
    @objc func serviceRatingChanged()
    {
        
    }
    
    @objc func satisfactionRatingChanged()
    {
        
    }
    
    @objc func saveTapped()
    {
        var temp : FeedbackResponse                                 = FeedbackResponse()
        
        temp.age                                                    = agePicker.date
        temp.dateOfSurvey                                           = Date(timeIntervalSinceNow: 0)
        temp.email                                                  = emailField.text!
        temp.name                                                   = nameField.text!
        temp.satisfactionRating.from(integer: satisfaction.selectedSegmentIndex)
        temp.serviceRating.from(integer: serviceRating.selectedSegmentIndex)
        feedbacks.append(temp)
    }
    
    @objc func fetchTapped()
    {
        let destinationController : ListViewController              = ListViewController()
        destinationController.data                                  = feedbacks
        self.navigationController?.pushViewController(destinationController, animated: true)
    }
}

/**
 This extension contains the code that creates the UIStackView objects
 
 - Author: Arun Patwardhan
 - Version: 1.3
 - Date: 1st August 2019
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 */
extension ViewController
{
    /**
     Unified UI Configuration Function for `UIStackView`
     - important: This function does not perform data validation
     - returns: Void.
     - requires: iOS 12 or later
     - Since: iOS 12
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     - Date: 1st August 2019
     
     **Contact Details**
     
     [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
     
     [www.amaranthine.in](https://www.amaranthine.in)
     */
    @available(iOS, introduced: 12.0, message: "Unified UI Configuration Function for UIStackView")
    func configureStacks()
    {
        //Title
        titleStack.axis                                             = NSLayoutConstraint.Axis.horizontal
        titleStack.distribution                                     = UIStackView.Distribution.fill
        titleStack.alignment                                        = UIStackView.Alignment.fill
        titleStack.spacing                                          = stackSpacing
        titleStack.translatesAutoresizingMaskIntoConstraints        = false
        titleStack.addArrangedSubview(icon)
        titleStack.addArrangedSubview(appView)
        
        //Age
        ageStack.axis                                               = NSLayoutConstraint.Axis.horizontal
        ageStack.distribution                                       = UIStackView.Distribution.fill
        ageStack.alignment                                          = UIStackView.Alignment.fill
        ageStack.spacing                                            = stackSpacing
        ageStack.translatesAutoresizingMaskIntoConstraints          = false
        ageStack.addArrangedSubview(age)
        ageStack.addArrangedSubview(ageSlider)
        ageStack.addArrangedSubview(ageValue)
        
        //Service
        serviceStack.axis                                           = NSLayoutConstraint.Axis.horizontal
        serviceStack.distribution                                   = UIStackView.Distribution.fillProportionally
        serviceStack.alignment                                      = UIStackView.Alignment.fill
        serviceStack.spacing                                        = stackSpacing
        serviceStack.translatesAutoresizingMaskIntoConstraints      = false
        serviceStack.addArrangedSubview(serviceLbl)
        serviceStack.addArrangedSubview(serviceRating)
        
        //Satisfaction
        satisfactionStk.axis                                        = NSLayoutConstraint.Axis.horizontal
        satisfactionStk.distribution                                = UIStackView.Distribution.fillProportionally
        satisfactionStk.alignment                                   = UIStackView.Alignment.fill
        satisfactionStk.spacing                                     = stackSpacing
        satisfactionStk.translatesAutoresizingMaskIntoConstraints   = false
        satisfactionStk.addArrangedSubview(satisfactionLbl)
        satisfactionStk.addArrangedSubview(satisfaction)
        
        //Buttons
        buttonStk.axis                                              = NSLayoutConstraint.Axis.horizontal
        buttonStk.distribution                                      = UIStackView.Distribution.fillEqually
        buttonStk.alignment                                         = UIStackView.Alignment.fill
        buttonStk.spacing                                           = stackSpacing
        buttonStk.translatesAutoresizingMaskIntoConstraints         = false
        buttonStk.addArrangedSubview(saveBtn)
        buttonStk.addArrangedSubview(fetchBtn)
        
        //Enclosing stack
        enclosingStack.axis                                         = NSLayoutConstraint.Axis.vertical
        enclosingStack.distribution                                 = UIStackView.Distribution.fill
        enclosingStack.alignment                                    = UIStackView.Alignment.fill
        enclosingStack.spacing                                      = stackSpacing
        enclosingStack.addArrangedSubview(titleStack)
        enclosingStack.addArrangedSubview(nameField)
        enclosingStack.addArrangedSubview(emailField)
        enclosingStack.addArrangedSubview(ageStack)
        enclosingStack.addArrangedSubview(agePicker)
        enclosingStack.addArrangedSubview(serviceStack)
        enclosingStack.addArrangedSubview(satisfactionStk)
        enclosingStack.addArrangedSubview(buttonStk)
        enclosingStack.translatesAutoresizingMaskIntoConstraints    = false
        self.view.addSubview(enclosingStack)
    }
}

/**
 This extension contains the code that applies the constraints
 
 - Author: Arun Patwardhan
 - Version: 1.4
 - Date: 1st August 2019
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 */
extension ViewController
{
    /**
     Unified Constraint Configuration Function
     - important: This function does not perform data validation
     - returns: Void.
     - requires: iOS 12 or later
     - Since: iOS 12
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     - Date: 1st August 2019
     
     **Contact Details**
     
     [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
     
     [www.amaranthine.in](https://www.amaranthine.in)
     */
    @available(iOS, introduced: 12.0, message: "Unified Constraint Configuration Function ")
    func apply_constraints()
    {
        self.apply_constraints_to_title()
        self.apply_constraints_to_fields()
        self.apply_constraints_to_age()
        self.apply_constraints_to_service()
        self.apply_constraints_to_satisfaction()
        self.apply_constraints_to_buttons()
        self.apply_constraints_to_all_Stacks()
        self.apply_constraints_to_enclosing_stack()
    }
    
    /**
     Constraint Configuration Function for title elements
     - important: This function does not perform data validation
     - note: The icon is configured to be compressible in both `horizontal` & `vertical` directions.
     - returns: Void.
     - requires: iOS 12 or later
     - Since: iOS 12
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     - Date: 1st August 2019
     
     **Contact Details**
     
     [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
     
     [www.amaranthine.in](https://www.amaranthine.in)
     */
    @available(iOS, introduced: 12.0, message: "Constraint Configuration Function for Title")
    func apply_constraints_to_title()
    {
        icon.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        icon.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.vertical)
        appTitle.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: NSLayoutConstraint.Axis.horizontal)

        let apptitleConstraint  : NSLayoutConstraint    = NSLayoutConstraint(item: appTitle, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: icon, attribute: NSLayoutConstraint.Attribute.width, multiplier: 4.0, constant: 0.0)
        apptitleConstraint.isActive                     = true
    }
    
    /**
     Constraint Configuration Function for Field elements
     - important: This function does not perform data validation
     - note: Both the fields have the same width and have a minimum width of 100.0
     - returns: Void.
     - requires: iOS 12 or later
     - Since: iOS 12
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     - Date: 1st August 2019
     
     **Contact Details**
     
     [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
     
     [www.amaranthine.in](https://www.amaranthine.in)
     */
    @available(iOS, introduced: 12.0, message: "Constraint Configuration Function for Field")
    func apply_constraints_to_fields()
    {
        let nameFieldConstraint     : NSLayoutConstraint    = NSLayoutConstraint(item: nameField, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 100.0)
        nameFieldConstraint.isActive                        = true

        let emailFieldConstraint    : NSLayoutConstraint    = NSLayoutConstraint(item: emailField, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 100.0)
        emailFieldConstraint.isActive                       = true

        let fieldConstraint         : NSLayoutConstraint    = NSLayoutConstraint(item: nameField, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: emailField, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 0.0)
        fieldConstraint.isActive                            = true
    }
    
    /**
     Constraint Configuration Function for Age elements
     - important: This function does not perform data validation
     - note: Age value and age labels both have the same width. The slider has a width of at least 150.0
     - returns: Void.
     - requires: iOS 12 or later
     - Since: iOS 12
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     - Date: 1st August 2019
     
     **Contact Details**
     
     [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
     
     [www.amaranthine.in](https://www.amaranthine.in)
     */
    @available(iOS, introduced: 12.0, message: "Constraint Configuration Function for Age components")
    func apply_constraints_to_age()
    {
        let ageConstraint           : NSLayoutConstraint    = NSLayoutConstraint(item: age, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: ageValue, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 0.0)
        ageConstraint.isActive                              = true

//        let ageValueConstraint      : NSLayoutConstraint    = NSLayoutConstraint(item: ageConstraint, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 50.0)
//        ageValueConstraint.isActive                         = true
//
//        let ageSliderConstraint     : NSLayoutConstraint    = NSLayoutConstraint(item: ageSlider, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 150.0)
//        ageSliderConstraint.isActive                        = true
    }
    
    /**
     Constraint Configuration Function for Service Rating elements
     - important: This function does not perform data validation
     - note: The service label has a width of at least 100.0. The segmented control is at least 1.5 times the width of the label. The label cannot be compressed easily.
     - returns: Void.
     - requires: iOS 12 or later
     - Since: iOS 12
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     - Date: 1st August 2019
     
     **Contact Details**
     
     [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
     
     [www.amaranthine.in](https://www.amaranthine.in)
     */
    @available(iOS, introduced: 12.0, message: "Constraint Configuration Function for Service Rating components")
    func apply_constraints_to_service()
    {
        let serviceConstraint       : NSLayoutConstraint    = NSLayoutConstraint(item: serviceRating, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: serviceLbl, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.5, constant: 0.0)
        serviceConstraint.isActive                          = true
        
        let serviceLblConstraint    : NSLayoutConstraint    = NSLayoutConstraint(item: serviceLbl, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 100.0)
        serviceLblConstraint.isActive                       = true
        
        serviceLbl.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: NSLayoutConstraint.Axis.horizontal)
    }
    
    /**
     Constraint Configuration Function for Satisfaction Rating elements
     - important: This function does not perform data validation
     - note: The Satisfaction label has a width of at least 100.0. The segmented control is at least 1.5 times the width of the label. The label cannot be compressed easily.
     - returns: Void.
     - requires: iOS 12 or later
     - Since: iOS 12
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     - Date: 1st August 2019
     
     **Contact Details**
     
     [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
     
     [www.amaranthine.in](https://www.amaranthine.in)
     */
    @available(iOS, introduced: 12.0, message: "Constraint Configuration Function for Satisfaction Rating components")
    func apply_constraints_to_satisfaction()
    {
        let satisfactionConstraint  : NSLayoutConstraint    = NSLayoutConstraint(item: satisfaction, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: satisfactionLbl, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.5, constant: 0.0)
        satisfactionConstraint.isActive                     = true
        
        let satisfactionLblCnstr    : NSLayoutConstraint    = NSLayoutConstraint(item: satisfactionLbl, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 100.0)
        satisfactionLblCnstr.isActive                       = true
        
        satisfactionLbl.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: NSLayoutConstraint.Axis.horizontal)
    }
    
    /**
     Constraint Configuration Function for Buttons
     - important: This function does not perform data validation
     - note: Both, Save and Fetch, have the same width.
     - returns: Void.
     - requires: iOS 12 or later
     - Since: iOS 12
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     - Date: 1st August 2019
     
     **Contact Details**
     
     [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
     
     [www.amaranthine.in](https://www.amaranthine.in)
     */
    @available(iOS, introduced: 12.0, message: "Constraint Configuration Function for Buttons")
    func apply_constraints_to_buttons()
    {
        let btnConstraint       : NSLayoutConstraint    = NSLayoutConstraint(item: saveBtn, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: fetchBtn, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 0.0)
        btnConstraint.isActive                          = true
    }
    
    /**
     Constraint Configuration Function for all the stacks
     - important: This function does not perform data validation
     - note: All the UIStackViews have a minimum width of 100.0. The agePicker has low priority for content hugging and the name, email fields have higher priority. All the UIStackviews have the same height of 30 points. Only the picker will see its height change.
     - returns: Void.
     - requires: iOS 12 or later
     - Since: iOS 12
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     - Date: 1st August 2019
     
     **Contact Details**
     
     [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
     
     [www.amaranthine.in](https://www.amaranthine.in)
     */
    @available(iOS, introduced: 12.0, message: "Constraint Configuration Function for all the stacks")
    func apply_constraints_to_all_Stacks()
    {
        NSLayoutConstraint(item: titleStack, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 100.0).isActive                          = true

        NSLayoutConstraint(item: ageStack, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 100.0).isActive                          = true

        NSLayoutConstraint(item: serviceStack, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 100.0).isActive                          = true
        
        NSLayoutConstraint(item: satisfactionStk, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 100.0).isActive                          = true

        NSLayoutConstraint(item: buttonStk, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 100.0).isActive                          = true
        
        NSLayoutConstraint(item: buttonStk, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1.0, constant: 30.0).isActive                          = true
        
        NSLayoutConstraint(item: serviceStack, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: satisfactionStk, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1.0, constant: 0.0).isActive                = true
        
        NSLayoutConstraint(item: satisfactionStk, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: buttonStk, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1.0, constant: 0.0).isActive                = true
        
        NSLayoutConstraint(item: ageStack, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: buttonStk, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1.0, constant: 0.0).isActive                           = true
        
        NSLayoutConstraint(item: titleStack, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: ageStack, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1.0, constant: 0.0).isActive                           = true
        
        titleStack.setContentHuggingPriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        agePicker.setContentHuggingPriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.vertical)
        nameField.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: NSLayoutConstraint.Axis.vertical)
        emailField.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: NSLayoutConstraint.Axis.vertical)
    }
    
    /**
     Constraint Configuration Function for the enclosing stack
     - important: This function does not perform data validation
     - note: The UIStackView stretchs to cover almost all the visitble screen area. Taking into account the room left for the navigation bar on top.
     - returns: Void.
     - requires: iOS 12 or later
     - Since: iOS 12
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     - Date: 1st August 2019
     
     **Contact Details**
     
     [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
     
     [www.amaranthine.in](https://www.amaranthine.in)
     */
    @available(iOS, introduced: 12.0, message: "Constraint Configuration Function for the enclosing stack")
    func apply_constraints_to_enclosing_stack()
    {
        NSLayoutConstraint(item: enclosingStack, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1.0, constant: 10.0).isActive                           = true
        NSLayoutConstraint(item: enclosingStack, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1.0, constant: -10.0).isActive                         = true
        NSLayoutConstraint(item: enclosingStack, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: -30.0).isActive                           = true
        NSLayoutConstraint(item: enclosingStack, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: 170.0).isActive                              = true
    }
}

/**
 This extension contains the code that handles changes to the size class
 
 - Author: Arun Patwardhan
 - Version: 1.5
 - Date: 1st August 2019
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 */
extension ViewController
{
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        //Size classes
        if self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact && self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.compact
        {
            //Compact - Compact
            appTitle.font       =   UIFont(name: "Gill Sans", size: 18.0)
        }
        else if self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact && self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.regular
        {
            //Compact - Regular
            appTitle.font       =   UIFont(name: "Gill Sans", size: 20.0)
        }
        else if self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.regular && self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.compact
        {
            //Regular - Compact
            appTitle.font       =   UIFont.boldSystemFont(ofSize: 20.0)
        }
        else if self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.regular && self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.regular
        {
            //Regular - Regular
            appTitle.font      =   UIFont.boldSystemFont(ofSize: 24.0)
        }
        
        //Hide the picker for compact height devices
        if self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.compact
        {
            agePicker.isHidden  = true
        }
        else if self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.regular
        {
            agePicker.isHidden  = false
        }
        
        //Device type
        if self.traitCollection.userInterfaceIdiom == UIUserInterfaceIdiom.pad
        {
            //iPad
            stackSpacing        = 40.0
        }
        else if self.traitCollection.userInterfaceIdiom == UIUserInterfaceIdiom.carPlay
        {
            //CarPlay
            stackSpacing        = 20.0
        }
        else if self.traitCollection.userInterfaceIdiom == UIUserInterfaceIdiom.phone
        {
            //iPhone
            stackSpacing        = 20.0
        }
        else if self.traitCollection.userInterfaceIdiom == UIUserInterfaceIdiom.tv
        {
            //Apple TV
            stackSpacing        = 50.0
        }
        
        //UITraitCollection
        let forceToucDevice : UITraitCollection = UITraitCollection(forceTouchCapability: UIForceTouchCapability.available)
        
        let displayScaleCollection : UITraitCollection = UITraitCollection(displayScale: 2.0)
        
        if self.traitCollection.containsTraits(in: forceToucDevice)
        {
            print("It is a force touch device")
        }
        
        if self.traitCollection.containsTraits(in: displayScaleCollection)
        {
            print("It is a 2x scale display.")
        }
    }
}
