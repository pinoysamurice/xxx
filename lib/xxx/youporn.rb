module Xxx
  class Youporn
    HOST = "youporn.com"
    URI = "http://#{HOST}"
    BROWSE_TIME_PATH = "/browse/time"
    ENTER_WEBSITE = lambda { |page| page.forms.first.click_button }

    def agent
      @agent ||= WWW::Mechanize.new
    end

    def latest
      agent.get(uri(BROWSE_TIME_PATH), &ENTER_WEBSITE)
      path = agent.page.links_with(:href => /watch/).first.href
      uri(path)
    end

    def uri(path)
      "#{URI}#{path}"
    end
  end
end
