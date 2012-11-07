require 'nokogiri'
require 'open-uri'

module SportsSchedule
  module Rugby
    attr_reader :calendar

    def parse(yyyy, mm)
      doc = Nokogiri.HTML(open("http://www.rugby-japan.jp/calendar/calendar_#{yyyy}_#{mm}.html"))
      trs = doc.xpath('//div[@id="cal_main"]/table/tr')
      a = Array.new
      trs.each do |tr|
        day     = tr.xpath('.//td[@class="cal_date"]/span')[0].content
        weekday = tr.xpath('.//td[@class="cal_week"]/span')[0].content
        games   = Array.new
        tr.xpath('.//td[@class="cal_dtl"]').each do |game|
          games.push(game.content.strip)
        end
        ticket  = tr.xpath('.//td[@class="cal_btn"]/a').nil? ? "" : tr.xpath('//td[@class="cal_btn"]/a')[0]["href"].strip

        a.push({
                 'day'     => day,
                 'weekday' => weekday,
                 'game'    => games,
                 'ticket'  => ticket
               })
      end
      return a
    end
  end
end
