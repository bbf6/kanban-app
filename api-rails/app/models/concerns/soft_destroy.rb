module SoftDestroy
  extend ActiveSupport::Concern

  included do
    default_scope { where active: true }
  end

  def destroy
    update active: false
  end
end
