class ViewController < ApplicationController
  require 'csv'
  def show_result
    Manuscript.pytest(params[:search])
    #現状ではsearch_words.csv
    # pytestによって出力されたファイルからidを読んで.whereで選択する。
    idxs = CSV.read('test.csv', headers: false)[0] #idxsは２次元配列なので要素を取り出す
    # 本来はここをread('ans_id.csv')とする。今はデータが違うのでだめ。
    @manuscripts = Manuscript.search_by_index(idxs)
    # @rec_idxs = idxs
    # @manuscript = Manuscript.where([])
  end
end
