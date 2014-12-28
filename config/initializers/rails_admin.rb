RailsAdmin.config do |config|
  require 'i18n'
  I18n.default_locale = :ru

  ### Popular gems integration

  config.authenticate_with do
    require_login
  end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan
  config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin
  end

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.excluded_models = ["Authentication"]
  RailsAdmin.config { |c| c.label_methods << :last_name }

  config.model 'Address' do
    visible false
  end

  config.model 'PaymentSystem' do
    visible false
  end

  config.actions do
    dashboard # mandatory
    index # mandatory
    new
    export
    bulk_delete
    show
    edit do
      except ['Payment']
    end
    delete do
      except ['Payment']
    end
    show_in_app do
      except ['Payment']
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
