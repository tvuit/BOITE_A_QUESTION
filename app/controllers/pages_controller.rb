class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show, :edit, :new, :update, :live_index]

  def home
  end

  def wiki
  end

  def welcome
  end

  def chefsftvi
  end

  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def update
  end


end
