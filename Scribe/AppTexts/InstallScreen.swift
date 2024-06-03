/**
 * The app text for the Scribe app's keyboard installation screen.
 *
 * Copyright (C) 2023 Scribe
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import UIKit

/// Formats and returns the directions of the installation guidelines.
func getInstallationDirections(fontSize: CGFloat) -> NSMutableAttributedString {
  let globeString = getGlobeIcon(fontSize: fontSize)

  let startOfBody = NSMutableAttributedString(string: """
  1.\u{0020}
  """, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)])

  var settingsLink = NSMutableAttributedString()
  let linkText = NSLocalizedString("install.settingsLink", comment: "Text for the link to the scribe section in the settings")
  settingsLink = addHyperLinks(
    originalText: linkText,
    links: [linkText: "MakeTextLink"], // placeholder as there's a button over it
    fontSize: fontSize
  )

  let installStart = concatAttributedStrings(left: startOfBody, right: settingsLink)

  let installDirections = NSMutableAttributedString(string: "\n\n2. " + NSLocalizedString("install.text", comment: "Main text for the installation screen"), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)])

  let toAppend = NSMutableAttributedString(string: " " + NSLocalizedString("keyboards", comment: "Keyboards button in the settings"), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)])
  toAppend.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: fontSize), range: NSRange(location: 0, length: toAppend.length))
  installDirections.append(toAppend)

  installDirections.append(NSMutableAttributedString(string: "\n\n3. " + NSLocalizedString("install.text2", comment: "Main text for the installation screen 2") + " ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)]))

  installDirections.append(globeString)

  installDirections.append(NSMutableAttributedString(string: " " + NSLocalizedString("install.text3", comment: "Main text for the installation screen 3"), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)]))

  return concatAttributedStrings(left: installStart, right: installDirections)
}

/// Formats and returns the full text for the installation guidelines.
///
/// - Parameters
///  - fontSize: the size of the font derived for the app text given screen dimensions.
func setInstallation(fontSize: CGFloat) -> NSMutableAttributedString {
  return getInstallationDirections(fontSize: fontSize)
}
