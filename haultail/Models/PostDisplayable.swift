//
//  File.swift
//  haultail
//
//  Created by Eugene Lysenko on 04.08.2021.
//

protocol PostDisplayable {
    var labelID: String { get }
    var labelTitle: String { get }
    var labelThumbnail: String { get }
    var labelImage: String { get }
    var labelContent: String { get }
    var labelDate: String { get }
}
