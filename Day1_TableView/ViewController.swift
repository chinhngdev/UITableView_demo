//
//  ViewController.swift
//  Day1_TableView
//
//  Created by Chinh Ng on 01/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var booksCategories: [BookCategory] = [
        BookCategory(category: "Cooking", id: 0),
        BookCategory(category: "Business", id: 1),
        BookCategory(category: "Comics", id: 2),
        BookCategory(category: "Technology", id: 3),
        BookCategory(category: "History", id: 4),
        BookCategory(category: "Health", id: 5),
        BookCategory(category: "Horror", id: 6),
        BookCategory(category: "Self-help", id: 7),
        BookCategory(category: "Sience", id: 8),
        BookCategory(category: "Travel", id: 9),
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        registerTableViewCell()
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func registerTableViewCell() {
        let bookCell = UINib(nibName: "BookCell", bundle: nil)
        self.tableView.register(bookCell, forCellReuseIdentifier: "BookCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return booksCategories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Tại sao thứ tự các section in ra ngẫu nhiên mà không theo thứ tự trong mảng?
//        print("section: \(booksCategories[section].category), id: \(booksCategories[section].id)")
        return booksCategories[section].books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
        let books = booksCategories[indexPath.section].books
        cell.bookTitle.text = books[indexPath.row].title
        cell.bookID.text = String(books[indexPath.row].id)
        
        if indexPath.row % 2 == 0{
            cell.backgroundColor = .systemGreen
        } else {
            cell.backgroundColor = .systemRed
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return booksCategories[section].category
    }
    
    // MARK: - Swipe từ phải sang để xoá
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, completionHandler in
            self.booksCategories[indexPath.section].books.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        let swipe = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipe
    }
    
}
