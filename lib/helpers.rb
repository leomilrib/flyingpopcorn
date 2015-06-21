module Helpers

  def calc_passes(params)
# require 'pry';binding.pry    
    day, month, year = params[:date].split('/').map(&:to_i)
    charge_date = Date.new(year, month, day)
    cost = params[:cost].to_f
    passes = params[:balance].to_f
    schedule_date = Date.today
    days_passed = 0

    while schedule_date >= charge_date
      days_passed += 1 unless charge_date.saturday? or charge_date.sunday?
      charge_date = charge_date.next_day
    end

    expended = days_passed * cost
    passes_left = passes - expended
    qtdDiasFim = 0

    while passes_left > cost
      passes_left -= cost unless schedule_date.saturday? or schedule_date.sunday?
      schedule_date = schedule_date.next_day
    end

    {
      left: passes_left,
      recharge_date: schedule_date.to_s
    }
  end

end
