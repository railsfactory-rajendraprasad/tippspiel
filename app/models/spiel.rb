#Encoding: UTF-8

class Spiel < ActiveRecord::Base
  has_many :tipps
  
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
    (Time.now >= self.start_at) ? 'Keine Tippabgabe mehr möglich' : format("Spielstart ist am %s",self.start_at)
  end
end
