Category.create!(name: "Celulares")
Category.create!(name: "Computadores")
Category.create!(name: "Periféricos")

Brand.create!(name: "Apple")
Brand.create!(name: "Samsung")
Brand.create!(name: "Logitech")

Product.create!(name: "Samsung A13", 
    price_in_cents: 100000, 
    description: "Smartphone",
    inventory: 50, 
    category_id: 1,
    brand_id: 2)
Product.create!(name: "iPhone 14", 
    price_in_cents: 500000, 
    description: "Smartphone",
    inventory: 20, 
    category_id: 1,
    brand_id: 1)
Product.create!(name: "iPhone 13", 
    price_in_cents: 400000, 
    description: "Smartphone",
    inventory: 30, 
    category_id: 1,
    brand_id: 1)
Product.create!(name: "Samsung Odyssey", 
    price_in_cents: 500000, 
    description: "Laptop",
    inventory: 10, 
    category_id: 2,
    brand_id: 2)
Product.create!(name: "Samsung Book S", 
    price_in_cents: 300000, 
    description: "Laptop",
    inventory: 10, 
    category_id: 2,
    brand_id: 2)
Product.create!(name: "Macbook Air", 
    price_in_cents: 600000, 
    description: "Laptop",
    inventory: 10, 
    category_id: 2,
    brand_id: 1)
Product.create!(name: "Mouse Logitech", 
    price_in_cents: 3000, 
    description: "Mouse",
    inventory: 60, 
    category_id: 3,
    brand_id: 3)
Product.create!(name: "Mouse Gamer Logitech", 
    price_in_cents: 25000, 
    description: "Mouse Gamer",
    inventory: 30, 
    category_id: 3,
    brand_id: 3)
Product.create!(name: "Teclado Logitech", 
    price_in_cents: 15000, 
    description: "Teclado",
    inventory: 60, 
    category_id: 3,
    brand_id: 3)
Product.create!(name: "Headset Logitech", 
    price_in_cents: 15000, 
    description: "Headset",
    inventory: 60, 
    category_id: 3,
    brand_id: 3)

User.create!(email: "listaaut@gmail",
    password: "123456",
    wallet: 1,
    is_admin: true)

User.create!(email: "listaaut2@gmail",
    password: "123456",
    wallet: 1,
    is_admin: true)

Cart.create!(product_id: 1,
    user_id: 1)