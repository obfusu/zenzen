//
//  CbzParser.swift
//  zenzen
//
//  Created by Ganesh on 18/11/21.
//

import Foundation
import SwiftZip

let ZIP_PATH = "/Users/ganesh/Downloads/done/violinist/116.cbz"

func parseZip() -> String {
    var list = Array<String>()

    let archive = try! ZipMutableArchive(path: ZIP_PATH)

    // Filter only .jpg files
    var e = archive.entries().filter{ try! $0.getName().hasSuffix(".jpg") }
    // Sort based on file names
    e = e.sorted(by: sortByFileNames(this:that:))

    for entry in e {
        list.append(try! entry.getName())
    }

    return list.joined(separator: ",")
}

func sortByFileNames (this: ZipEntry, that: ZipEntry) -> Bool {
    let firstFileName = URL(string: try! this.getName())?.deletingPathExtension().lastPathComponent ?? ""
    let secondFileName = URL(string: try! that.getName())?.deletingPathExtension().lastPathComponent ?? ""

    let a = Int(firstFileName) ?? 0
    let b = Int(secondFileName) ?? 0

    return (a < b)
}
