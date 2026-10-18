module Users
  class RegistrationsController < Devise::RegistrationsController
    # Регистрацию вызывают и внешние клиенты без формы (заготовка пользователей в автотестах),
    # у них нет CSRF-токена
    skip_forgery_protection only: :create
  end
end
