class User < ApplicationRecord
  has_one :travel_profile, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  after_create :build_travel_profile

  def onboarding_complete?
    onboarding_completed == true
  end

  private

  def build_travel_profile
    create_travel_profile unless travel_profile.present?
  end
end
