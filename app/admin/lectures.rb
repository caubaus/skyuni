ActiveAdmin.register Lecture do
  permit_params :title, :note, :video, :header, :tag, :course_id
  sortable tree: false, # default
           sorting_attribute: :tag

  index :as => :sortable do
    label :title # item content
    actions
  end

  index do
    selectable_column
    column :header
    column :title
    column :tag
    column :course

    actions
  end

  form do |f|
    f.inputs do
      input :course, label: "Course"
      input :title, label: "Title"
      input :note, label: "Note"
      input :video, label: "Video"
      input :header, label: "Header"

    end
    actions
  end
end
