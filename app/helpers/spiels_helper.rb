#Encoding: UTF-8

module SpielsHelper
  def link_to_new_or_edit_tipp(user_id, spiel_id)
    tipp = Tipp.where(:user_id=>user_id, :spiel_id=>spiel_id).first
    if tipp
      return link_to(tipp.small, edit_tipp_path(tipp))
    else
      return link_to('Tipp abgeben', new_tipp_path(:spiel_id=>spiel_id))
    end
  end
end
