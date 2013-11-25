require 'spec_helper'

describe "galleries/edit" do
  before(:each) do
    @gallery = assign(:gallery, stub_model(Gallery,
      :product_id => nil,
      :photo_id => nil
    ))
  end

  it "renders the edit gallery form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", gallery_path(@gallery), "post" do
      assert_select "input#gallery_product_id[name=?]", "gallery[product_id]"
      assert_select "input#gallery_photo_id[name=?]", "gallery[photo_id]"
    end
  end
end
