class Manuscript < ApplicationRecord

  def self.search(search)
    if search
      Manuscript.where(['job_content LIKE ?', "%#{search}%"])
    else
      Manuscript.all
    end
  end

  def self.pytest(search)
    if search
      search_words = search.split(/[[:blank:]]/) #空白で単語を区切る
      CSV.open('search_words.csv','w') do |words|
        words << search_words
      end
      file_path = Rails.root.join('search_by_lda','src','search.py').to_s
      python_path = Rails.root.join('search_by_lda').to_s
      system("cd #{python_path}")
      system("python #{file_path}")
      idxs = CSV.read('test.csv', headers: false)[0]
      Manuscript.search_by_index(idxs)
    else
      Manuscript.all
    end
  end

  def self.search_by_index(idxs)
    Manuscript.find(idxs)
  end

end
