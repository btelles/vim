%w{
.autotest
.bash_aliases
.bash_profile
.bashrc
.directory
.gitconfig
.gitignore
.gitmodules
.irbrc
.rspec
.vimrc
}.each do |rc_file|
  `ln -s ~/.vim/#{rc_file} ~/#{rc_file}`
end