require "mechanize"
require "open-uri"
require "launchy"

require "xxx/youporn"
require "xxx/szukaj_cipki"

module Xxx
  CHANNEL_NAMES = [:youporn, :szukajcipki]

  def open_channel(channel_name)
    case channel
    when :youporn
      Youporn.new
    when :szukajcipki
      SzukajCipki.new
    end
  end

  def self.watch_porn(channel_name, command = "latest")
    channel_name ||= CHANNEL_NAMES.sort_by { rand }.first
    channel = open_channel(channel_name)

    if channel.respond_to?(command)
      uri = channel.send(command)
      Launchy.open(uri)
    else
      raise ArgumentError, "unknown command: #{command}"
    end
  end
end
