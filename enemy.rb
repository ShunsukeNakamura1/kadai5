# coding: utf-8

class Enemy < Sprite
  def init
    @power = 500  #敵ベイのパワー≒回転数
    @count = 0    #敵ベイのパワーを増やすための変数
    @count_rate = 10  #@countが@count_rateになるたびに敵ベイのパワーが
  end
  def update
    #ランダムな動きをする
    self.x += rand(21)-10
    self.y += rand(21)-10
    
    self.angle += 72
    if self.y >= Window.height - self.image.height
      self.vanish
    end
    if (self.y-400)**2 + (self.x-400)**2 > 400**2
      self.x = 400
      self.y = 400
    end
  end

  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit(obj)
    self.vanish
  end
end