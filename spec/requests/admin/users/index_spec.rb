describe 'Admin see users', type: :feature do
  let!(:admin_user) { create(:admin_user) }
  let!(:users) { create_list(:user, 5) }
  let(:first_user) { users.first }
  let(:last_user) { users.last }
  subject { visit admin_users_path }

  before { sign_in(admin_user) }

  it 'renders the index page' do
    subject
    expect(page).to have_content('Users')
  end

  it 'shows the first user' do
    subject
    expect(page).to have_content(first_user.id)
    expect(page).to have_content(first_user.email)
    expect(page).to have_content(first_user.first_name)
    expect(page).to have_content(first_user.last_name)
    expect(page).to have_content(first_user.username)
    expect(page).to have_content(first_user.sign_in_count)
    expect(page).to have_content(first_user.created_at.strftime('%B %d, %Y %H:%M'))
    expect(page).to have_content(first_user.updated_at.strftime('%B %d, %Y %H:%M'))
  end

  it 'shows the last user' do
    subject
    expect(page).to have_content(last_user.id)
    expect(page).to have_content(last_user.email)
    expect(page).to have_content(last_user.first_name)
    expect(page).to have_content(last_user.last_name)
    expect(page).to have_content(last_user.username)
    expect(page).to have_content(last_user.sign_in_count)
    expect(page).to have_content(last_user.created_at.strftime('%B %d, %Y %H:%M'))
    expect(page).to have_content(last_user.updated_at.strftime('%B %d, %Y %H:%M'))
  end
end
