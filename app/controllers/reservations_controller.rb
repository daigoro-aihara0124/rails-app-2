class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path(@reservation)
      flash[:notice] = "ルーム予約をしました"
    else
      redirect_to new_reservation_path
      flash.now[:alert] = "ルーム予約に失敗しました"
    end

  end

  def show
    @reservation = Reservation.find(params[:id])
    @reservations = @current_user.reservations
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :num_people, :user_id, :post_id)
  end

 end
