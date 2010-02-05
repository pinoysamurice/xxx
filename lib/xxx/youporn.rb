module Xxx
  class Youporn
    URI = "http://youporn.com"
    BROWSE_TIME= "/browse/time"
    ENTER_WEBSITE = lambda { |page| page.forms.first.click_button }

    def agent
      @agent ||= WWW::Mechanize.new
    end

    def latest
      agent.get("#{URI}#{BROWSE_TIME}", &ENTER_WEBSITE)
      href = agent.page.links_with(:href => /watch/).first.href
      uri(href)
    end

    def uri(href)
      "#{URI}#{href}"
    end
  end
end
