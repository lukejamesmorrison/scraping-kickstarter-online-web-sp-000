# require libraries/modules here
require 'nokogiri'

def create_project_hash
  projects = {}
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  kickstarter.css('li.project').each do |project|
    # title, an image, a short description, a location and some funding details
    title = project.css('h2.bbcard_name strong a').text

    projects[title.to_sym] = {
      :image_link => project.css('img.projectphoto-little').attribute('src'),
      :location => project.css('span.location-name').text,
      :description => project.css('p.bbcard_blurb').text,
      :percent_funded => project.css('li.funded').text
    }

    projects




  end
end
