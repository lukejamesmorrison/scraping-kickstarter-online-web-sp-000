# require libraries/modules here
require 'nokogiri'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = kickstarter.css('li.project')

  projects.each do |project|
    # puts project
    puts title = project.css('h2.bbcard_name strong a').text
    puts description = project.css('p.bbcard_blurb').text
  end
end
