require 'time'

module RideShare
  class Passenger
    attr_reader :id, :name, :phone_number, :trips

    def initialize(input)
      if input[:id] == nil || input[:id] <= 0
        raise ArgumentError.new("ID cannot be blank or less than zero.")
      end

      @id = input[:id]
      @name = input[:name]
      @phone_number = input[:phone]
      @trips = input[:trips] == nil ? [] : input[:trips]
    end

    def get_drivers
      @trips.map{ |t| t.driver }
    end

    def add_trip(trip)
      @trips << trip
    end

    def calc_total_spent
      total_spent = 0
      @trips.each do |trip|
        if trip.end_time != nil
          total_spent += trip.cost
        else
          total_spent
        end
      end
      return total_spent.to_f
    end

    def calc_total_duration
      total_duration = 0
      @trips.each do |trip|
        if trip.end_time != nil
          total_duration += trip.duration
        else
          total_duration
        end
      end
      return total_duration.to_f
    end

  end
end
