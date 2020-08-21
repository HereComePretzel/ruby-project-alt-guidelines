require_relative '../config/environment'
require_relative '../config/command_line_interface'
require "tty-prompt"
prompt = TTY::Prompt.new
ActiveRecord::Base.logger = nil

player = RubyAfplay::Player.new("./bin/parlor.mp3", volume: 1, time: 2, rate: 1)
player.play
# player.pause
# player.stop

app_intro()
login_page()
main_menu()
