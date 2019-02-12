ActiveAdmin.register Course do
  permit_params :name, :content, :price, :instructor, :image

  show do |t|
    attributes_table do
        row :name
        row :content
        row :price
        row :instructor
        row :image do
          course.image? ? image_tag(course.image.url, height: '100') : content_tag(:span, "No Photo Yet")
        end
    end
  end

  form :html => {:enctype => "multipart/form-data"} do |f|
    f.inputs do
      f.input :name
      f.input :content
      f.input :price
      f.input :instructor
      f.input :image, hint: f.course.image? ? image_tag(course.image.url, height: '100') : content_tag(:span, "Upload jpg/png/gif image")
    end
    f.actions
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
