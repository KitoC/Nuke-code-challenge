class Nuke < ApplicationRecord
  resourcify
  def nuke_update
    first = rand(1000..9999)
    last = rand(1000..9999)
    Nuke.first.update(nuke_code_first: first.to_s, nuke_code_last: last.to_s)
  end



end
