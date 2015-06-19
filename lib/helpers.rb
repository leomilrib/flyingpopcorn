module Helpers

  def calc_passes(params)
    year, month, day = params[:date].split('-').map(&:to_i)
    charge_date = Date.new(year, month, day)
    cost = params[:cost].to_f
    passes = params[:charge].to_f
    today = Date.today
    days_passed = 0
    while today >= charge_date
      days_passed += 1 unless charge_date.saturday? or charge_date.sunday?
      charge_date = charge_date.next_day
    end
    expended = days_passed * cost
    passes_left = passes - expended
    qtdDiasFim = 0
    while passes_left > cost
      passes_left -= cost unless today.saturday? or today.sunday?
      today = today.next_day
    end
    {
      left: passes_left,
      recharge: today.to_s
    }
  end

end
