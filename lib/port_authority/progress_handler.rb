require 'ruby-progressbar'

module PortAuthority
  class ProgressHandler

    attr_writer :progress_bar

    def on_open(downloader, file)
      # puts "starting download: #{file.remote} -> #{file.local} (#{file.size} bytes)"
      progressbar = ProgressBar.create(total: file.size)
    end

    def on_get(downloader, file, offset, data)
      binding.pry
      # puts "writing #{data.length} bytes to #{file.local} starting at #{offset}"
      progressbar.progress += offset
    end

    def on_close(downloader, file)
      binding.pry
      # puts "finished with #{file.remote}"
      progress_bar.finish
    end

    def on_mkdir(downloader, path)
      binding.pry
      puts "creating directory #{path}"
    end

    def on_finish(downloader)
      binding.pry
      puts "all done!"
      progress_bar.finish
    end
  end
end

