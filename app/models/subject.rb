class Subject < ApplicationRecord
  belongs_to :course
  belongs_to :suppervisor, class_name: User.name
end
