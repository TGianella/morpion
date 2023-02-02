require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)
require 'app/board'
require 'app/row'
require 'app/square'
require 'app/player'
require 'app/board_display'
require 'app/game'
require 'app/board_checker'
require 'app/tic_tac_toe.rb'
require 'app/board_display_rules.rb'

TicTacToe.new.perform
