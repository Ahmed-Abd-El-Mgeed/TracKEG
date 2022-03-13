//
//  URLS.swift
//  TrackEG
//
//  Created by Other Logic on 12/2/20.
//  Copyright © 2020 Odiggo. All rights reserved.
//

import Foundation



var APIKEY: String               = "a4c77079dbcd4f135a17555b9258f575"
var BASEURL: String              = "https://api.themoviedb.org/3/"
var IMAGEURL: String             = "http://image.tmdb.org/t/p/w780/"


class EndPoints {
    public static let moviesUrl     = BASEURL + "movie/"
    public static let searchUrl     = BASEURL + "search/movie"
    public static let movieUrl      = BASEURL + "movie/"
}
