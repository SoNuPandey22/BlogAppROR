class PostsController < ApplicationController
 def index
  @posts = Post.all.order(created_at: :desc)
 end
 
 def new
 	@post = Post.new
 end

 def show
 	@post = Post.where(id: params[:id]).first
 	if !@post
 		redirect_to root_path
 	else
 		@post.update(views: @post.views+1)
    end
 end

 def edit
 	@post = Post.where(id: params[:id]).first
    if !@post
      redirect_to root_path
    end	
 end

 def update
  @post = Post.where(id: params[:id]).first
  if !@post
    redirect_to root_path
  else
    if @post.update(title: params[:post][:title], content: params[:post][:content])
      flash[:notice] = 'Successfully updated the post!'
      redirect_to show_post_path(id: @post.id)
    else
      flash[:alert] = 'Couldn’t edit the post...'
      render :edit
    end
  end
end

def destroy
  @post = Post.where(id: params[:id]).first
  if !@post
    redirect_to root_path
  else
    if @post.destroy
      flash[:notice] = 'Successfully deleted the post!'
      redirect_to root_path
    else
      flash[:alert] = 'Couldn’t delete the post...'
      redirect_to show_post_path(id: @post.id)
    end
  end
end

def create 
	@post = Post.new(title: params[:post][:title], content: params[:post][:content])
	if @post.save
		flash[:notice] = 'Successfully created'
		redirect_to root_path
	else 
		flash[:alert] = 'Oops, something went wrong..'
		render  :new
	end
end

end

