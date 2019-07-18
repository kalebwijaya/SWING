//
//  EditProfileViewController.swift
//  MC2 User Profile
//
//  Created by Thomas Pratama Putra on 12/07/19.
//  Copyright © 2019 thomaspputra. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    let menuArray: [String] = ["FULL NAME", "GENDER", "WEIGHT", "HEIGHT"]
    
    var generateUser: User!
    var userProfileArray: [String]!
    
    let staticDataArray: [Int] = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
                                 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34,
                                 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51,
                                 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68,
                                 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85,
                                 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102,
                                 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116,
                                 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130,
                                 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144,
                                 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158,
                                 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172,
                                 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186,
                                 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200,
                                 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214,
                                 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228,
                                 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242,
                                 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256,
                                 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270,
                                 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284,
                                 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298,
                                 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312,
                                 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326,
                                 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340,
                                 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354,
                                 355, 356, 357, 358]
    let weightConversionArray: [String] = ["KG"]
    let heightConversionArray: [String] = ["CM"]
    let genderConversionArray: [String] = ["MALE", "FEMALE"]
    
    
    
    let weightPickerView = UIPickerView()
    let heightPickerView = UIPickerView()
    let genderPickerView = UIPickerView()
    let pickerToolBar = UIToolbar()
    
    @IBOutlet weak var editPhotoProfileImageView: UIImageView!
    @IBOutlet weak var editProfileTableView: UITableView!
    
    override func viewDidLoad() {
        loadData()
        
        generatePickerView(pickerView: weightPickerView, tag: 1)
        generatePickerView(pickerView: heightPickerView, tag: 2)
        generatePickerView(pickerView: genderPickerView, tag: 3)
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
        editProfileTableView.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        view.layoutIfNeeded()
    }
    
    private func setupView() {
        
        let profileImageTGR = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        
        view.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.1960784314, alpha: 1)
        
        editPhotoProfileImageView.isUserInteractionEnabled = true
        editPhotoProfileImageView.layer.cornerRadius = editPhotoProfileImageView.frame.width / 2
        editPhotoProfileImageView.image = generateUser.userProfileImage
        
        editProfileTableView.backgroundColor = .clear
        editProfileTableView.separatorStyle = .none
        
        editPhotoProfileImageView.addGestureRecognizer(profileImageTGR)
    }
    
    @objc private func profileImageTapped() {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Pick a Photo!", message: "Sources", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photos", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel ", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil )
    }
    
    private func loadData () {
        generateUser = loadUserDefaults()
        
        userProfileArray = [generateUser.userFullName, generateUser.userGender, "\(generateUser.userWeight) KG", "\(generateUser.userHeight) CM"]
    }
    
    private func generatePickerView(pickerView: UIPickerView, tag: Int) {
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.tag = tag
        pickerView.backgroundColor = #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.2509803922, alpha: 1)
        
        if tag == 1 {
            weightPickerView.selectRow(staticDataArray[checkValueInArray(selectInt: generateUser.userWeight)], inComponent: 0, animated: true)
        } else if tag == 2 {
            heightPickerView.selectRow(staticDataArray[checkValueInArray(selectInt: generateUser.userHeight)], inComponent: 0, animated: true)
        } else {
            if (generateUser.userGender).caseInsensitiveCompare("Male") == .orderedSame {
                genderPickerView.selectRow(0, inComponent: 0, animated: true)
            } else {
                genderPickerView.selectRow(1, inComponent: 0, animated: true)
            }
        }
    }
    
    @objc private func doneButtonPressed () {
        closePickerView()
        
        let selectedIndexPath = editProfileTableView.indexPathForSelectedRow
        
        var selectedValue: Any?
        var detailString: String!
        
        switch selectedIndexPath!.row {
        case 1:
            selectedValue = genderConversionArray[genderPickerView.selectedRow(inComponent: 0)]
            UserDefaults.standard.set(selectedValue, forKey: Key.userGender)
            detailString = "\(String(describing: selectedValue!))"
        case 2:
            selectedValue = staticDataArray[weightPickerView.selectedRow(inComponent: 0)]
            UserDefaults.standard.set(selectedValue, forKey: Key.userWeight)
            detailString = "\(String(describing: selectedValue!)) KG"
        case 3:
            selectedValue = staticDataArray[heightPickerView.selectedRow(inComponent: 0)]
            UserDefaults.standard.set(selectedValue, forKey: Key.userHeight)
            detailString = "\(String(describing: selectedValue!)) CM"
        default:
            break
        }
        editProfileTableView.cellForRow(at: selectedIndexPath!)?.detailTextLabel!.text = detailString
        editProfileTableView.deselectRow(at: selectedIndexPath! , animated: true)
    }
    
    private func closePickerView() {
        view.endEditing(true)
        for textField in self.view.subviews where textField is UITextField {
            textField.resignFirstResponder()
        }
    }
    
    private func triggerPickerView (pickerView: UIPickerView) {
        pickerToolBar.backgroundColor = #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.2509803922, alpha: 1)
        pickerToolBar.isTranslucent = true
        pickerToolBar.tintColor = #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.2509803922, alpha: 1)
        pickerToolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(doneButtonPressed))
        
        pickerToolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        let textFieldView = UITextField(frame: CGRect.zero)
        view.addSubview(textFieldView)
        
        textFieldView.inputView = pickerView
        textFieldView.inputAccessoryView = pickerToolBar
        
        textFieldView.becomeFirstResponder()
    }
    
    private func checkValueInArray(selectInt: Int) -> Int {
        if let index = staticDataArray.firstIndex(of: selectInt) {
           return index - 3
        } else {
            return staticDataArray.count / 8
        }
    }
}

extension EditProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "goToEditName", sender: self)
            tableView.deselectRow(at: indexPath, animated: true)
            closePickerView()
        case 1:
            triggerPickerView(pickerView: genderPickerView)
        case 2:
            triggerPickerView(pickerView: weightPickerView)
        case 3:
            triggerPickerView(pickerView: heightPickerView)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath)
        cell.backgroundColor = .clear
        cell.separatorInset = .zero
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = menuArray[indexPath.row]
        cell.detailTextLabel?.text = userProfileArray[indexPath.row]
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
}

extension EditProfileViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 1 {
            return 2
        } else if pickerView.tag == 2 {
            return 2
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            if component == 0 {
                return staticDataArray.count
            } else {
                return weightConversionArray.count
            }
        } else if pickerView.tag == 2 {
            if component == 0 {
                return 250
            } else {
                return heightConversionArray.count
            }
        } else {
            return genderConversionArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            if component == 0 {
                return String(staticDataArray[row])
            } else {
                return weightConversionArray[row]
            }
        } else if pickerView.tag == 2 {
            if component == 0 {
                return String(staticDataArray[row])
            } else {
                return heightConversionArray[row]
            }
        } else {
            return genderConversionArray[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        
        if pickerView.tag == 1 {
            if component == 0 {
                pickerLabel.text = String(self.staticDataArray[row])
                pickerLabel.textColor = .white
                pickerLabel.font = UIFont.systemFont(ofSize: 24.0)
                pickerLabel.textAlignment = .right
            } else {
                pickerLabel.text = self.weightConversionArray[row]
                pickerLabel.textColor = .white
                pickerLabel.font = UIFont.systemFont(ofSize: 36.0)
                pickerLabel.textAlignment = .center
            }
            
        } else if pickerView.tag == 2 {
            if component == 0 {
                pickerLabel.text = String(self.staticDataArray[row])
                pickerLabel.textColor = .white
                pickerLabel.font = UIFont.systemFont(ofSize: 24.0)
                pickerLabel.textAlignment = .right
            } else {
                pickerLabel.text = self.heightConversionArray[row]
                pickerLabel.textColor = .white
                pickerLabel.font = UIFont.systemFont(ofSize: 36.0)
                pickerLabel.textAlignment = .center
            }
        } else {
            pickerLabel.text = self.genderConversionArray[row]
            pickerLabel.textColor = .white
            pickerLabel.font = UIFont.systemFont(ofSize: 24.0)
            pickerLabel.textAlignment = .center
        }
        return pickerLabel
    }
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        editPhotoProfileImageView.image = image
        UserDefaults.standard.set(image.jpegData(compressionQuality: 1.0), forKey: Key.userProfileImage)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

