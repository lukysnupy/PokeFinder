//
//  ChoosePokemonVC.swift
//  PokeFinder
//
//  Created by Lukáš Růžička on 04.04.18.
//  Copyright © 2018 Lukáš Růžička. All rights reserved.
//

import UIKit

class ChoosePokemonVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var geoFire: GeoFire!
    var location: CLLocation!
    
    var filteredPokemons: [String]!
    var inSearchMode = false

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
        
        searchBar.returnKeyType = UIReturnKeyType.done
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            if inSearchMode {
                let index = pokemons.index(of: filteredPokemons[indexPath.row])!
                cell.configureCell(name: pokemons[index], pokeId: index + 1)
            } else {
                cell.configureCell(name: pokemons[indexPath.row], pokeId: indexPath.row + 1)
            }
            return cell
        }
        return PokeCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if inSearchMode {
            let pokeId = pokemons.index(of: filteredPokemons[indexPath.row])! + 1
            geoFire.setLocation(location, forKey: "\(pokeId)")
        } else {
            geoFire.setLocation(location, forKey: "\(indexPath.row + 1)")
        }
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredPokemons.count
        } else {
            return pokemons.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            tableView.reloadData()
            view.endEditing(true)
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercased()
            filteredPokemons = pokemons.filter({$0.range(of: lower) != nil})
            tableView.reloadData()
        }
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    let pokemons = [
        "bulbasaur",
        "ivysaur",
        "venusaur",
        "charmander",
        "charmeleon",
        "charizard",
        "squirtle",
        "wartortle",
        "blastoise",
        "caterpie",
        "metapod",
        "butterfree",
        "weedle",
        "kakuna",
        "beedrill",
        "pidgey",
        "pidgeotto",
        "pidgeot",
        "rattata",
        "raticate",
        "spearow",
        "fearow",
        "ekans",
        "arbok",
        "pikachu",
        "raichu",
        "sandshrew",
        "sandslash",
        "nidoran-f",
        "nidorina",
        "nidoqueen",
        "nidoran-m",
        "nidorino",
        "nidoking",
        "clefairy",
        "clefable",
        "vulpix",
        "ninetales",
        "jigglypuff",
        "wigglytuff",
        "zubat",
        "golbat",
        "oddish",
        "gloom",
        "vileplume",
        "paras",
        "parasect",
        "venonat",
        "venomoth",
        "diglett",
        "dugtrio",
        "meowth",
        "persian",
        "psyduck",
        "golduck",
        "mankey",
        "primeape",
        "growlithe",
        "arcanine",
        "poliwag",
        "poliwhirl",
        "poliwrath",
        "abra",
        "kadabra",
        "alakazam",
        "machop",
        "machoke",
        "machamp",
        "bellsprout",
        "weepinbell",
        "victreebel",
        "tentacool",
        "tentacruel",
        "geodude",
        "graveler",
        "golem",
        "ponyta",
        "rapidash",
        "slowpoke",
        "slowbro",
        "magnemite",
        "magneton",
        "farfetchd",
        "doduo",
        "dodrio",
        "seel",
        "dewgong",
        "grimer",
        "muk",
        "shellder",
        "cloyster",
        "gastly",
        "haunter",
        "gengar",
        "onix",
        "drowzee",
        "hypno",
        "krabby",
        "kingler",
        "voltorb",
        "electrode",
        "exeggcute",
        "exeggutor",
        "cubone",
        "marowak",
        "hitmonlee",
        "hitmonchan",
        "lickitung",
        "koffing",
        "weezing",
        "rhyhorn",
        "rhydon",
        "chansey",
        "tangela",
        "kangaskhan",
        "horsea",
        "seadra",
        "goldeen",
        "seaking",
        "staryu",
        "starmie",
        "mr-mime",
        "scyther",
        "jynx",
        "electabuzz",
        "magmar",
        "pinsir",
        "tauros",
        "magikarp",
        "gyarados",
        "lapras",
        "ditto",
        "eevee",
        "vaporeon",
        "jolteon",
        "flareon",
        "porygon",
        "omanyte",
        "omastar",
        "kabuto",
        "kabutops",
        "aerodactyl",
        "snorlax",
        "articuno",
        "zapdos",
        "moltres",
        "dratini",
        "dragonair",
        "dragonite",
        "mewtwo",
        "mew"]
}
