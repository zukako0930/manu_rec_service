class Manuscript < ApplicationRecord

  def self.search(search)
    if search
      Manuscript.where(['job_contents LIKE ?', "%#{search}%"])
    else
      Manuscript.all
    end
  end

  def self.pytest(name)
    file_path = Rails.root.join('app', 'models','manuscripts.py').to_s
    system("python #{file_path}")
  end

  def self.search_by_index(idxs)
    Manuscript.find(idxs)
  end

end
