ActiveAdmin.register Order do

actions :index
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name, :address, :email, :pay_type
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


index do
    selectable_column
    id_column
    column :name
    column :address
    column :email
    column :pay_type
    actions
  end

  filter :name
  filter :email
  filter :pay_type

  form do |f|
    f.inputs "order Details" do
      f.input :name
      f.input :address
      f.input :email
      f.input :pay_type
      
    end
    f.actions
  end

end
