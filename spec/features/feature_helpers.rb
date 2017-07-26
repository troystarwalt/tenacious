# This module adds methods with scenarios commonly used in feature specs
module FeatureHelpers
  private

  def will_redirect_to_login_page
    scenario 'redirects to the log in page' do
      expect(current_path).to eq(new_user_session_path)
    end

    scenario 'shows a message saying why the guest was redirected' do
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
