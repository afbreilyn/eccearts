class Admin::ItemsController < Admin::BaseController

  # before_action :authenticate_admin!

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      redirect_to admin_items_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      # flash[:notice] = t('success', obj: 'meow meow', past_participle: 'deleted')
    end
    redirect_to admin_items_path
  end

  def hide_item
    @item = Item.find(params[:id])
    @item.update_attributes({ hidden: !@item.hidden })
    redirect_to admin_items_path
  end

  def update_row_order
    @item = Item.find(item_params[:item_id])
    @item.row_order = item_params[:row_order]
    @item.save!

    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end

  protected

    def item_params
      params.require(:item).permit(
        :title,
        :description,
        :donate_button,
        :item_id,
        :row_order,
        :date,
        :location,
        :price_line
      )
    end
end
