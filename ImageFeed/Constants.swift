//
//  Constants.swift
//  ImageFeed
//
//  Created by KraSSavchiK on 23.02.2024.

import Foundation

let AccessKey = "Acd3vxCR6cKAckws_BeLD5KmW47sG3UrdcNsLUyEnbY"
let SecretKey = "WwI-wMBijSwSSC1B9rNS8mavx26p3Eo1l41XMj3cAS0"
let RedirectURI = "urn:ietf:wg:oauth:2.0:oob"
let AccessScope = "public+read_user+write_likes"

var DefaultBaseURL: URL {
    guard let url = URL(string: "https://api.unsplash.com") else {
        preconditionFailure("Error while implementing DefaultBaseURL!")
    }
    return url
}

