class Tipp < ActiveRecord::Base
  belongs_to :spiel
  belongs_to :user
  
  def small
    format "%s : %s", self.team_a_result, self.team_b_result
  end
  
  def team_a_win?
    self.team_a_result > self.team_b_result
  end

  def team_b_win?
    self.team_a_result < self.team_b_result
  end

  def patt?
    self.team_a_result == self.team_b_result
  end
end
