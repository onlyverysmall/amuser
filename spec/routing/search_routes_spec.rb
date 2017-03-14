require 'rails_helper'

RSpec.describe "search routes", type: :routing do
  it "routes root to search#new" do
    expect(get: "/").to route_to(
      controller: "search",
      action: "new"
    )
  end

  it "routes root to search#create" do
    expect(post: "/").to route_to(
      controller: "search",
      action: "create"
    )
  end
end
