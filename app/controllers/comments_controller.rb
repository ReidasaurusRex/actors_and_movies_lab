class CommentsController < ApplicationController
  
  def create
    binding.pry
    c = Comment.new comment_params.merge({user_id: session[:user_id]})
    find_commentable.comments << c
    redirect_to "/#{find_class}/#{find_commentable.id}"
  end

  def delete
    binding.pry
    redirect_to "/#{find_class}/#{find_commentable.id}" 
  end

  private
    def comment_params
      params.require(:comment).permit(:id, :content)
    end

    def find_commentable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end

    def find_class
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.to_s.downcase.pluralize
        end
      end
    end
end
