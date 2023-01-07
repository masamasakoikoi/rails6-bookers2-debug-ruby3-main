class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    if @book_comment.save
      render :comments #render先にjsファイルを指定
    else
      render 'books/show'
    end
  end

  def destroy
    BookComment.find(params[:id]).destroy
    #renderしたときに@postのデータがないので@postを定義
    @book = Book.find(params[:book_id])  
    render :comments #render先にjsファイルを指定
  end
  
  private
  
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
