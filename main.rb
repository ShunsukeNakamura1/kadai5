# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'
require_relative 'field'

Window.width  = 800
Window.height = 800

player_img = Image.load("player.png")
player_img.setColorKey([0, 0, 0])

enemy_img = Image.load("enemy.png")
enemy_img.setColorKey([0, 0, 0])

field_img = Image.load("field.png")
field_img.setColorKey([0, 0, 0])

player = Player.new(400, 500, player_img)
player.init

enemies = []
10.times do
  enemies << Enemy.new(rand(800), rand(600), enemy_img)
end

field = Field.new(0, 0, field_img)

Window.loop do
  break if Input.keyPush?(K_ESCAPE)

  field.draw
  
  Sprite.update(enemies)
  Sprite.draw(enemies)

  player.update
  player.draw
  
  
  # 当たり判定
  Sprite.check(player, enemies)
end