//
//  stdio.swift
//  stdio
//
//  Created by kamimura on 8/21/14.
//  Copyright (c) 2014 kamimura. All rights reserved.
//

import Foundation

// 標準入力(STDIN)から読み込む
func input(msg:String = "") -> String {
    print(msg)
    var in_fh = NSFileHandle.fileHandleWithStandardInput()
    var data = in_fh.availableData
    var s = NSString(data: data, encoding: NSUTF8StringEncoding)
    s = s.substringToIndex(s.length - 1)
    return s
}

func read(path:String) -> String? {
    return String.stringWithContentsOfFile(path)
}

func print(s:String, path:String, end:String = "\n") {
    (s + end).writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
}

func error(msg:String) {
    let stderr = NSFileHandle.fileHandleWithStandardError()
    stderr.writeData((msg + "\n").dataUsingEncoding(NSUTF8StringEncoding))
    exit(1)
}

// コマンドライン引数
let argv:[String] = NSProcessInfo.processInfo().arguments.map({(x:AnyObject) -> String in x as String})
