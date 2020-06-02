# require libraries/modules here
require 'nokogiri'

def create_project_hash
  projects = {}
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = kickstarter.css('li.project')

  projects.each do |project|
    # title, an image, a short description, a location and some funding details
    puts title = project.css('h2.bbcard_name strong a').text
    puts image_link = project.css('img.projectphoto-little').attribute('src')
    puts location = project.css('span.location-name').text
    puts description = project.css('p.bbcard_blurb').text
    puts percent_funded = project.css('li.funded').text


  end
end
