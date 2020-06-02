# require libraries/modules here
require 'nokogiri'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = kickstarter.css('li.project')

  projects.each do |project|
    title = project.css('bbcard_name strong a').text
  end
end
