module ActiveSupport #:nodoc:
  module CoreExtensions #:nodoc:
    module Date #:nodoc:
      # Enables the use of time calculations within Date itself
      module Calculations
        # Tells whether the Date object is a weekday
        def weekday?
          (1..5).include?(wday)
        end
        
        # Returns the number of weekdays until a future Date
        def weekdays_until(date)
          return 0 if date <= self
          (self...date).select{|day| day.weekday?}.size
        end
      end
    end
  end
end

module ActiveSupport #:nodoc:
  module CoreExtensions #:nodoc:
    module Time #:nodoc:
      # Enables the use of time calculations within Time itself
      module Calculations
        def weekday?
          (1..5).include?(wday)
        end
      
        def weekdays_until(date)
          return 0 if date <= self.to_date
          (self.to_date...date).select{|day| day.weekday?}.size
        end
      end
    end
  end
end

module ActiveSupport #:nodoc:
  module CoreExtensions #:nodoc:
    module DateTime #:nodoc:
      # Enables the use of time calculations within DateTime itself
      module Calculations
        # Tells whether the Date object is a weekday
        def weekday?
          (1..5).include?(wday)
        end
      end
    end
  end
end

module ActiveSupport #:nodoc:
  module CoreExtensions
    module Numeric
      module Time
        # Returns a Time object that is n number of weekdays in the future of a given Date
        def weekdays_from(time = ::Time.now)
          # -5.weekdays_from(time) == 5.weekdays_ago(time)
          return self.abs.weekdays_ago(time) if self < 0
          
          x = 0
          curr_date = time

          until x == self
            curr_date += 1.days
            x += 1 if curr_date.weekday?
          end

          curr_date
        end
        alias :weekdays_from_now :weekdays_from

        # Returns a Time object that is n number of weekdays in the past from a given Date
        def weekdays_ago(time = ::Time.now)
          # -5.weekdays_ago(time) == 5.weekdays_from(time)
          return self.abs.weekdays_from(time) if self < 0
          
          x = 0
          curr_date = time

          until x == self
            curr_date -= 1.days
            x += 1 if curr_date.weekday?
          end

          curr_date
        end
      end
    end
  end
end