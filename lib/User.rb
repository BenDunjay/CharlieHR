require "date"

class User
  attr_reader :name, :date_of_birth

  def initialize(name, date_of_birth)
    @name = name
    @date_of_birth = date_of_birth
  end

  # Returns an integer representing the user's current age
  def age
    today = Time.new
    year = today.year - @date_of_birth.year
    if year < 0
      "Congratulations!"
    elsif year == 0
      "Under a year old!"
    else
      year - (today.month > @date_of_birth.month || today.month == @date_of_birth.month && today.day >= @date_of_birth.day ? 0 : 1)
    end
  end

  # Returns a date object for the user's next birthday
  def next_birthday
    today = Time.new
    if @date_of_birth.month - today.month <= 0 && @date_of_birth.day - today.day < 0 || @date_of_birth.month - today.month < 0
      Date.new(today.year + 1, @date_of_birth.month, @date_of_birth.day)
    elsif @date_of_birth.month - today.month === 0 && @date_of_birth.day - today.day === 0
      "Happy Birthday!"
    else
      Date.new(today.year, @date_of_birth.month, @date_of_birth.day)
    end
  end

  def days_until_birthday
    birthday = Date.new(Date.today.year, @date_of_birth.month, @date_of_birth.day)
    if Date.today.month === birthday.month && Date.today.day === birthday.day
      return "Happy Birthday!"
    end
    if Date.today > birthday
      birthday = Date.new(Date.today.year + 1, @date_of_birth.month, @date_of_birth.day)
    end
    (birthday - Date.today).to_i.to_s + " days till next birthday"
  end
end # class end
