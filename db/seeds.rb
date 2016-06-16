# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create! id: 1, name: "Abilene 400", long_description: "The Abilene Hunting Boot keeps feet fully protected and toasty warm while outside in the field. The suede and camo nylon upper is fully seam-sealed and topped with a waterproof membrane, ensuring that feet stay dry. The boot is packed with a 400 grams of Thermolite insulation, rated at -40°F, for unbelievable warmth. The washable insole offers excellent support and breathability, while the embossed leather mud guard and heel stabilizer yield superior traction against trail obstacles. The lightweight, compression-molded EVA midsole provides ample cushioning where you need it most. The tough rubber outsole delivers superior traction on a variety of rugged terrains. Lace-up design.", price: 79.99, enabled: true
Product.create! id: 2, name: "Brille II", short_description: "Great water shoe for those wetter adventures!", long_description: "The Brille II water shoe is great choice for almost any adventure.  Great for those walks along the beach, or stepping on rocks in your favorite stream.  The flexible TPR sole provides great wet or dry traction.  The breathable neoprene mesh upper allows for quick drying.", price: 19.99, enabled: true
Product.create! id: 3, name: "Burke II", short_description: "Go anywhere, do anything footwear!!!", long_description: "The Burke II is a outstanding choice for a walk in the park, a stroll down the beach, or running errands downtown. The open design allows for cool ventilation and drainage for those wet beach times. Easy to slip into with the quick cord lacing system.", price: 29.99, enabled: true

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
