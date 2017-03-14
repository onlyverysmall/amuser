require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:name) { "UX Researcher, Intern/Co-op" }
  let(:publication_date) { "2017-02-27T17:13:09.303516Z" }
  let(:locations) { [{ name: "Palo Alto, CA" }] }
  let(:categories) { [{ name: "Research" }] }
  let(:levels) { [{ name: "Internship" }] }
  let(:refs) { { landing_page: "https://www.themuse.com/jobs/facebook/ux-researcher-interncoop-206d87" } }
  let(:company) { { name: "Facebook" } }

  subject do
    described_class.new({
      name: name,
      publication_date: publication_date,
      locations: locations,
      categories: categories,
      levels: levels,
      refs: refs,
      company: company
    })
  end

  specify { expect(subject.name).to eq name }
  specify { expect(subject.pub_date).to eq Time.new(publication_date) }
  specify { expect(subject.locations).to eq locations.map { |x| x[:name] } }
  specify { expect(subject.categories).to eq categories.map { |x| x[:name] } }
  specify { expect(subject.levels).to eq levels.map { |x| x[:name] } }
  specify { expect(subject.landing).to eq refs[:landing_page] }
  specify { expect(subject.company).to eq company[:name] }

end
