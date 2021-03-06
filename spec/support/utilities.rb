include ApplicationHelper
#def full_title(page_title)
#  base_title = "Ruby on Rails Tutorial Sample App"
#  if page_title.empty?
#    base_title
#  else
#    "#{base_title} | #{page_title}"
#  end
#end

def sign_in(user, options={})
  if options[:no_capybara]
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
  else
    visit signin_path
    fill_in "Email", with:user.email
    fill_in "Password", with:user.password
    click_button "Sign in"
  end
end

def valid_signin(user)
  fill_in "Email",  with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

Rspec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text:message)
  end
end


Rspec::Matchers.define :have_succsess_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-success', text:message)
  end
end

def valid_singup
  fill_in "Name",               with: "Example User"
  fill_in "Email",              with: "user@example.com"
  fill_in "Password",           with: "foobar"
  fill_in "Confirmation",       with: "foobar"
end
