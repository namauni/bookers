class BooksController < ApplicationController
  def new
        # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book = Book.new  
  end

 def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    if book.save
    # 4. トップ画面へリダイレクト
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(book.id)
    else
      
    end
 end
  
  def index
    @books = Book.all  
    @book = Book.new
  end

  def show
     @book = Book.find(params[:id]) 
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id) 
  end
  
  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    @book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト  
  end
  
   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
