class Tipp < ActiveRecord::Base
  belongs_to :spiel
  belongs_to :user
  
  def small
    format "%s : %s", self.team_a_result, self.team_b_result
  end
end
