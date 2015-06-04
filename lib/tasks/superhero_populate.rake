desc "This task is called by the Heroku scheduler add-on"
task :create_superheros => :environment do
  puts "Creating superheros..."
  SuperherosController.new.create_superheros
  puts "Truth justice and the American way!!!"
end
