//
//  UIApplication+Extension.swift
//  NewsHarian
//
//  Created by Ary Sugiarto on 20/12/22.
//

import Foundation

import SwiftUI

extension UIApplication {
      func dismissKeyboard() {
          sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
}
