require 'pry'
class Scraper 

    URL = "https://www.worldometers.info/coronavirus/"
    def self.scrape 
        #open url
        html = open(URL)
        #use nokogiri to parse url
        doc = Nokogiri::HTML(html)
        
       # binding.pry 
        country = doc.css("#main_table_countries_today tbody tr")
        country.each do |c|
            name = c.css("td")[0].text
            total_cases = c.css("td")[1].text
            total_deaths = c.css("td")[3].text.strip
            total_recovered = c.css("td")[5].text
            active_cases = c.css("td")[6].text
            serious_critical = c.css("td")[7].text
          Countries.new(name, total_cases, total_deaths, total_recovered, active_cases, serious_critical)
        
        end
        #binding.pry
    end
  

        #loop through each of our elements and pull out the title and the url
        #create a new movie obect with the title and the url for each movie


end
