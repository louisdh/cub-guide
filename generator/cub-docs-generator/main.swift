//
//  main.swift
//  SilverFox-gen
//
//  Created by Louis D'hauwe on 23/05/2017.
//  Copyright © 2017 Silver Fox. All rights reserved.
//

import Foundation
import Files
import SwiftMarkdown

func generateHTML(markdown: String) throws -> String {
	
	var markdown = markdown
	
	var html = ""

	while let slice = markdown.slice(from: "```cub", to: "```") {
		
		let origString = "```cub\(slice)```"
		
		guard let syntaxHighlighted = slice.syntaxHighlightedHTMLAsSwift else {
			runtimeError("Could not generate syntax highlighted string for file")
		}
		
		var newString = "<code class=\"language-swift\">\(syntaxHighlighted)</code>"
		
		if origString.contains("\n") {
			newString = "<pre>\(newString)</pre>"
		}
		
		markdown = markdown.replacingOccurrences(of: origString, with: newString)
		
	}
	
	html = try markdownToHTML(markdown, options: [.hardBreaks, .normalize])

	return html
	
}

let projectRoot = "~/projects/oss/cub-guide/"

let docFile = try File(path: projectRoot + "doc.md")

let markdown = try docFile.readAsString(encoding: .utf8)

let body = try generateHTML(markdown: markdown)

let head = try File(path: projectRoot + "components/book-head.html").readAsString(encoding: .utf8)
let foot = try File(path: projectRoot + "components/book-foot.html").readAsString(encoding: .utf8)

var html = head + body + foot

let folder = try Folder(path: projectRoot + "output")

try folder.createFile(named: "book.html", contents: html)

print("Done!")
