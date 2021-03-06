require_relative '../lib/weather'

class WeatherHolder ; include Weather ;end
describe "weather" do

	let(:weather) {WeatherHolder.new}

		it 'should have a curren_weather value' do
			expect(weather.current_weather).not_to be_nil
		end

		it 'should be sunny or stormy' do
		expect(weather.current_weather).to satisfy{|s| [:sunny, :stormy].include?(s)}
	end
	
end