# coding: utf-8

class Player < Sprite
  def init
    @power = 0 #���x�C�̃p���[����]��
  end
  
  def update
    x_move = Input.x*10
    y_move = Input.y*10
    self.x += x_move
    self.y += y_move
    #�t�B�[���h�̂ӂ��ɂ���������
    if (self.y-365)**2 + (self.x-365)**2 > 365**2
      self.x -= x_move
      self.y -= y_move
    end
    if self.y >= Window.height - self.image.height
      self.vanish
    end
    if self.x >= Window.width - self.image.width
      self.vanish
    end
    #�X�y�[�X�L�[�������ƃp���[���㏸
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
  
  def getPower
    @power
  end
  
  def hit(obj)
  end
end