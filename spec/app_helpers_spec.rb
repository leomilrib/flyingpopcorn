describe 'app_helper' do

  context "with usage of 6 days, 6 cost per day and 36 of balance" do
    let(:today) { Date.today }
    let(:params) {
      {
        date: today.strftime('%d/%m/%y'),
        cost: '6',
        balance: '36'
      }
    }

    it "returns 6 days to recharge" do
      result = calc_passes(params)
      expect(result[:recharge_date]).to eq((today + 6).to_s)
    end
  end
end
