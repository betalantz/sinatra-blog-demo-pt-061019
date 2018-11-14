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
        @users = User.all
        @post = Post.find_by_id(params[:id])
        erb :'posts/edit'
    end
    
    patch "/posts/:id" do 
        @post = Post.find_by_id(params[:id])
        params.delete("_method")
        if @post.update(params)
            redirect "/posts/#{@post.id}"
        else
            redirect "/posts/#{@post.id}/edit"
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