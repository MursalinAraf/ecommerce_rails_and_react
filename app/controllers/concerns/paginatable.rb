module Paginatable
  def paginate(collection)
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    
    result = collection.page(page).per(per_page)

    {
      current_page: result.current_page,
      total_pages: result.total_pages, 
      per_page: result.limit_value,
      collection: result,
      total_count: result.total_count
    }

  end
end