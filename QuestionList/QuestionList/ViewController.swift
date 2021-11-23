//
//  ViewController.swift
//  QuestionList
//
//  Created by Anton Melnychuk on 22.11.2021.
//

import UIKit

class ViewController: UIViewController {

    struct InquirySignatureSection {
        let header: String?
        let rows: [InquirySignatureRow]
    }

    struct InquirySignatureRow {
        let fieldName: String
        let fieldValue: String
    }
    
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    private var sections: [InquirySignatureSection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sections = createSections()
        tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func createSections() -> [InquirySignatureSection] {
        
        let rows: [InquirySignatureRow] = [ InquirySignatureRow(fieldName: "Topic", fieldValue: "Covid-2020"),
                                            InquirySignatureRow(fieldName: "Address", fieldValue: "1746 Steeles Ave Toronto Ontario M3J 3A8"),
                                            InquirySignatureRow(fieldName: "Question", fieldValue: "How many pansyometers are travelled between warehouse and customer and what is the driverÂs fuel mileage in poppyomiscusÂ per marigoldetum?"),
                                            InquirySignatureRow(fieldName: "Question", fieldValue: "Long answer (LA) questions require respondents to write detailed answers in response to open-ended questions. You can enable users to respond in multiple sentences, paragraph answers, or mathematical explanations and calculations?"),
                                            InquirySignatureRow(fieldName: "Question", fieldValue: "Long answer (LA) questions require respondents to write detailed answers in response to open-ended questions. You can enable users to respond in multiple sentences, paragraph answers, or mathematical explanations and calculations.Long answer (LA) questions require respondents to write detailed answers in response to open-ended questions. You can enable users to respond in multiple sentences, paragraph answers, or mathematical explanations and calculations?"),
                                            InquirySignatureRow(fieldName: "Looooooooooong title mverunvpoiterwmv opuerwnv yutmewyropvmtyerucm tpoeiwryt bvnewoprb npyeowmrtopcm,perwtv mvperoivm opierwmto yeirouwytmv p eiw mrtvemerwm voseirmv iomewpvi mwitrmrep ivwmyaormv[ ", fieldValue: "Question answer"),
                                            InquirySignatureRow(fieldName: "Name", fieldValue: "Amer Rahman")
        ]
        
        let sections: [InquirySignatureSection] = [ InquirySignatureSection(header: "", rows: [rows[0], rows[1], rows[5], rows[6]]),
                                                    InquirySignatureSection(header: "Question1", rows: [rows[2]]),
                                                    InquirySignatureSection(header: "Question2", rows: [rows[3]]),
                                                    InquirySignatureSection(header: "Question3", rows: [rows[4]])
        ]

        return sections
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.title.text = sections[indexPath.section].rows[indexPath.row].fieldName
        cell.textValue.text = sections[indexPath.section].rows[indexPath.row].fieldValue
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: cell.bounds.size.width)
        return cell
    }
 
}

