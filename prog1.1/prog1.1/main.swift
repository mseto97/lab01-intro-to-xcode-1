//
//  main.swift
//  prog1.1
//
//  Created by Megan Seto on 7/11/18.
//  Copyright © 2018 Megan Seto. All rights reserved
//

import Foundation

/*
 * Checks a word for emoji match and returns
 * corresponding unicode. If no emoji match found.
 * the word string is returned unchanged.
 *
 * @param: word - string to match with emoji
 *
 * @return: String - utf code for matched emoji
 *                   or the original string
 */

func emojicode(word: String) -> String {
    
    // Converts characters in string to lower case
    switch word.lowercased(){
    case "beer":
        return "\u{1F37A}"
        
    case "television", "tv":
        return "\u{1F4FA}"
        
        // Switch statements must cover all the same cases,
        // the default case is taken when no other case matches
        
    default:
        return word

    }
}


func emojiate(str: String) -> String {
    
    // Breaks the string into separate word tokens.
    // Start with the empty token
    var word: String = ""
    var result: String = ""
    
    // Iterate over every character in the string
    for char: Character in str {
        
        // Check the character...
        if (String(char) >= "A" && String(char) <= "z"){
            
            // If the next character is a letter, add it to te word token
            word.append(char)
        } else {
            
            // If the next character is not a letter, try convert the last word token
            // to emoji and add it to the result string
            result += emojicode(word: word)
            
            // Add non character letter to the result. Have to use append
            // Cannot add a character to a string
            result.append(char)
            
            //clear the word
            word = ""
            
        }
    }
    
    // Add the last word token to the result string
    // match it with emoji if possible
    result += emojicode(word: word)
    
    // Return the resulting string
    return result
}

//Define a string constant
let myString = "No TV and no beer make Homer something something."

//Convert it to emoji string
let emojiString = emojiate(str: myString);

//Prunt the emojistring
print(emojiString)
