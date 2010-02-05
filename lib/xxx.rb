require "mechanize"
require "open-uri"
require "launchy"

require "xxx/youporn"
require "xxx/szukaj_cipki"

module Xxx
  CHANNELS = [Youporn, SzukajCipki]
  def self.watch_porn
    channel = CHANNELS.sort_by { Kernel.rand }.first
    Launchy.open(channel.new.latest)
  end
end
