# coding: utf-8

class Player < Sprite
  def init
    @power = 0
  end
  def update
    self.x += Input.x*10
    self.y += Input.y*10
    if Input.key_push?(K_SPACE)
      @power = @power + 21
    end
    if @power > 210
      self.angle += 210
    else
      self.angle += @power
    end
    if @power > 0
      @power -= 1
    end
  end
end