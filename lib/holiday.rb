require 'pry'

# https://stackoverflow.com/questions/5544858/accessing-elements-of-nested-hashes-in-ruby
# https://www.honeybadger.io/blog/advanced-ruby-hash-techniques/





 # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }


def second_supply_for_fourth_of_july(holiday_hash)
  ############# return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1] # first element has a 0 index and second element has a 1 index
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply # shovel in/add a new value to :christmas key
  holiday_hash[:winter][:new_years] << supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array # set a new key and value
  # remember to return the updated hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.map do |season, holiday| # 1st level iteration
    puts "#{season.to_s.capitalize!}:" # prints out: capitalizes first letter of word/season permanently with !
    holiday.map do |holiday, supplies| # holiday is block variable from top level iteration. # second level iteration here
      holiday = holiday.to_s.split("_") # split values of array up 
      holiday.map do |name| # iterate over holiday and save in place with .map. # capitalize first letter of each element
        name.capitalize!
      end
    puts "  #{holiday.join(" ")}: #{supplies.join(", ")}" # prints out: .join-joins back elements in array with space between each word and joins back elements in supplies with comma in between elements
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists include the string "BBQ"
  holidays_with_bbq = [] # sets up emtpy array
  holiday_hash.map do |season, holiday| # iterate top level of nested hash
    holiday.map do |holiday, supplies| # iterate second level of nested hash
      supplies.map do |name| # look at supplies
        if name.to_s == "BBQ" # iterate supplies and look for name to string that is BBQ
          holidays_with_bbq << holiday # shovel holiday names with BBQ in them, into empty array
        end
      end
    end
  end 
  holidays_with_bbq # return new array
end







