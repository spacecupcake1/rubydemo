class GreetingsController < ApplicationController
    before_action :set_greeting, only: [:show, :edit, :update, :destroy]
  
    def index
      @greetings = Greeting.all
    end
  
    def show
    end
  
    def new
      @greeting = Greeting.new
    end
  
    def create
      @greeting = Greeting.new(greeting_params)
      if @greeting.save
        redirect_to @greeting, notice: 'Greeting was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @greeting.update(greeting_params)
        redirect_to @greeting, notice: 'Greeting was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @greeting.destroy
      redirect_to greetings_url, notice: 'Greeting was successfully destroyed.'
    end
  
    private
  
    def set_greeting
      @greeting = Greeting.find(params[:id])
    end
  
    def greeting_params
      params.require(:greeting).permit(:message)
    end
  end
  
