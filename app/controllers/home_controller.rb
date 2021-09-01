class HomeController < ApplicationController
	def index
	require "inci_score"
	debugger
	inci = InciScore::Computer.new(src: 'aqua, dimethicone').call
	inci.score # 53.7629
end
end
