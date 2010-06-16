require 'fileutils'

puts File.expand_path(__FILE__)
dir = File.dirname(__FILE__)
#Copy all screen settings/bindings
dest_screenrc_path = File.join(dir, '../../')
src_screenrc_path = File.join(dir, '../screen/')
FileUtils.rm_r(dest_screenrc_path, :force) if File.exist?(dest_screenrc_path)
if FileUtils.cp_r(src_screenrc_path, dest_screenrc_path)
  puts "Copied screen to the home directory successfully."
else
  puts "Failed to copy screen to the home directory."
end
#
##Copy all settings/bindings
settings_files = %w{.vimrc .irbrc .autotest .bashrc}

settings_files.each do |file_name|
  dest= File.join(dir, "../../#{file_name}")
  src= File.join(dir, "../#{file_name}")
  FileUtils.rm_r(dest, :force) if File.exist?(dest)
  if FileUtils.cp_r(src, dest, :f => true)
    puts "Copied #{file_name} to the home directory successfully."
  else
    puts "Failed to copy #{file_name} to the home directory."
  end
end
