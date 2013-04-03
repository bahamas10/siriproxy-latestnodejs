require 'cora'
require 'siri_objects'
require 'net/http'

class SiriProxy::Plugin::LatestNodeJS < SiriProxy::Plugin
  listen_for /(latest|latest stable) version of node js/i do |state|
    url = URI.parse('http://nodejs.org')
    html = Net::HTTP.get(url)
    version = html.match(/>Current Version: ([^<]+)/)[1]
    humanreadable = version.gsub('.', ' dot ').gsub('v', 'v ')
    say "The latest stable version of Node.JS is #{version}",
      spoken: "The latest stable version of Node.js is #{humanreadable}"
    request_completed
  end
end
