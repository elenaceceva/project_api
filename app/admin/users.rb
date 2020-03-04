ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :email, :password
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form title: 'Form for new user' do |f|
    inputs 'Details' do
      input :email
      input :password
      actions
    end
  end

   index do
     column :email
     column :created_at
     actions
   end

   show do
     attributes_table :email, :created_at
   end

end
