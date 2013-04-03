class PortAuthority::ProgressHandler
  require 'ruby-progressbar'
  require 'pry'

  def initialize
    @progress_bars = {}
  end

  def on_open(downloader, file)
    # puts "starting download: #{file.remote} -> #{file.local} (#{file.size} bytes)"
    # binding.pry
    @progress_bars[file.local] = ProgressBar.create(total: file.size)
  end

  def on_get(downloader, file, offset, data)
    # puts "writing #{data.length} bytes to #{file.local} starting at #{offset}"
    # binding.pry
    @progress_bars[file.local].progress += offset
  end

  def on_close(downloader, file)
    # puts "finished with #{file.remote}"
    @progress_bars[file.local].finish
  end

  def on_mkdir(downloader, path)
    puts "creating directory #{path}"
  end

  def on_finish(downloader)
    puts "all done!"
    # @progress.finish
  end
end

# starting download: /media/sdg1/home/cricketking/private/rtorrent/data/Game.of.Thrones.S03E01.720p.HDTV.x264-EVOLVE/game.of.thrones.s03e01.720p.hdtv.x264-evolve.sfv ->
# /Users/shaun/Desktop/game.of.thrones.s03e01.720p.hdtv.x264-evolve.sfv (1652 bytes)
