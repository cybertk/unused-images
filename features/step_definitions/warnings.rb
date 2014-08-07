require 'aruba/api'
require 'Rake'
require 'git'
require 'xcodeproj'

World(Aruba::Api)

Given /^a xcode project named "([^"]*)"$/ do |name|

  @proj = Xcodeproj::Project.new("tmp/aruba/#{name}.xcodeproj")
end

Given /^a project file named "([^"]*)" with:$/ do |file_name, file_content|

  # Create file
  write_file(file_name, file_content)

  # Add to project
  @proj.main_group.new_file("tmp/aruba/#{file_name}")
  @proj.save
end

Given /^an image named "([^"]*)"$/ do |file_name|

  g = Git.open(".")
  write_file(file_name, "")
  g.add("tmp/aruba/" + file_name)
end
