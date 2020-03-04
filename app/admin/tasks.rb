ActiveAdmin.register Task do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :content, :state, :user_id
  form title: 'Create post' do |f|
    inputs 'Details' do
      input :user_id
      input :name
      input :content
      input :state
      f.actions
    end
  end
  #
  # or
  #
  # permit_params do
  #permitted = [:user_id, :name, :content, :state]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
