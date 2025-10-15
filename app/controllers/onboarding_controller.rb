class OnboardingController < ApplicationController
  STEPS = %w[hobbies travel_preferences goals complete].freeze

  def show
    @step = params[:step] || 'hobbies'
    @user = current_user_placeholder
    @travel_profile = @user.travel_profile

    unless STEPS.include?(@step)
      redirect_to onboarding_path(step: 'hobbies')
      return
    end

    render "onboarding/#{@step}"
  end

  def update
    @user = current_user_placeholder
    @travel_profile = @user.travel_profile
    @step = params[:step]

    case @step
    when 'hobbies'
      @travel_profile.update(hobbies: params[:hobbies])
      redirect_to onboarding_path(step: 'travel_preferences')
    when 'travel_preferences'
      @travel_profile.update(
        travel_style: params[:travel_style],
        budget_range: params[:budget_range],
        trip_length_preference: params[:trip_length_preference],
        adventure_level: params[:adventure_level]
      )
      redirect_to onboarding_path(step: 'goals')
    when 'goals'
      @travel_profile.update(destinations_interested: params[:destinations])
      @user.update(onboarding_completed: true)
      redirect_to onboarding_path(step: 'complete')
    end
  end

  private

  def current_user_placeholder
    # Temporary: Create or find a demo user
    # Replace this with actual authentication later
    @current_user ||= User.find_or_create_by(email: 'demo@example.com') do |user|
      user.name = 'Demo User'
    end
  end
end
