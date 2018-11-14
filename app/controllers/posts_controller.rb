class PostsController < ApplicationController
    get '/posts' do #index
        if session["user_id"]
            @user = current_user
            @posts = current_user.posts
            
            erb :'posts/index'
        else

            redirect '/signup'
        end
    end
    
    get "/posts/new" do 
        @users = User.all
        erb :'posts/new'
    end

    get "/posts/:id/edit" do 
        user = Post.find_by_id(params[:id]).user
         if user.id == current_user.id
            @users = User.all
            @post = Post.find_by_id(params[:id])
            erb :'posts/edit'
        else 
            flash[:err] = "This post does not belong to you!"
            redirect "/posts"
        end
    end
    
    patch "/posts/:id" do 
        user = Post.find_by_id(params[:id]).user
        if user.id == current_user.id
            @post = Post.find_by_id(params[:id])
            params.delete("_method")
            if @post.update(params)
                redirect "/posts/#{@post.id}"
            else
                redirect "/posts/#{@post.id}/edit"
            end
        else
            @error = "This post does not belong to you"
            erb :"/posts/index"
        end
    end

    get '/posts/:id' do #show
        @post = Post.find_by_id(params[:id])

        if @post 
            erb :'posts/show'
        else
            redirect "/posts"
        end
    end

    post "/posts" do
        user = User.find_by_id(session["user_id"])
        @p = user.posts.build(params)
        
        if @p.save
            redirect "/posts"
        else
            erb  :"/posts/new"
        end
    end

end