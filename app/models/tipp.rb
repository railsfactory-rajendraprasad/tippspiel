#Encoding: UTF-8
class Tipp < ActiveRecord::Base
  belongs_to :spiel
  belongs_to :user
  
  def small
    format "%s : %s", self.team_a_result, self.team_b_result
  end

  def extra_small
    format "%s:%s", self.team_a_result, self.team_b_result
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
  
  def too_late?
    self.errors.add(:base, 'Zu spät! Es kann nur bis Spielbeginn getippt werden!') unless self.spiel.start_at > (Time.now + (3600 *2)).utc
  end
end
