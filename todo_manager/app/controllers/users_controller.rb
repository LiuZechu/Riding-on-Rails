class UsersController < Clearance::UsersController
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to admin_path
	end
end
