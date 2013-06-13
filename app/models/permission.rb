class Permission
  def initialize(user)

    allow "devise/sessions", [:new, :create, :destroy]
    allow "devise/passwords", [:new, :create, :edit, :update]
    allow "devise/registrations", [:new, :create]

    allow "registrations", [:new, :create]

    if user
      allow :home, [:index]
      allow :reports, [:index]
      allow :attendances, [:index, :new, :create, :toggle]
      allow :attendances, [:edit, :update, :show, :destroy] do |attendance|
        attendance.user_id = user.id
      end
      allow :trackings, [:index, :new, :create]
      allow :trackings, [:edit, :update, :show, :destroy] do |tracking|
        tracking.user_id = user.id
      end
      allow "registrations", [:edit, :update]
      allow "devise/registrations", [:edit, :update]

      if user.can?("ViewProjects", "EditProjects")
        allow :projects, [:index, :show]
      end
      if user.can?("EditProjects")
        allow :projects, [:edit, :update, :destroy]
      end

      if user.can?("ViewRoles", "EditRoles")
        allow :roles, [:index, :show]
      end
      if user.can?("EditRoles")
        allow :roles, [:new, :create, :edit, :update, :destroy]
      end

      if user.can?("ViewUsers", "EditUsers")
        allow :users, [:index, :show]
      end
      if user.can?("EditUsers")
        allow :users, [:edit, :update]
      end

      if user.can?("ViewAllTrackings", "EditAllTrackings")
        allow :trackings, [:show]
        allow :reports, [:admin]
      end
      if user.can?("EditAllTrackings")
        allow :trackings, [:new, :create, :edit, :update, :destroy]
      end

      if user.can?("ViewAllAttendances", "EditAllAttendances")
        allow :attendances, [:show]
      end
      if user.can?("EditAllAttendances")
        allow :attendances, [:new, :create, :edit, :update, :destroy]
      end
    end
  end

  def allow?(controller, action, resource = nil)
    allowed = @allow_all || @allowed_actions[[controller.to_s, action.to_s]]
    allowed && (allowed == true || resource && allowed.call(resource))
  end

  def allow_all
    @allow_all = true
  end

  def allow(controllers, actions, &block)
    @allowed_actions ||= {}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = block || true
      end
    end
  end

  def allow_param(resources, attributes)
    @allowed_params ||= {}
    Array(resources).each do |resource|
      @allowed_params[resource] ||= []
      @allowed_params[resource] += Array(attributes)
    end
  end

  def allow_param?(resource, attribute)
    if @allow_all
      true
    elsif @allowed_params && @allowed_params[resource]
      @allowed_params[resource].include? attribute
    end
  end

  def permit_params!(params)
    if @allow_all
      params.permit!
    elsif @allowed_params
      @allowed_params.each do |resource, attributes|
        if params[resource].respond_to? :permit
          params[resource] = params[resource].permit(*attributes)
        end
      end
    end
  end
end
