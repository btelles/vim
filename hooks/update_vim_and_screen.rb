require 'fileutils'

puts File.expand_path(__FILE__)
dir = File.dirname(__FILE__)
#Copy all screen settings/bindings
dest_screenrc_path = File.expand_path(File.join(dir, '../../screen'))
dest_screenrc_path_no_dir = File.expand_path(File.join(dir, '../..'))
src_screenrc_path = File.join(dir, '../screen/')
FileUtils.rm_rf(dest_screenrc_path) if File.exist?(dest_screenrc_path)

FileUtils.cp_r(src_screenrc_path, dest_screenrc_path_no_dir)
if $?
  puts "Copied screen to the home directory successfully."
else
  puts "src: "+src_screenrc_path
  puts "dest: "+dest_screenrc_path_no_dir
  puts "Failed to copy screen to the home directory."
end
#
##Copy all settings/bindings
settings_files = %w{.vimrc .irbrc .autotest .bashrc .screenrc}

settings_files.each do |file_name|
  dest= File.expand_path(File.join(dir, "../../#{file_name}"))
  src= File.expand_path(File.join(dir, "../#{file_name}"))
  FileUtils.rm_f(dest) if File.exist?(dest)
  FileUtils.cp_f(src, dest)
  if $?
    puts "Copied #{file_name} to the home directory successfully."
  else
    puts "src: "+src
    puts "dest: "+dest
    puts "Failed to copy #{file_name} to the home directory."
  end
end
