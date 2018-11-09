class PostsController < ApplicationController
    get '/posts' do #index
        @posts = Post.all
        erb :'posts/index'
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
        p = Post.new(params)
        if p.save
            redirect "/posts/#{p.id}"
        else
            redirect "/posts/new"
        end
    end

end