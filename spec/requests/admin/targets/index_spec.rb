describe 'Admin see targets', type: :feature do
  let!(:admin_user) { create(:admin_user) }
  let!(:targets) { create_list(:target, 10) }
  let(:first_target) { targets.first }
  let(:last_target) { targets.last }
  subject { visit admin_targets_path }

  before { sign_in(admin_user) }

  it 'renders the index page' do
    subject
    expect(page).to have_content('Targets')
  end

  it 'shows the first target' do
    subject
    expect(page).to have_content(first_target.id)
    expect(page).to have_content(first_target.topic.name)
    expect(page).to have_content(first_target.user.full_name)
    expect(page).to have_content(first_target.title)
    expect(page).to have_content(first_target.radius)
    expect(page).to have_content(first_target.latitude)
    expect(page).to have_content(first_target.longitude)
    expect(page).to have_content(first_target.created_at.strftime('%B %d, %Y %H:%M'))
    expect(page).to have_content(first_target.updated_at.strftime('%B %d, %Y %H:%M'))
  end

  it 'shows the last target' do
    subject
    expect(page).to have_content(last_target.id)
    expect(page).to have_content(last_target.topic.name)
    expect(page).to have_content(last_target.user.full_name)
    expect(page).to have_content(last_target.title)
    expect(page).to have_content(last_target.radius)
    expect(page).to have_content(last_target.latitude)
    expect(page).to have_content(last_target.longitude)
    expect(page).to have_content(last_target.created_at.strftime('%B %d, %Y %H:%M'))
    expect(page).to have_content(last_target.updated_at.strftime('%B %d, %Y %H:%M'))
  end
end
