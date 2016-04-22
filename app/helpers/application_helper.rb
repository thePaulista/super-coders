module ApplicationHelper

  def login_logout
    if current_user
      link_to "Logout", logout_path, method: :delete
    else
      link_to "Login", login_path
    end
  end

  def history_create_account
    if current_user
      link_to "History", history_path
    else
      link_to "Create Account", new_user_path
    end
  end

  def team_page_login
    if current_user
      link_to 'Create Team', contracts_path, method: :post
    else
      "#{link_to('Login', login_path)} or #{link_to('Create Account', new_user_path)} to create your dream team".html_safe
    end
  end
end
