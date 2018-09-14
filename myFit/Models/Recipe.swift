//
//  Edamam_Recipe.swift
//  myFit
//
//  Created by Winston Maragh on 8/21/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


struct RecipeJSON: Codable {
    var hits: [Hit]
    var count: Int //15211
    var more: Bool //true
}

struct Hit: Codable {
    var recipe: Recipe
    //    var bookmarked: Bool //false
    //    var bought: Bool //false
}

struct Recipe: Codable {
    var label: String //"Grilled Butterflied Chicken Recipe",
    var image: String // "https://www.edamam.com/web-img/7a2/7a2f41a7891e8a8f8a087a96930c6463.jpg",
    var calories: Float //2499.628483072875,
    var yield: Int //4,
    var dietLabels: [String?] //["Low-Carb"]
    var ingredientLines: [String] //["1 whole chicken, 3 1/2 to 4 pounds", "Kosher salt and freshly ground black pepper"]
    var healthLabels: [String] //["Sugar-Conscious", "Peanut-Free", "Tree-Nut-Free", "Alcohol-Free"]
    var totalTime: Double //60,
    var source: String //"Serious Eats",
    //    var url: String //"http://www.seriouseats.com/recipes/2012/08/grilled-butterflied-chicken-recipe.html",
    //    var uri: String //"http://www.edamam.com/ontologies/edamam.owl#recipe_3da1169eb633a5e4607890ebf7dee89f",
    //    var shareAs: String //"http://www.edamam.com/recipe/grilled-butterflied-chicken-recipe-3da1169eb633a5e4607890ebf7dee89f/chicken/alcohol-free/591-722-cal",
    //    var cautions: [String?] //
    //    var totalWeight: Float //1714.2190942311247,
    //    var totalNutrients: TotalNutrient //Total nutrients for the entire recipe
    //    var totalDaily: TotalNutrient //% daily value for the entire recipe
    //    var digest: [Digest]
}

struct TotalNutrient: Codable {
    var ENERC_KCAL: NutrientInfo
    var FAT: NutrientInfo
    var FASAT: NutrientInfo
    var FATRN: NutrientInfo
    var FAMS: NutrientInfo
    var FAPU: NutrientInfo
    var CHOCDF: NutrientInfo
    var FIBTG: NutrientInfo
    var SUGAR: NutrientInfo
    var PROCNT: NutrientInfo
    var CHOLE: NutrientInfo
    var NA: NutrientInfo
    var CA: NutrientInfo
    var MG: NutrientInfo
    var K: NutrientInfo
    var FE: NutrientInfo
    var ZN: NutrientInfo
    var P: NutrientInfo
    var VITA_RAE: NutrientInfo
    var VITC: NutrientInfo
    var THIA: NutrientInfo
    var RIBF: NutrientInfo
    var NIA: NutrientInfo
    var VITB6A: NutrientInfo
    var FOLDFE: NutrientInfo
    var FOLFD: NutrientInfo
    var VITB12: NutrientInfo
    var VITD: NutrientInfo
    var TOCPHA: NutrientInfo
    var VITK1: NutrientInfo
}

struct NutrientInfo: Codable {
    var label: String //"Energy",
    var quantity: Double //2499.628483072875,
    var unit: String //"kcal"
}

struct Digest: Codable {
    var label: String // "Fat"
    var tag: String // "FAT"
    var schemaOrgTag: String // "fatContent"
    var total: Double // 174.35943285279748
    var hasRDI: Bool // true
    var daily: Double //268.2452813119961
    var unit: String // "g"
    var sub: [Digest]?
}


enum DietHealthCriteria: String {
    //Diet
    case Balanced = "balanced" // Protein/Fat/Carb values in 15/35/50 ratio
    case HighFiber = "high-fiber" // More than 5g fiber per serving
    case HighProtein = "high-protein" // More than 50% of total calories from proteins
    case LowCarb = "low-carb" // Less than 20% of total calories from carbs
    case LowFat = "low-fat" // Less than 15% of total calories from fat
    case LowSodium = "low-sodium" // Less than 140mg Na per serving
    
    //Health
    case Alcohol = "alcohol-free" // No alcohol used or contained
    case Celery = "celery-free"  // does not contain celery or derivatives
    case Crustacean = "crustacean-free" // does not contain crustaceans (shrimp, lobster etc.) or derivatives
    case Dairy = "dairy-free" // No dairy; no lactose
    case Eggs  = "egg-free" // No eggs or products containing eggs
    case Fish = "fish-free" // No fish or fish derivatives
    case Gluten = "gluten-free"    // No ingredients containing gluten
    case LupineFree = "lupine-free" // does not contain lupine or derivatives
    case MustardFree = "mustard-free" // does not contain mustard or derivatives
    case WheatFree = "wheat-free" // No wheat, can have gluten though
    case PorkFree = "pork-free" // does not contain pork or derivatives
    case RedMeatFree = "red-meat-free" // does not contain beef, lamb, pork, duck, goose, game, horse, and other types of red meat or products containing red meat.
    case SesameFree = "sesame-free" // does not contain sesame seed or derivatives
    case Shellfish = "shellfish-free" // No shellfish or shellfish derivatives
    case Soy = "soy-free"    // No soy or products containing soy
    case TreeNuts = "tree-nut-free" // No tree nuts or products containing tree nuts
    case Peanuts = "peanut-free"    // No peanuts or products containing peanuts
    case NoOilAdded = "No-oil-added" // No oil added except to what is contained in the basic ingredients
    case NoSugar = "low-sugar"    // No simple sugars – glucose, dextrose, galactose, fructose, sucrose, lactose, maltose
    
    case LowSugar = "sugar-conscious" // Less than 4g of sugar per serving
    case LowPotassium = "low-potassium" // Less than 150mg per serving
    case KidneyFriendly = "kidney-friendly"// per serving – phosphorus less than 250 mg AND potassium less than 500 mg AND sodium: less than 500 mg
    
    case Vegan = "vegan" // No meat, poultry, fish, dairy, eggs or honey
    case Vegetarian = "vegetarian" // No meat, poultry, or fish
    case Pescatarian = "pescatarian"    // Does not contain meat or meat based products, can contain dairy and fish
    case Paleo = "paleo"    // Excludes what are perceived to be agricultural products; grains, legumes, dairy products, potatoes, refined salt, refined sugar, and processed oils
    case Kosher = "kosher" // contains only ingredients allowed by the kosher diet. However it does not guarantee kosher preparation of the ingredients themselves
}








/*  -- Recipe Search: Parameters
 
 Parameter       Required    Type
 
 q              yes*         string
 Query text. For example q=chicken. This or the r parameter are required
 
 r               yes*        string
 Returns information about a specific recipe based on its ID ie. -r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_9b5945e03f05acbf9d69625138385408 This or the q parameter are required
 
 app_id          yes         string
 Your 3scale application ID
 
 app_key         yes         string
 Your 3scale application key (please note app_id/app_key are an ordered pair)
 
 from            no          integer
 First result index (default 0). Example: from=20
 
 to              no          integer
 Last result index (exclusive, default from + 10). Example: to=30
 
 ingr            no          integer
 Maximum number of ingredients. Example: ingr=5
 
 diet            no          enum
 Diet label: one of “balanced”, “high-protein”, “high-fiber”, “low-fat”, “low-carb”, “low-sodium”
 
 health          no          enum
 Health label: One of the Health api parameters listed in Diet and Health Labels table at the end of this documentation. For example “peanut-free”, “tree-nut-free”, “soy-free”, “fish-free”, “shellfish-free”
 
 calories        no          range
 The format is calories=RANGE where RANGE is replaced by the value in kcal. RANGE is in one of MIN+, MIN-MAX or MAX, where MIN and MAX are non-negative integer numbers. The + symbol needs to be properly encoded. Examples: “calories=100-300” will return all recipes with which have between 100 and 300 kcal per serving.
 
 time            no          range
 Time range for the total cooking and prep time for a recipe . The format is time=RANGE where RANGE is replaced by the value in minutes. RANGE is in one of MIN+, MIN-MAX or MAX, where MIN and MAX are non-negative integer numbers. The + symbol needs to be properly encoded. Examples: “time=1%2B” will return all recipes with available total time greater then 1 minute
 
 excluded        no          string
 Excluding recipes with certain ingredients. The format is excluded=FOOD where FOOD is replaced by the name of the specific food you don’t want to be present in the recipe results. More than one food can be excluded at the same time. Example: excluded=vinegar&excluded=pretzel will exclude any recipes which contain vinegar or pretzels in their ingredient list
 
 callback        no          string
 Callback parameter for JSONP. This will “envelop” the result in a JavaScript function call to the specified callback. Optional
 
 */
