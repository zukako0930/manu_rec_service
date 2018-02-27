class ViewController < ApplicationController
  require 'csv'
  def index
  end
  def show_result
    Manuscript.pytest('')
    # pytestによって出力されたファイルからidを読んで.whereで選択する。
    idxs = CSV.read('test.csv', headers: false)[0] #idxsは２次元配列なので要素を取り出す
    @manuscripts = Manuscript.search_by_index(idxs)
    # @rec_idxs = idxs
    # @manuscript = Manuscript.where([])
  end
end
