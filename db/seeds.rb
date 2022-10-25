Category.create!(name: "Celulares")
Category.create!(name: "Computadores")
Category.create!(name: "Periféricos")

Brand.create!(name: "Apple")
Brand.create!(name: "Samsung")
Brand.create!(name: "Logitech")

Product.create!(name: "Samsung A13", 
    price: 100000, 
    description: "Smartphone",
    inventory: 50, 
    category_id: 1,
    brand_id: 2)
Product.create!(name: "iPhone 14", 
    price: 500000, 
    description: "Smartphone",
    inventory: 20, 
    category_id: 1,
    brand_id: 1)
Product.create!(name: "iPhone 13", 
    price: 400000, 
    description: "Smartphone",
    inventory: 30, 
    category_id: 1,
    brand_id: 1)
Product.create!(name: "Samsung Odyssey", 
    price: 500000, 
    description: "Laptop",
    inventory: 10, 
    category_id: 2,
    brand_id: 2)
Product.create!(name: "Samsung Book S", 
    price: 300000, 
    description: "Laptop",
    inventory: 10, 
    category_id: 2,
    brand_id: 2)
Product.create!(name: "Macbook Air", 
    price: 600000, 
    description: "Laptop",
    inventory: 10, 
    category_id: 2,
    brand_id: 1)
Product.create!(name: "Mouse Logitech", 
    price: 3000, 
    description: "Mouse",
    inventory: 60, 
    category_id: 3,
    brand_id: 3)
Product.create!(name: "Mouse Gamer Logitech", 
    price: 25000, 
    description: "Mouse Gamer",
    inventory: 30, 
    category_id: 3,
    brand_id: 3)
Product.create!(name: "Teclado Logitech", 
    price: 15000, 
    description: "Teclado",
    inventory: 60, 
    category_id: 3,
    brand_id: 3)
Product.create!(name: "Headset Logitech", 
    price: 15000, 
    description: "Headset",
    inventory: 60, 
    category_id: 3,
    brand_id: 3)