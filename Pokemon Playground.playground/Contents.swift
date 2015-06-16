//: Playground - noun: a place where people can play

import UIKit

class Pokemon {
  var type = "none"
  var health = 100
  var level = 1
  var experience = 0
  var attack = 5
  
  init (type: String) {
    self.type = type
  }
  
  func levelUp() {
    if self.experience > (self.level * 100) {
      self.level++
      self.health = (self.health + (self.level * 10))
      self.attack = self.attack + (self.level * 2)
      self.experience = 0
      return
    } else {
        return
      }
    }
  
  func fightRound() -> Int {
    let damage = (self.attack + (Int(arc4random_uniform(9) + 1)))
    return damage
    }
  
}

func combat(pokemon1 : Pokemon, pokemon2 : Pokemon) -> String {
 return "won!"
}

let mySquirtle = Pokemon (type: "water")
let myCharmander = Pokemon (type: "fire")
let myPichu = Pokemon (type: "electric")
let myBulbasaur = Pokemon(type: "grass")
let myOddish = Pokemon(type: "poison")

class PokemonLevelTwo : Pokemon {
  let specialDamage = 10
}

let myWartortle = PokemonLevelTwo (type: "water")
let myCharmeleon = PokemonLevelTwo (type: "fire")
let myPikachu = PokemonLevelTwo (type: "electric")
let myIvysaur = PokemonLevelTwo (type: "grass")
let myGloom = PokemonLevelTwo (type: "posison")

