Rails.application.routes.draw do

  # User Devise Routes
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords', confirmations: 'users/confirmations'}
  root 'user_dashboards#index'

  scope '/admin' do
    get 'dashboard', to: 'admin/dashboards#index', as: 'admin_dashboard'
    get 'invite-candidate', to: 'admin/users#invite_candidate', as: 'invite_candidate'
    post 'send_invitation_to_candidate', to: 'admin/users#send_invitation_to_candidate', as: 'send_invitation_to_candidate'
    get 'online-candidates', to: 'admin/users#online_candidates',as: 'online_candidates'
    get 'reports', to: 'admin/reports#candidate_reports', as: 'candidate_report'
    get 'candidates', to:  'admin/users#candidates', as: 'candidates'
    get 'questions', to: 'admin/questions#index', as: 'questions'
    post 'check-user', to: 'admin/users#check_user', as: 'check_user'
  end
  get 'dashboard', to: 'user_dashboards#dashboard', as: 'user_dashboard'
  get 'start-test', to: 'user_dashboards#user_set', as: 'user_set'
  post '/update-answer', to: 'user_dashboards#update_answer'
  post '/submit-answer', to: 'user_dashboards#submit_answer'
  post 'timeis-up', to: 'user_dashboards#timeis_up',as:'timeis_up'
  get '/ThankYou', to: 'user_dashboards#thank_you',as:'thank_you'
  get '/404_error', to: 'static_pages#crash'

end
