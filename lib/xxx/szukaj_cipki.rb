module Xxx
  class SzukajCipki
    HOST = "http://szukajcipki.pl"

    attr_accessor :doc, :link

    def initialize
      @doc = Nokogiri::HTML(open(HOST))
    end

    def porn_of_day
      @link = HOST + @doc.css("ul#movies a").first['href']
    end
  end
end