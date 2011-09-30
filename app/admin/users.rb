my_config = {
  
}

ActiveAdmin.register User, :config => my_config do
  scope :admin
  
  filter :email
  filter :created_at
  filter :last_sign_in_at
  filter :current_sign_in_ip
  filter :last_sign_in_ip
  
  index do
    column :admin do |user|
      render "shared/user_admin.erb", :user => user
    end

    column :email do |user|
      link_to user.email, admin_user_path(user)
    end
    
    column :created_at
    column :last_sign_in_at

    column :current_sign_in_ip
    column :last_sign_in_ip
  end
  
  form do |f|
    is_create = f.object.new_record?
    
    f.inputs do
      f.input :email
      f.input :password, :required => is_create 
      f.input :password_confirmation, :required => is_create
      f.input :admin, :as => :select, :collection => [["Yes", true], ["No", false]]      
    end
    f.buttons
  end
  
  show :title => :email do |user|
    attributes_table do
      row :email
      row :admin do
        render "shared/user_admin.erb", :user => user
      end      

      row :created_at
      row :last_sign_in_at

      row :current_sign_in_ip
      row :last_sign_in_ip
    end
  end
  
  sidebar "Usage", :only => :show do
  end
  
  controller do
#    def update
#      user = User.find params[:id]
#      user_params = params[:user]

#      update_user(user, user_params)
          
#      if user.valid?
#        user.save!
#        redirect_to admin_user_path
#      else
#        errors.add user.errors
#        redirect_to edit_admin_user_path
#      end
#    end
    
    def update_resource(user, params)
      user.email = params[:email]
      user.admin = params[:admin]
      
      password = params[:password]
      password_confirmation = params[:password_confirmation]
      
      unless password.empty?
        user.password = password
        user.password_confirmation = password_confirmation
      end
      
      user.save! if user.valid?
    end
  end
end
