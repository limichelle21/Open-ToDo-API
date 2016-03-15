class Api::ListsController < ApiController
	before_action :authenticated?

	def index
		lists = current_user.lists
		render json: lists
	end

	def create
		list = current_user.lists.build(list_params)
		if list.save
			render json: list
		else
			render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def destroy
		begin
			list = List.find(params[:id])
			list.destroy
			render json: { success: true }, status: :no_content
		rescue ActiveRecord::RecordNotFound
			render :json => { success: false }, :status => :not_found
		end
	end

	def update
		list = List.find(params[:id])
		if list.user == current_user || list.public?
			if list.update(list_params)
				render json: list
			else
				render json: { errors: list.errors.full_messages }, status: 500
			end
		else
			render json: { errors: ['You are not authorized to update this list']}, status: 401
		end
	end

	private
	def list_params
		params.require(:list).permit(:title)
	end

end
