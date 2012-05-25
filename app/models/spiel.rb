class Spiel < ActiveRecord::Base
  def team_a
    Team.find(self.team_a_id).name
  end
  
  def team_b
    Team.find(self.team_b_id).name
  end
end
