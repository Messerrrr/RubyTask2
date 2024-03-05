require_relative '../cargo.rb'

class CargoRequestsController < ApplicationController
  def index
    @cargo_requests = CargoRequest.where(user_id: current_user.id).page(params[:page]).per(2)

    sort_by = params[:sort_by]
    #sort_order = params[:sort_order] || "asc"
   # sort_direction = sort_order == "asc" ? :asc : :desc
    # Применение сортировки
    @cargo_requests = @cargo_requests.order(sort_column + ' ' + sort_direction) if sort_by.present?

  end



  def show
    @cargo_request = CargoRequest.find(params[:id])
  end
  def new
    @cargo_request = CargoRequest.new
  end
  def create
    cargo_instance = Cargo.new(cargo_params[:weight].to_f, cargo_params[:length].to_f, cargo_params[:width].to_f, cargo_params[:height].to_f, cargo_params[:origin], cargo_params[:destination])
    result = cargo_instance.calculate_price
    #cargo_params[:distance] = result[:distance]
    #cargo_params[:price] = result[:price]
    mergedhash = cargo_params.merge(result)
    @cargo_request = current_user.cargo_requests.create(mergedhash)
    @cargo_request.status = "Accepted"
     # cargo_params[:firstname],cargo_params[:lastname],
      #                                                  cargo_params[:middlename], cargo_params[:phone],
       #                                                 cargo_params[:email], cargo_params[:weight],
        ###                                              cargo_params[:destination], result[:distance],
           #                                             result[:price])
    if  @cargo_request.save
      redirect_to @cargo_request
    else
      render :new, status: :unprocessable_entity
    end

  end

    private
    def cargo_params
      params.require(:cargo_request).permit(:firstname, :lastname, :middlename, :phone, :email, :weight, :length, :width, :height, :origin, :destination)
    end


     def sort_column
    # Добавьте нужные параметры сортировки в этот метод
    # По умолчанию сортировка будет происходить по id
     ['created_at', 'price', 'distance'].include?(params[:sort_by]) ? params[:sort_by] : 'id'
     end

  def sort_direction
     ['asc', 'desc'].include?(params[:sort_order]) ? params[:sort_order] : 'asc'
  end

end
