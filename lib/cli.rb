class CLI
    def call 
        Scraper.scrape
        puts ""
        puts ""
        puts "Welcome to the pandemic."
        puts ""
        puts "Which list would you like to see?"
        puts "Please choose a number:"
        display_l_o_l     
    end

    def display_l_o_l 
        puts ""
        puts ""
        puts "1. Countries by Name"
        puts "2. Countries by Total Cases"
        puts "3. Countries by Active Cases"
        puts "4. Countries by Total Deaths"
        puts "5. Exit"
        puts ""
        puts ""
        
        input = gets.chomp.to_i  
        if !input.between?(1, 5)
            puts "I'm sorry choose another number"
            display_l_o_l
        elsif input == 1
            puts ""
            puts ""
            display_by_name
        elsif input == 2 
            puts ""
            puts ""
            display_total_cases
        elsif input == 3
            puts ""
            puts ""
            display_active_cases
        elsif input == 4
            puts ""
            puts "" 
            display_total_deaths
        elsif input == 5 
            puts ""
            puts ""
           finish 
        end
    end

    
    

    def display_by_name
        list = Countries.all.sort_by(&:name)
        list.each_with_index do |c, i|
            puts "#{i+1}. #{c.name}"
        end
        puts ""
        puts ""
        puts "Choose a number to learn more"
        puts "enter 'main' to return to the main menu"
        puts "or enter quit to exit"
        puts ""
        input = gets.chomp
        if !input.to_i.between?(0, Countries.all.count)
            puts "Country not found. Please select a different country"
            display_by_name
        elsif input == "main"
            display_l_o_l
        elsif input == "quit"
            finish
        else
            list = Countries.all.sort_by(&:name)
            country = list[input.to_i-1]
            display_country_stats(country, 1)
        end
    end


    def display_total_cases
       
        list = Countries.all.sort_by(&:total_cases).reverse
        list.each_with_index do |c, i|
            count = Countries.all.count 
            puts "#{i}. #{c.name} -------> #{c.total_cases} total cases "
        end
        puts ""
        puts ""
        puts "Choose a number to learn more"
        puts "enter 'main' to return to the main menu"
        puts "or type quit to exit"
        puts ""
        input = gets.chomp
        if !input.to_i.between?(0, Countries.all.count)
            puts "Country not found. Please select a different country"
            display_total_cases 
        elsif input == "main"
            display_l_o_l
        elsif input == "quit"
           finish
        else
            list = Countries.all.sort_by(&:total_cases).reverse
            country = list[input.to_i]
            display_country_stats(country, 2)
        end

    end

    def display_active_cases
        list = Countries.all.sort_by(&:active_cases).reverse
        list.each_with_index do |c, i|
            puts "#{i}. #{c.name}  -------> #{c.active_cases} active cases"
        end
        # puts ""
        # puts ""
        # puts "Choose a number to learn more"
        # puts "enter 'main' to return to the main menu"
        # puts "or type quit to exit"
        # puts ""
        choose_country(3)
    end



     def display_total_deaths
        list = Countries.all.sort_by(&:total_deaths).reverse
        list.each_with_index do |c, i|
            puts "#{i}. #{c.name}  -------> #{c.total_deaths} total deaths"
        end
        puts ""
        puts ""
        puts "Choose a number to learn more"
        puts "enter 'main' to return to the main menu"
        puts "or type quit to exit"
        puts ""
        choose_country(4)
        # if !input.to_i.between?(0, Countries.all.count)
        #     puts "Country not found. Please select a different country"
        #     display_total_deaths 
        # elsif input == "main"
        #     display_l_o_l
        # elsif input == "quit"
        #     finish    
        # else
        #     list = Countries.all.sort_by(&:total_deaths).reverse
        #     country = list[input.to_i]
        #     display_country_stats(country, 4)
        # end

    end


    def display_country_stats(country, list_number)
        puts ""
        puts "Country: #{country.name}"
        puts "Total Cases: #{country.total_cases}"
        puts "Total Deaths: #{country.total_deaths}"
        puts "Total Recovered: #{country.total_recovered}"
        puts "Active Cases: #{country.active_cases}"
        puts "Serious/Critical Cases: #{country.serious_critical}"
        puts ""
        puts ""
        stay_or_go(list_number)
   end


    def stay_or_go(list_number)
          puts "Would you like to select another country?"
          puts "Enter y for yes or n for no"
          puts ""
          puts ""
          choice = gets.chomp
        if choice == "y"
            if list_number == 1
                display_by_name
            elsif list_number == 2
                display_total_cases
            elsif list_number == 3
                display_active_cases
            elsif list_number == 4
                display_total_deaths
            end
                
        elsif choice == "n"
            puts "Would you like to see another list?"
            input = gets.chomp
            "Enter y for yes or n for no"
            puts ""
            puts ""
            if input == "y"
                display_l_o_l
            elsif input == "n" 
            puts "Have a nice day and stay at home!!"
            exit
            else 
                puts "Sorry I didn't get that. Please try again" 
                stay_or_go
            end
        else
            puts "I'm sorry I didn't get that. Please try again."
            stay_or_go(list_number)
        end
        
    end    

    

    def finish 
            puts ""
            puts ""
            puts "Have a nice day and stay at home!!"
            puts ""
            puts ""
            exit 
    end


    def choose_country(list_number)
        puts ""
        puts ""
        puts "Choose a number to learn more"
        puts "enter 'main' to return to the main menu"
        puts "or type quit to exit"
        puts ""
        input = gets.chomp
        # if input != "main" || input != "quit"
        
        #     binding.pry
        #     input.to_i
        # end
  #  binding.pry
        
        if input == "main"
            display_l_o_l  
        elsif input == "quit"
            finish
        elsif !input.to_i.between?(0, Countries.all.count)
                puts ""
                puts "Country not found. Please select a different country" 
                puts ""
                choose_country(list_number)    
        elsif input.to_i.between?(0, Countries.all.count)
            if list_number == 1
                stat = :name 
            elsif list_number == 2
                stat = :total_cases
            elsif list_number == 3
                stat = :active_cases
            elsif list_number == 4
                stat = :total_deaths
            end
            list = Countries.all.sort_by(&stat).reverse
            country = list[input.to_i]
            display_country_stats(country, list_number)
         #   binding.pry 
        else
            puts ""
            puts "Sorry, I didn't get that. Please select a different country" 
            puts ""
            choose_country(list_number)
        end
    end



end
