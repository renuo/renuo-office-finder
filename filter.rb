require 'csv'
require 'json'
require 'net/http'

Point = Struct.new(:x, :y)

def distance(a, b)
  Math.sqrt((b.x - a.x) ** 2 + (b.y - a.y) ** 2)
end

def connection_duration(station_a, station_b)
  uri = URI("https://transport.opendata.ch/v1/connections?from=#{station_a}&to=#{station_b}&fields[]=connections/duration&fields[]=connections/transfers")
  response_body = Net::HTTP.get(uri)
  durations = JSON.parse(response_body)['connections'].map { |c| c['duration'] }
  durations.min
end

center = Point.new(8.595545, 47.409209)
radius = 0.5

stations = CSV.read('bfkoordgeo.csv')[1..-1]
stations.select! do |s|
  station_location = Point.new(s[1].to_f, s[2].to_f)
  distance(station_location, center) < radius
end

target_ids = stations.map(&:first)
home_ids = [
    '8503120', # Jona
    '8506302', # St. Gallen
    '8506038', # Winterthur Wallrüti
    '8591193', # Hirschwiesenstrasse
    '8591127', # Felsenrainstrasse
    '8502572', # Goldbrunnenplatz
    '8503052', # Friesenberg
]

max_duration = '00d01:10:00'

CSV.open('out.csv', 'wb') do |csv|
  csv << ['target', *home_ids]

  target_ids.each do |target_id|
    begin
      durations = []

      home_ids.each do |home_id|
        sleep(0.51)
        duration = connection_duration(home_id, target_id)
        break if duration > max_duration
        durations << duration
      end

      if durations.length == home_ids.length
        csv << [target_id, *durations]
        putc '.'
      else
        putc '-'
      end

    rescue
      putc 'F'
    end
  end
  puts
end



