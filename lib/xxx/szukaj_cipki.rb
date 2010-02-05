module Xxx
  class SzukajCipki
    HOST = "http://szukajcipki.pl"

    attr_accessor :doc, :link

    def agent
      @doc = Nokogiri::HTML(open(HOST))
    end

    def latest
      @link = HOST + agent.css("ul#movies a").first['href']
    end
  end
end
