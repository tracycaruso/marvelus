namespace :superhero_populate do

  desc "Access superheroes"
  task :access_superheroes => :environment do
    print "How many fake people do you want?"
    num_people = $stdin.gets.to_i
    num_people.times do
      Person.create(:first_name => Faker::Name.first_name,
                    :last_name => Faker::Name.last_name)
    end
    print "#{num_people} created.n"
  end

  desc "Analyze superheroes"
  task :analyze_superheroes => :environment do
    print "How many fake people do you want?"
    num_people = $stdin.gets.to_i
    num_people.times do
      Person.create(:first_name => Faker::Name.first_name,
                    :last_name => Faker::Name.last_name)
    end
    print "#{num_people} created.n"
  end

end
