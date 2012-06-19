#Encoding: UTF-8

class Spiel < ActiveRecord::Base
  has_many :tipps
  default_scope :order => 'start_at'
  
  def team_a
    Team.find(self.team_a_id).name
  end
  
  def team_b
    Team.find(self.team_b_id).name
  end
  
  def versus
    format "%s vs. %s", self.team_a, self.team_b
  end
  
  def status
    (Time.now >= self.start_at) ? 'Keine Tippabgabe mehr möglich' : format("Spielstart ist am %s",self.start_at.strftime("%d.%m.%Y um %H:%M Uhr"))
  end
  
  def good_choice?(tipp)
    return nil if result.nil? or result.empty?
    tmp = nil 
    
    if tipp == result
      tmp = 'gold' 
    else
      a = Score.parse(tipp)
      b = Score.parse(self.result)
      tmp = 'silver' if (a.a_win && b.a_win) or (a.b_win && b.b_win) or (a.patt && b.patt )
    end
    
    tmp
  end
  
  def average
    tg = self.tipps.count
    ta = self.tipps.sum('team_a_result')
    tb = self.tipps.sum('team_b_result')
    format "%2.1f zu %2.1f",  (ta / tg.to_f), (tb / tg.to_f)  
  end
end
