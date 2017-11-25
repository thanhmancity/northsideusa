# product_asserts_url = File.expand_path Rails.root.to_s+"/app/assets/images/product"
# product_ids = Dir.entries(product_asserts_url).delete_if{|f| f.include?(".")}

# puts "Create Sub Categories"
# sub_categories = ["Men", "Women", "Kids"]
# SubCategory.destroy_all
# sub_categories.each do |sub_category|
#   case sub_category
#   when "Men"
#     SubCategory.create! name: sub_category, tag: sub_category.downcase, gender: "m", age_group: 'a'
#   when "Women"
#     SubCategory.create! name: sub_category, tag: sub_category.downcase, gender: "f", age_group: "a"
#   when "Kids"
#     SubCategory.create! name: sub_category, tag: sub_category.downcase, gender: "a", age_group: 'k'
#   end
# end

# puts "Create Color Families"
# ColorFamily.destroy_all
# 10.times do |i|
#   ColorFamily.create! color_family: Faker::Color.color_name
# end

# puts "Create Products"
# Product.destroy_all
# genders = ["f", "m", "u"]
# group_ages = [:a, :k]
# sub_categories = SubCategory.pluck(:id)
# product_ids.each do |product_id|
#   name_product = Dir.entries("#{product_asserts_url}/#{product_id}").delete_if{|ele| ele.size < 4}.first.split('-').first
#   Product.create! id: product_id.to_i, name: name_product,
#   short_description: Faker::Lorem.sentence, long_description: Faker::Lorem.sentence,
#   cost: 0.00, price: Faker::Number.number(5), gender: genders.sample, age_group: group_ages.sample,
#   legacy_id: Faker::Number.number(5), enabled: 1,
#   sub_category_id: sub_categories.sample
# end

# puts "Create Products Colors"
# ProductColor.destroy_all
# products = Product.all
# color_familes = ColorFamily.pluck(:id)
# products.each do |product|
#   create_product_colors = Dir.entries("#{product_asserts_url}/#{product.id}").delete_if{|ele| ele.size < 4}.delete_if{|ele| !ele.include?('300')}
#   create_product_colors.each do |color|
#     ProductColor.create! product_id: product.id, color: color.split('-300').first.remove("#{product.name}-").sub('-', ' '),
#       color_family_id: color_familes.sample, enabled: [0, 1].sample
#   end
# end

# puts "Create Category"
# 10.times do |i|
#   Category.create! category: Faker::Name.last_name
# end

# puts "Create Product Categories"
# Product.all.each do |product|
#   product.product_categories.create(category_id: Category.all.sample.id)
# end
