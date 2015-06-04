desc "This task is called by the Heroku scheduler add-on"
task :create_superheros => :environment do
  puts "Creating superheros..."
  Superhero.create_superheros
  Superhero.all.each do |hero|
    hero.aggregate_sentiment_score
  end
  puts "Truth justice and the American way!!!"
end
