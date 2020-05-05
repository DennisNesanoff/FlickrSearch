//
//  Result.swift
//  FlickrSearch
//
//  Created by Dennis Nesanoff on 05.05.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import Foundation

enum Result<ResultType> {
  case results(ResultType)
  case error(Error)
}
