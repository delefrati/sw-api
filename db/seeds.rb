# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Movie.delete_all
Planet.delete_all

print "Seeding movies "
path = File.join(File.dirname(__FILE__), "./import/movies.json")
records = JSON.parse(File.read(path))
records.each do |record|
    movie = {
        title: record["title"],
        director: record["director"],
        release_date: record["release_date"],
        original_url: record["url"]
    }
    Movie.create!(movie)
    print "."
end
puts " done!"

print "Seeding planets "
path = File.join(File.dirname(__FILE__), "./import/planets.json")
records = JSON.parse(File.read(path))
records.each do |record|
    planet = {
        name: record["name"],
        climate: record["climate"],
        terrain: record["terrain"],
    }
    new_planet = Planet.create!(planet)

    print "."
    record["films"].each do |record_film|
        new_planet.movies << Movie.find_by(original_url: record_film)
        print "-"
    end
    new_planet.save
end
puts " done!"
