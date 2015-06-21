describe 'app_helper' do

  context "with usage of 6 days, 6 cost per day and 42 of balance" do
    let(:today) { Date.new(2015, 6, 28) }
    let(:params) {
      {
        date: today.strftime('%d/%m/%Y'),
        cost: '6',
        balance: '42',
        week_days: [
          'monday',
          'tuesday',
          'wednesday',
          'thursday',
          'friday',
          'saturday'
        ]
      }
    }

    it "returns 7 days later to recharge" do
      fake_day(today)
      result = calc_passes(params)
      puts result
      puts Date.today
      expect(result[:recharge_date]).to eq((today + 7))
    end
  end

  def fake_day(date)
    allow(Date).to receive_messages(today: date)
  end
end
