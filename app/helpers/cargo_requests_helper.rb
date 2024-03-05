module CargoRequestsHelper
  def toggle_order(column)
    if params[:sort_by] == column.to_s
      if params[:sort_order] == 'asc' || params[:sort_order].nil?
        params[:sort_order] = 'desc'
      else
        params[:sort_order] ='asc'
      end
    end

  end
end
