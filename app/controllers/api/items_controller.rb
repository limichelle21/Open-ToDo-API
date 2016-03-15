class Api::ItemsController < ApiController
	before_action :authenticated?

	def index
		list = List.find(params[:list_id])
		items = list.items
		render json: items
	end

	def create
		item = current_user.list.items.build(item_params)
		if item.save
			render json: item
		else
			render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def update
		item = Item.find(params[:id])
		if item.user == current_user
			if item.update(item_params)
				render json: item
			else
				render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
			end
		else
			render json: { errors: ['You are not authorized to update this item']}, status: 401
		end
	end

	private
	def item_params
		params.require(:item).permit(:item, :completed)
	end
end
