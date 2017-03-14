require 'rails_helper'

RSpec.describe JobSearcher, type: :model do
  let(:page) { 1 }
  let(:location) { ["Palo Alto, CA"] }
  let(:category) { ["Research"] }
  let(:level) { ["Internship"] }
  let(:company) { ["Facebook", "Airbnb"] }

  let(:query) do
    { location: location, category: category, level: level, company: company }
  end

  subject do
    described_class.new(page, query)
  end

  specify { expect(subject.class.base_uri).to eq 'http://api-v2.themuse.com' }
  specify { expect(subject.query).to eq query.merge({ page: page }) }
  # TODO: mock out the call, add integration test
end
