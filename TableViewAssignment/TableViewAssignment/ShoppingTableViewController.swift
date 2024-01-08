//
//  ShoppingTableViewController.swift
//  TableViewAssignment
//
//  Created by 김재석 on 1/8/24.
//

import UIKit

struct ShoppingBag {
    let shopItem: String
    var isChecked: Bool
    var isStarred: Bool
    
}

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var searchBarTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    var shoppingList: [ShoppingBag] = [
        ShoppingBag(
            shopItem: "그립톡 구매하기",
            isChecked: false,
            isStarred: false
        ),
        ShoppingBag(
            shopItem: "사이다 사기",
            isChecked: false,
            isStarred: false
        ),
        ShoppingBag(
            shopItem: "아이패드 케이스 최저가 알아보기",
            isChecked: false,
            isStarred: false
        ),
        ShoppingBag(
            shopItem: "양말",
            isChecked: false,
            isStarred: false
        ),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.backgroundColor = .systemGray6
        backgroundView.layer.cornerRadius = 10
        
        searchBarTextField.placeholder = "무엇을 구매하실 건가요?"
        searchBarTextField.backgroundColor = .systemGray6
        searchBarTextField.borderStyle = .none
        
        searchButton.setTitle("추가", for: .normal)
        searchButton.setTitleColor(.black, for: .normal)
        searchButton.tintColor = .systemGray5
        searchButton.layer.cornerRadius = 5
    }
    // section의 수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return shoppingList.count
    }
    
    // row의 수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    // data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        
        let checkStatus = shoppingList[indexPath.section].isChecked ? "checkmark.square.fill" : "checkmark.square"
        
        let starStatus = shoppingList[indexPath.section].isStarred ? "star.fill" : "star"

        cell.leadingButton.tag = indexPath.section * 2
        cell.leadingButton.setImage(UIImage(systemName: checkStatus), for: .normal)
        cell.leadingButton.setTitle("", for: .normal)
        cell.leadingButton.tintColor = .black
        cell.leadingButton.addTarget(self, action: #selector(checkBoxOnClick), for: .touchUpInside) 
        
        
        cell.trailingButton.tag = indexPath.section * 2 + 1
        cell.trailingButton.setImage(UIImage(systemName: starStatus), for: .normal)
        cell.trailingButton.setTitle("", for: .normal)
        cell.trailingButton.tintColor = .black
        cell.trailingButton.addTarget(self, action: #selector(starOnClick), for: .touchUpInside)
        
        cell.contentLabel.text = shoppingList[indexPath.section].shopItem
        
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    @objc func checkBoxOnClick(sender: UIButton) {
        let index = sender.tag / 2
        shoppingList[index].isChecked = !shoppingList[index].isChecked
        tableView.reloadData()
    }
    
    @objc func starOnClick(sender: UIButton) {
        let index = (sender.tag - 1) / 2
        shoppingList[index].isStarred = !shoppingList[index].isStarred
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    // height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    // header -> spacing
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\n"
    }
    
    // 추가 버튼 눌렀을 때 동작
    @IBAction func addButtonOnTap(_ sender: UIButton) {
        shoppingList.append(ShoppingBag(
            shopItem: searchBarTextField.text!,
            isChecked: false,
            isStarred: false
        ))
        tableView.reloadData()
        view.endEditing(true)
        
        // 화면 초기화
        searchBarTextField.text = ""
    }

    // 키보드 return 눌렀을 때
    @IBAction func returnOnTap(_ sender: UITextField) {
        shoppingList.append(ShoppingBag(
            shopItem: searchBarTextField.text!,
            isChecked: false,
            isStarred: false
        ))
        tableView.reloadData()
        view.endEditing(true)
        
        // 화면 초기화
        searchBarTextField.text = ""
    }
    
    // edit 설정 여부 -> true
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // set edit style(forRowAt)
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            shoppingList.remove(at: indexPath.section)
            
            // data view 맞춰주기
            tableView.reloadData()
        }
    }
    
}
