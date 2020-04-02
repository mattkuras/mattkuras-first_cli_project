class Countries

     attr_accessor :name, :total_cases, :total_deaths, :total_recovered, :active_cases, :serious_critical
     @@all = []

     def initialize(name, total_cases, total_deaths, total_recovered, active_cases, serious_critical)
        
         @name = name 
         @total_cases = total_cases.delete(",").to_i
         @total_deaths = total_deaths.delete(",").to_i
         @active_cases = active_cases.delete(",").to_i
         @total_recovered = total_recovered.delete(",").to_i
         @serious_critical = serious_critical.delete(",").to_i
         @@all << self 
     end

     def self.all 
         @@all 
     end



end
