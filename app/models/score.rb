class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :spiel
  
  Result = Struct.new :a_win, :b_win, :patt, :a, :b
  def self.parse(result)
    a, b = result.split(':')
    a = a.to_i
    b = b.to_i
    r = Result.new
    r.a_win = a > b
    r.b_win = b > a
    r.patt = a== b
    r.a = a
    r.b = b
    return r
  end
  
  def self.calculate(spiel_id, result)
    blk =Score.parse(result)
    Score.transaction do
      Score.delete_all(['spiel_id = ?', spiel_id]) # Erstmal alle bisherigen Punkte löschen (immer neu Berechnen)
      Tipp.where('spiel_id = ?', spiel_id).each do |tipp|
        val = new(:spiel_id => spiel_id, :user_id => tipp.user_id)
        
        # Treffer gibt 3 Punkte
        if tipp.team_a_result == blk.a && tipp.team_b_result == blk.b
          val.score = 3
        # richtige Tordifferenz 2 Punkte
        elsif (tipp.team_a_result - tipp.team_b_result) == (blk.a - blk.b)
          val.score = 2
        # richtiger Ausgang gibt 1 Punkt
        elsif tipp.team_a_win? && blk.a_win or tipp.team_b_win? && blk.b_win or blk.patt && tipp.patt?
          val.score = 1
        else
          val.score = 0
        end
        val.save!
      end
    end
  end
end
