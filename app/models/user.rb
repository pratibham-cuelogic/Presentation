class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  belongs_to :role
  has_many :user_sets

  # Send invitation to candidate to join test
  def self.send_invitation(params, invitee)
    role_id = Role.select('id').where(role_type: 'candidate').first.id rescue nil
    user = new(email: params['email'].first, full_name: params['full_name'].first, phone_no: params['phone_no'].first, password: 'cuehunt2016', password_confirmation: 'cuehunt2016',status: INVITATION_ACCEPTED, role_id: role_id)
    if user.save
      user_set = UserSet.create_user_set(params[:technology_id] ,user.id, invitee.id)
      if user_set.present?
        question_ids = Question.order("RANDOM()").where(technology_id: params[:technology_id]).limit(10).collect(&:id)
        QuestionSet.create_set(question_ids, user_set.id)
      end
    end
  end

  scope :of_type, -> (type) { where(role_id: Role.find_by_role_type(type))}
  # User role
  def is_admin?
    return false if role.blank?
    role.role_type == 'admin'? true : false
  end

  # Current set
  def current_set
    user_sets.last
  end

  # Submit all answers
  def submit_answers
    current_set.update_attributes(status: SET_FINISHED, score: score, end_time: Time.now)
    update_attributes(status: NO_ACCESS)
    AdminNotifier.send_admin_report(current_set).deliver
  end

  # User last test score
  def score
    current_set.question_sets.select('id').where(is_correct: true).count
  end

  # Get list of online candidates
  def self.online_users
    where("last_seen_at >= ?", Time.now - 5.minutes)
  end

  # Resend invitation
  def self.resend_invitation_to_user(user, invitee, params)
    user_set = UserSet.create_user_set(params[:technology_id] ,user.id, invitee.id)
    if user_set.present?
      question_ids = Question.order("RANDOM()").where(technology_id: params[:technology_id]).limit(10).collect(&:id)
      QuestionSet.create_set(question_ids, user_set.id)
    end
    user.update_attributes(status: INVITED)
    AdminNotifier.resend_invitation_email(user).deliver
  end

end
