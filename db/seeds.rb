[ "Proton",
  "Perodua",
  "Honda",
  "Toyota",
  "Nissan",
  "Mazda",
  "Mitsubishi",
  "BMW",
  "Mercedez",
  "Suzuki",
  "Kia"
].each do |name|
  Brand.find_or_create_by(name: name)
end

[ [1, "Suprima S"],
  [1, "Persona"],
  [1, "Exora"],
  [2, "Myvi"],
  [2, "Viva"],
  [2, "Alza"],
  [3, "CRV"],
  [3, "Jazz"],
  [3, "City"],
  [4, "Estima"],
  [4, "Camry"],
  [4, "Alphard"],
  [5, "Grand Livina"],
  [6, "Mazda 5"],
  [7, "Triton"],
  [7, "Lancer"],
  [8, "M3"],
  [8, "M5"],
  [9, "E320"],
  [9, "E220"],
  [10, "Swift"],
  [11, "Naza"],
].each do |brand, name|
  Model.find_or_create_by(brand_id: brand, name: name)
end
