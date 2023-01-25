module AccountBlock
    class  UsersController < ApplicationController
        def index
            @users = AccountBlock::User.all
            render json: @users
        end

        def create
            @user = AccountBlock::User.create(user_params)
            token = encode_token({user_id: @user.id})
            render json: {user: @user,token: token},status: :ok
            
        end
        def login
            @user = AccountBlock::User.find_by(name: user_params[:name])
            if @user && @user.authenticate(user_params[:password])
                token = encode_token({user_id: @user.id})
                render json: {user: @user,token: token},status: :ok
            else
                render json: {error: 'invalid'},status: :unprocessable_entity 
            end 
        end
        def authorized
            decoded_token = decode_token()
            if decoded_token
                user_id = decoded_token[0]['user_id']
                @user = AccountBlock::User.find_by(id: user_id)
            end
        end
        def authorize
            render json: {message: 'you hve to login'},status: :unprocessable_entity unless authorized
        end
        def user_params
            params.permit(:name,:password)
        end
  
    end
end