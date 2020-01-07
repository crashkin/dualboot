class User < ApplicationRecord
  has_secure_password
  has_many :my_tasks, class_name: 'Task', foreign_key: :author_id
  has_many :assigned_tasks, class_name: 'Task', foreign_key: :assignee_id

  # how to create one validates record for many fields?
  validates :first_name, length: { minimum: 2}
  validates :last_name, length: { minimum: 2 }
  validates :email, uniqueness: { case_sensitive: false }, format: { with: /\A\S+@.+\.\S+\z/ }
end
