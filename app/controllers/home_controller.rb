# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if session[:email].present?
      redirect_to boards_path
    else
      render :index, status: :ok
    end
  end

  def create
    session[:email] = email
    redirect_to boards_path
  end

  def exit
    session[:email] = ''
    redirect_to root_path
  end

  private

  def email
    params.require(:email)
  end
end
