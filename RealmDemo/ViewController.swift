//
//  ViewController.swift
//  RealmDemo
//
//  Created by apple on 2017/9/3.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 使用的方法和常规 Swift 对象的使用方法类似
        let myDog = Dog()
        myDog.name = "大黄"
        myDog.age = 1
        print(" 狗狗的名字： \(myDog.name)")
        
        // 获取默认的 Realm 数据库
        let realm = try! Realm()
        
        // 检索 Realm 数据库，找到小于 2 岁 的所有狗狗
        let puppies = realm.objects(Dog.self).filter("age < 2")
        print(puppies.count) // => 0 因为目前还没有任何狗狗被添加到了 Realm 数据库中
        
        // 数据持久化操作十分简单
        try! realm.write {
            realm.add(myDog)
        }
        
        // 检索结果会实时更新
        print(puppies.count) // => 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapAdd(_ sender: UIButton) {
        print("tapAdd")
    }

    @IBAction func tapCount(_ sender: UIButton) {
        print("tapCount")
    }
}

// 定义模型的做法和定义常规 Swift 类的做法类似
class Dog: Object {
    dynamic var name = ""
    dynamic var age = 0
}
