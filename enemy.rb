# coding: utf-8

class Enemy < Sprite
  def init
    @power = 500  #敵ベイのパワー≒回転数
    @count = 0    #敵ベイのパワーを増やすための変数
    @count_rate = 10  #@countが@count_rateになるたびに敵ベイのパワーが上昇
  end
  
  def update
    @count += 1
    #@count_rateフレームに1回パワーが1上昇
    if @count == @count_rate
      @power += 1
      @count = 0
    end
    #ランダムな動きをする
    x_move = rand(21)-10
    y_move = rand(21)-10
    self.x += x_move
    self.y += y_move

    self.angle += 72
    if self.y >= Window.height - self.image.height
      self.vanish
    end
    if self.x >= Window.width - self.image.width
      self.vanish
    end
    #フィールドのふちにあたった時
    if (self.y-365)**2 + (self.x-365)**2 > 3650**2
      self.x -= x_move
      self.y -= y_move
    end
  end
  
  def getPower
    @power
  end
  
  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit(obj)
    a = obj.getPower - @power #はじく力
    if a < 0
      a = 0
    end
    self.x += (self.x - obj.x) * (a / 10)
    self.y += (self.y - obj.y) * (a / 10)
    @power -= obj.getPower / 50
  end
end