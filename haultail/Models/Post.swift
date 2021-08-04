//
//  Post.swift
//  haultail
//
//  Created by Eugene Lysenko on 04.08.2021.
//

class Post: Decodable {
    let post_ID: Int
    let post_title: String
    // let post_thumbnail: String?
    // let post_image: String?
    let post_content: String
    let post_date: String
    
    enum CodingKeys: String, CodingKey {
        case post_ID
        case post_title
        // case post_thumbnail
        // case post_image
        case post_content
        case post_date
    }
}

extension Post: PostDisplayable {
    var labelID: String {
        return "\(post_ID)"
    }
    
    var labelTitle: String {
        post_title
        
    }
    
    /*
    var labelThumbnail: String? {
        post_thumbnail
        
    }
    
    var labelImage: String? {
        post_image
        
    }
    */
    
    var labelContent: String {
        post_content
    }
    
    var labelDate: String {
        post_date
    }
}
