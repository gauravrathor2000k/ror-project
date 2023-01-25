module AccountBlock
    class  AccountsController < ApplicationController
        def index
            @accounts = AccountBlock::Account.all
            render json: @accounts
        end

        def create
            
        end
  
    end
end