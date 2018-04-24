class Nuke < ApplicationRecord
  resourcify
  def nuke_update
    first = rand(1000..9999)
    last = rand(1000..9999)
    Nuke.first.update(nuke_code_first: first.to_s, nuke_code_last: last.to_s, update_codes: Time.now.strftime('%I'+'%M'))
  end

  def nuke_president
    Nuke.first.update(president: Time.now.strftime('%I'+'%M'))
  end

  def nuke_secretary
    Nuke.first.update(secretary: Time.now.strftime('%I'+'%M'))
  end



end
