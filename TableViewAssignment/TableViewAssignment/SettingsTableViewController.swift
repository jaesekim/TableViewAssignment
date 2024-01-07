//
//  SettingsTableViewController.swift
//  TableViewAssignment
//
//  Created by 김재석 on 1/8/24.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    let firstSectionContents = [
        "공지사항",
        "실험실",
        "버전 정보",
    ]
    
    let secondSectionContents = [
        "개인 / 보안",
        "알림",
        "채팅",
        "멀티프로필"
    ]
    
    let thirdSectionContents = [
        "고객센터 / 도움말"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "설정"

    }
    
    // 섹션의 개수
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    // 1. 행의 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return firstSectionContents.count
        } else if section == 1{
            return secondSectionContents.count
        } else {
            return thirdSectionContents.count
        }
    }
    
    // 2. 데이터 가져오기, 보여주기
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 재사용 프로세스
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewController")
        
        // 악세사리 오른쪽 끝
        //        cell?.accessoryType = .disclosureIndicator
        
        // 컨텐츠 배정 
        if indexPath.section == 0 {
            cell?.textLabel?.text = firstSectionContents[indexPath.row]
        } else if indexPath.section == 1 {
            cell?.textLabel?.text = secondSectionContents[indexPath.row]
        } else {
            cell?.textLabel?.text = thirdSectionContents[indexPath.row]
        }
        
        cell?.textLabel?.font = .systemFont(ofSize: 12)
        
        return cell!
        
    }
    
    // 3. height of cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    // header
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "전체 설정"
        } else if section == 1{
            return "개인 설정"
        } else {
            return "기타"
        }
    }
}
