module ApplicationHelper
  def link_to_new_or_edit_tipp(user_id, spiel_id, txt='Tipp abgeben', xs=false)
    tipp = Tipp.where(:user_id=>user_id, :spiel_id=>spiel_id).first
    if tipp
      txt = (xs) ? tipp.extra_small : tipp.small
      return link_to(txt, edit_tipp_path(tipp), :class=>'button')
    else
      return link_to(txt, new_tipp_path(:spiel_id=>spiel_id,:user_id=>user_id), :class=>'button')
    end
  end
  
  def nameify(str)
    str.split(' ').map(&:capitalize).join(' ').gsub('Vdh', 'vdH')
  end
end
