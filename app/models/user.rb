class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  rolify






  def president?
    self.has_role?(:president)
  end

  def defence_secretary?
    self.has_role?(:defence_secretary)
  end

  def russian?
    self.has_role?(:russians)
  end
end
