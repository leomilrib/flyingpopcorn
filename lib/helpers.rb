module Helpers

  def calc_passes(params)
require 'pry';binding.pry    
    day, month, year = params[:date].split('/').map(&:to_i)
    charge_date = Date.new(year, month, day)
    cost = params[:cost].to_f
    passes = params[:balance].to_f
    week_days = params[:week_days].map { |d| "#{d}?".to_sym }
    schedule_date = Date.today
    days_passed = 0

    while schedule_date >= charge_date
      days_passed += 1 if used_day?(charge_date, week_days)
      charge_date = charge_date.next_day
    end

    expended = days_passed * cost
    passes_left = passes - expended
    qtdDiasFim = 0

    while passes_left > cost
      passes_left -= cost if used_day?(schedule_date, week_days)
      schedule_date = schedule_date.next_day
    end

    {
      left: passes_left,
      recharge_date: schedule_date.to_s
    }
  end

  def used_day?(date, days)
    days.any? { |d| date.send(d) }
  end

end
