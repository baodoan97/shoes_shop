
class Admins::UsersController < BaseController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    def index
      @users = User.all
    end
      # GET /categories/1
      # GET /categories/1.json
      def show

      end
    
      # GET /categories/new
      def new
        @user1 = User.new
      end
    
      # GET /categories/1/edit
      def edit
      end
      #scope :created_in_time, ->(start_time, end_time){where(created_at: start_time..end_time)}
      # POST /categories
      # POST /categories.json
      def create
       # debugger
            @user1 = Admins::User.new(user_params)
            
            if @user1.save
                    #session[:user_id] = @categories.id
                #	flash[:success] = "ssASAs, #{@categories.name}"
                    redirect_to admins_users_path()
                else
                    render 'new'
                end
      end
      def update
        if @user1.update(user_params)
      
            flash[:success] =  'User was successfully updated.'
            redirect_to admins_users_path(@user1)
            else
             render 'edit'
            end
      end
    
      # DELETE /categories/1
      # DELETE /categories/1.json
      def destroy
        @user1.destroy
        redirect_to admins_users_path
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user1 = Admins::User.find(params[:id])
        end
        def user_params
            params.permit(:email, :password)
          end
    
end