require 'nokogiri'
require 'open-uri'

module SportsSchedule
  module Rugby
    def parse(yyyy, mm)
      doc = Nokogiri.HTML(open("http://www.rugby-japan.jp/calendar/calendar_#{yyyy}_#{mm}.html"))
      doc.xpath('//div[@id="cal_main"]')
      true
    end
  end
end
